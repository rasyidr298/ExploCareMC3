//
//  ObjectRecogViewController.swift
//  learnEnglish
//
//  Created by Rasyid Ridla on 23/06/22.
//

import UIKit
import SwiftUI
import Vision
import AVFoundation

class ObjectRecogViewController: UIViewController {
    
    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var boxesCameraView: DrawingBoundingBoxView!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var bgLevelView: UIView!
    @IBOutlet weak var objectImageView: UIImageView!
    @IBOutlet weak var guideObjectName: UILabel!
    @IBOutlet weak var guideDescLabel: UILabel!
    @IBOutlet weak var charImageView: UIImageView!
    
    public var category: Category?
    private let measure = Measure()
    var player = AVService.shared
    var indexObjectRecog = 0
    var isTutorial = false
    
    // MARK: - Init Model Core ML
    let objectDectectionModel = YOLOv3Tiny()
    
    // MARK: - Vision Properties
    var request: VNCoreMLRequest?
    var visionModel: VNCoreMLModel?
    var isInferencing = false
    
    // MARK: - AV Property
    var videoCapture: VideoCapture!
    let semaphore = DispatchSemaphore(value: 1)
    var lastExecution = Date()
    
    var helpTimer = Timer()
    var helpCouter = 60
    var matchIndex = 0
    var indexList: [Int] = []
    
    var viewModel = ObjectRecogViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpModel()
        setUpCamera()
        setupView()
        startHelpTimer()
        playMusic()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        resizePreviewLayer()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.videoCapture.start()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.videoCapture.stop()
        helpTimer.invalidate()
    }
    
    @IBAction func closeButton(_ sender: Any) {
        let vc = HomeVC()
        navigationController?.pushViewController(vc, animated: true)
        
        //push value to iwatch
        viewModel.sendMessageToIwatch(name: udUserName, time: 0, startExplore: false)
    }
}

// MARK: - VideoCaptureDelegate
extension ObjectRecogViewController: VideoCaptureDelegate {
    func setUpCamera() {
        videoCapture = VideoCapture()
        videoCapture.videoDelegate = self
        videoCapture.fps = 60
        videoCapture.setUp(sessionPreset: .hd4K3840x2160) { success in
            
            if success {
                // add preview view on the layer
                if let previewLayer = self.videoCapture.previewLayer {
                    self.cameraView.layer.addSublayer(previewLayer)
                    self.resizePreviewLayer()
                }
                
                // start video preview when setup is done
                self.videoCapture.start()
            }
        }
    }
    
    func videoCapture(_ capture: VideoCapture, didCaptureVideoFrame pixelBuffer: CVPixelBuffer?, timestamp: CMTime) {
        // the captured image from camera is contained on pixelBuffer
        if !self.isInferencing, let pixelBuffer = pixelBuffer {
            self.isInferencing = true
            // start of measure
            self.measure.start()
            // predict!
            self.predictUsingVision(pixelBuffer: pixelBuffer)
        }
    }
}

// MARK: - Vision & CoreML
extension ObjectRecogViewController {
    func setUpModel() {
        if let visionModel = try? VNCoreMLModel(for: objectDectectionModel.model) {
            self.visionModel = visionModel
            request = VNCoreMLRequest(model: visionModel, completionHandler: visionRequestDidComplete)
            request?.imageCropAndScaleOption = .scaleFill
        } else {
            fatalError("fail to create vision model")
        }
    }
    
    func predictUsingVision(pixelBuffer: CVPixelBuffer) {
        guard let request = request else { fatalError() }
        // vision framework configures the input size of image following our model's input configuration automatically
        self.semaphore.wait()
        let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer)
        try? handler.perform([request])
    }
    
    func visionRequestDidComplete(request: VNRequest, error: Error?) {
        self.measure.label(with: "endInference")
        if let predictions = request.results as? [VNRecognizedObjectObservation] {
            //matching object
            if indexObjectRecog <= 4 {
                if category?.object[indexObjectRecog].objectName == predictions.first?.labels.first?.identifier {
                    matchingObject(objectRecog: (category?.object[indexObjectRecog])!)
                        indexObjectRecog += 1
                }
            }
            
            DispatchQueue.main.async {
                self.boxesCameraView.predictedObjects = predictions
                self.measure.stop()
                self.isInferencing = false
            }
        } else {
            // end of measure
            self.measure.stop()
            self.isInferencing = false
        }
        self.semaphore.signal()
    }
}

// MARK: - ResultModalDelegate
extension ObjectRecogViewController: ResultModalDelegate {
    func onNextButttonPressed(){
        if isTutorial {
            helpTimer.invalidate()
            let vc = ResultTutorialViewController()
            vc.category = self.category
            navigationController?.pushViewController(vc, animated: true)
        }else {
            if indexObjectRecog >= (category?.object.count)! {
                indexObjectRecog = 0
                helpTimer.invalidate()
                
                //to feedback page
                let feedbackView = UIHostingController(rootView: FeedbackView(object: category!.object))
                navigationController?.pushViewController(feedbackView, animated: true)
            }else {
                playMusic()
                startHelpTimer()
                
                guideDescLabel.text = "\(textFirstGuide()), let's find "
                guideObjectName.text = category!.object[indexObjectRecog].name
                objectImageView.image = (category?.object[indexObjectRecog].objectImage)!
            }
            
        }
        viewModel.sendMessageToIwatch(name: udUserName, time: 0, startExplore: true)
    }
    
    func onSpeakerButttonPressed(object: ObjectRecog) {
        player.playFeedbackSound(objectRecog: object)
    }
}

// MARK: - HelpModalDelegate
extension ObjectRecogViewController: HelpModalDelegate {
    func onCloseButton() {
        startHelpTimer()
    }
}

// MARK: - Custom function
extension ObjectRecogViewController {
    
    @objc func updateHelpTimerCounter() {
        if helpCouter > 0 {
            print("\(helpCouter) to show help modal")
            helpCouter -= 1
        }else {
            showHelpModal()
        }
    }
    
    func setupView() {
        bgLevelView.layer.cornerRadius = 12
        objectImageView.layer.cornerRadius = 12
        levelLabel.text = category?.categoryName
        charImageView.image = category?.charImage
        guideDescLabel.text = "\(textFirstGuide()), let's find "
        guideObjectName.text = category!.object[indexObjectRecog].name
        objectImageView.image = (category?.object[indexObjectRecog].objectImage)!
    }
    
    func resizePreviewLayer() {
        videoCapture.previewLayer?.frame = cameraView.bounds
    }
    
    func showResultModal(object: ObjectRecog) {
        let resultModal = ResultModalVC(object: object, index: indexObjectRecog, isTutorial: self.isTutorial, categoryName: self.category!.categoryName)
        resultModal.delegate = self
        present(resultModal, animated: true)
    }
    
    func showHelpModal() {
        helpTimer.invalidate()
        let helpModal = HelpModalVC()
        helpModal.delegate = self
        present(helpModal, animated: true)
    }
    
    func startHelpTimer() {
        helpCouter = 60
        helpTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateHelpTimerCounter), userInfo: nil, repeats: true)
    }
    
    func matchingObject(objectRecog: ObjectRecog) {
        DispatchQueue.main.async { [unowned self] in
            showResultModal(object: objectRecog)
            helpTimer.invalidate()

            player.playAdditionalSound(type: "correct")
            player.foundObjectSound(type: category!.categoryName)
            
            //push value to iwatch
            viewModel.sendMessageToIwatch(name: udUserName, time: 0, startExplore: false)
        }
    }
    
    func textFirstGuide() -> String {
        if indexObjectRecog != 0 {
            return "Next"
        }
        return "First"
    }
    
    private func playMusic() {
        player.findObjectSound(type: (category?.object[indexObjectRecog].name)!)
    }
}

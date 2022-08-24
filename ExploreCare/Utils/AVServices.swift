//
//  AVService.swift
//  ExploreCare
//
//  Created by Rasyid Ridla on 22/08/22.
//

import Foundation
import AVFoundation

class AVService {
    private var player : AVAudioPlayer?
    private var backgroundMusicPlayer: AVAudioPlayer?
    
    private(set) var isPlayingBackgroundMusic: Bool = false
    
    static let shared = AVService()
    
    private init() {}
    
    func playMusic(name: String, type: String){
        //akses alamat
        let path = Bundle.main.path(forResource: name, ofType: type) ?? ""
        //ubah alamatnya jadi url
        let url = URL(fileURLWithPath: path)
        do {
            //masukin url ke audio player
            player = try AVAudioPlayer(contentsOf: url)
            
            //player di mainkan
            player?.play()
        } catch {
            print("couldn't load file")
        }
    }
    
    func playBackgroundMusic() {
        let path = Bundle.main.path(forResource: "background_music", ofType: "mpeg") ?? ""
        let url = URL(fileURLWithPath: path)
        
        do {
            if backgroundMusicPlayer == nil {
                backgroundMusicPlayer = try AVAudioPlayer(contentsOf: url)
            }
            backgroundMusicPlayer?.play()
            backgroundMusicPlayer?.numberOfLoops = -1
            backgroundMusicPlayer?.volume = 0.1
            isPlayingBackgroundMusic = true
        } catch {
            print("couldn't load file")
        }
    }
    
    func stopBackgroundMusic() {
        backgroundMusicPlayer?.stop()
        isPlayingBackgroundMusic = false
    }
    
    
    
    
    
    //play inputNameSound
    func inputNameSound(type: String) {
        let player = AVService.shared
        switch type {
        case "inputName1": player.playMusic(name: "inputName1", type: "mp3")
        default:
            player.playMusic(name: "inputName1", type: "mp3")
        }
    }
    
    //play storytellingSound
    func storytellingSound(type: String) {
        let player = AVService.shared
        switch type {
        case "Food": player.playMusic(name: "Tep Finds Fruits", type: "mp3")
        case "Garden": player.playMusic(name: "Ras Plays in Garden", type: "mp3")
        case "Kitchen": player.playMusic(name: "Tep to The Kitchen", type: "mp3")
        case "Living Room": player.playMusic(name: "Manda Explore Living Room", type: "mp3")
        case "Zoo" : player.playMusic(name: "Manda Here", type: "mp3")
        case "Bedroom": player.playMusic(name: "Iki Preparing For School and Bed", type: "mp3")
        case "Vehicles": player.playMusic(name: "Iki Introduction", type: "mp3")
        default:
            player.playMusic(name: "correct", type: "aiff")
        }
    }
    
    //play turorialSound
    func tutorialSound(type: String) {
        let player = AVService.shared
        switch type {
        case "Ras Introduction": player.playMusic(name: "Ras Introduction", type: "mp3")
        case "Instruction": player.playMusic(name: "Instruction", type: "mp3")
        case "Found To Explore": player.playMusic(name: "Found To Explore", type: "mp3")
        case "Find The Bottle": player.playMusic(name: "Find Chair", type: "mp3")
        default:
            player.playMusic(name: "tutor1", type: "mp3")
        }
    }
    
    //play findObjectSound
    func findObjectSound(type: String) {
        let player = AVService.shared
        switch type {
            //Bedroom
        case "Backpack": player.playMusic(name: "Find Backpack", type: "mp3")
        case "Book": player.playMusic(name: "Find Book", type: "mp3")
        case "Laptop": player.playMusic(name: "Find Laptop", type: "mp3")
        case "Bottle": player.playMusic(name: "Find Bottle", type: "mp3")
        case "Clock": player.playMusic(name: "Find Clock", type: "mp3")
            
            //livingroom
        case "Chair": player.playMusic(name: "Find Chair", type: "mp3")
        case "Sofa": player.playMusic(name: "Find Sofa", type: "mp3")
//        case "Clock": player.playMusic(name: "Clock", type: "mp3")
        case "Monitor": player.playMusic(name: "Find Monitor", type: "mp3")
        case "Remote": player.playMusic(name: "Find Remote", type: "mp3")
            
            //kitchen
        case "Fork": player.playMusic(name: "Find Fork", type: "mp3")
        case "Cup": player.playMusic(name: "Find Cup", type: "mp3")
        case "Refrigerator": player.playMusic(name: "Find Refrigerator", type: "mp3")
        case "Bowl": player.playMusic(name: "Find Bowl", type: "mp3")
        case "Spoon": player.playMusic(name: "Find Spoon", type: "mp3")
            
            //garden
        case "Vase": player.playMusic(name: "Find Vase", type: "mp3")
        case "Umbrella": player.playMusic(name: "Find Umbrella", type: "mp3")
        case "Potted Plant": player.playMusic(name: "Find Potted Plant", type: "mp3")
        case "Bench": player.playMusic(name: "Find Bench", type: "mp3")
        case "Ball": player.playMusic(name: "Find Ball", type: "mp3")
            
            //zoo
        case "Girafe": player.playMusic(name: "Find Girafe", type: "mp3")
        case "Bear": player.playMusic(name: "Find Bear", type: "mp3")
        case "Bird": player.playMusic(name: "Find Bird", type: "mp3")
        case "Zebra": player.playMusic(name: "Find Zebra", type: "mp3")
        case "Elephant": player.playMusic(name: "Find Elephant", type: "mp3")
            
            //food
        case "Banana": player.playMusic(name: "Find Banana", type: "mp3")
        case "Orange": player.playMusic(name: "Find Orange", type: "mp3")
        case "Apple": player.playMusic(name: "Find Apple", type: "mp3")
        case "Brocolli": player.playMusic(name: "Find Brocolli", type: "mp3")
        case "Carrot": player.playMusic(name: "Find Carrot", type: "mp3")
            
            //vehicles
        case "Truck": player.playMusic(name: "Find Truck", type: "mp3")
        case "Bus": player.playMusic(name: "Find Bus", type: "mp3")
        case "Bicycle": player.playMusic(name: "Find Bicycle", type: "mp3")
        case "Car": player.playMusic(name: "Find Car", type: "mp3")
        case "Motorbike": player.playMusic(name: "Find Motorbike", type: "mp3")
        default:
            player.playMusic(name: "correct", type: "aiff")
        }
    }
    
    //play foundObjectSound
    func foundObjectSound(type: String) {
        let player = AVService.shared
        switch type {
        case "BedRoom": player.playMusic(name: "Good Job Iki", type: "mp3")
        case "Vehicles": player.playMusic(name: "Good Job Iki", type: "mp3")
        case "Garden": player.playMusic(name: "Good Job Ras", type: "mp3")
        case "Living Room": player.playMusic(name: "Good Job Manda", type: "mp3")
        case "Zoo": player.playMusic(name: "Good Job Manda", type: "mp3")
        case "Food": player.playMusic(name: "Good Job Tep", type: "mp3")
        case "Kitchen": player.playMusic(name: "Good Job Tep", type: "mp3")
        default:
            player.playMusic(name: "correct", type: "aiff")
        }
    }
    
    //play object sound
    func playFeedbackSound(objectRecog: ObjectRecog) {
        let player = AVService.shared
        switch objectRecog.name {
            //Bedroom
        case "Backpack": player.playMusic(name: "Backpack", type: "mp3")
        case "Book": player.playMusic(name: "Book", type: "mp3")
        case "Laptop": player.playMusic(name: "Laptop", type: "mp3")
        case "Bootle": player.playMusic(name: "Bottle", type: "mp3")
        case "Clock": player.playMusic(name: "Clock", type: "mp3")
            
            //livingroom
        case "Chair": player.playMusic(name: "Chair", type: "mp3")
        case "Sofa": player.playMusic(name: "Sofa", type: "mp3")
//        case "Clock": player.playMusic(name: "Clock", type: "mp3")
        case "Monitor": player.playMusic(name: "Monitor", type: "mp3")
        case "Remote": player.playMusic(name: "Remote", type: "mp3")
            
            //kitchen
        case "Fork": player.playMusic(name: "Fork", type: "mp3")
        case "Cup": player.playMusic(name: "Cup", type: "mp3")
        case "Refrigerator": player.playMusic(name: "Refrigerator", type: "mp3")
        case "Bowl": player.playMusic(name: "Bowl", type: "mp3")
        case "Spoon": player.playMusic(name: "Spoon", type: "mp3")
            
            //garden
        case "Vase": player.playMusic(name: "Vase", type: "mp3")
        case "Umbrella": player.playMusic(name: "Umbrella", type: "mp3")
        case "PottedPlant": player.playMusic(name: "PottedPlant", type: "mp3")
        case "Bench": player.playMusic(name: "Bench", type: "mp3")
        case "Ball": player.playMusic(name: "Ball", type: "mp3")
            
            //zoo
        case "Girafe": player.playMusic(name: "Girafe", type: "mp3")
        case "Bear": player.playMusic(name: "Bear", type: "mp3")
        case "Bird": player.playMusic(name: "Bird", type: "mp3")
        case "Zebra": player.playMusic(name: "Zebra", type: "mp3")
        case "Elephant": player.playMusic(name: "Elephant", type: "mp3")
            
            //food
        case "Banana": player.playMusic(name: "Banana", type: "mp3")
        case "Orange": player.playMusic(name: "Orange", type: "mp3")
        case "Apple": player.playMusic(name: "Apple", type: "mp3")
        case "Brocolli": player.playMusic(name: "Brocolli", type: "mp3")
        case "Carrot": player.playMusic(name: "Carrot", type: "mp3")
            
            //vehicles
        case "Truck": player.playMusic(name: "Truck", type: "mp3")
        case "Bus": player.playMusic(name: "Bus", type: "mp3")
        case "Bicycle": player.playMusic(name: "Bicycle", type: "mp3")
        case "Car": player.playMusic(name: "Car", type: "mp3")
        case "Motorbike": player.playMusic(name: "Motorbike", type: "mp3")
            
        default:
            player.playMusic(name: "laptop", type: "mp3")
        }
    }


    //play additional sound
    func playAdditionalSound(type: String) {
        let player = AVService.shared
        switch type {
        case "correct": player.playMusic(name: "correct", type: "aiff")
        default:
            player.playMusic(name: "correct", type: "aiff")
        }
    }
}

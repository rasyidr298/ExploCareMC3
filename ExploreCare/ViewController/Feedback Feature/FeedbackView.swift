//
//  CarouselView.swift
//  ExploreCare
//
//  Created by Rasyid Ridla on 22/08/22.
//

import SwiftUI
import ConfettiSwiftUI

struct FeedbackView: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var heightMainView = UIScreen.main.bounds.height
    @State var widthMainView = UIScreen.main.bounds.width
    @State private var counter: Int = 30
    @State var object: [ObjectRecog] = []
    
    var body: some View {
        ZStack {
            VStack {
                Text("\nWell done! We are proud of you!\n")
                    .foregroundColor(Color("green"))
                    .font(.system(size: 34, weight: .bold, design: .rounded))
                
                Carousel(cardWidth: widthMainView, spacing: -400) {
                    ForEach(object) {obj in
                        CarouselCardModif {
                            CarouselCard(item: obj).onTapGesture {
                                AVService.shared.playFeedbackSound(objectRecog: obj)
                            }
                        }
                    }
                }
            }
            
            Image(systemName: "x.square.fill")
                .resizable()
                .frame(width: 40, height: 40, alignment: .center)
                .cornerRadius(12)
                .foregroundColor(.red)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 20))
                .onTapGesture {
                    if let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
                        for controller in navigationController.viewControllers {
                            if controller is HomeVC {
                                navigationController.popToViewController(controller, animated: true)
                            }
                        }
                    }
                }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .background(
            Image("bg_feedback")
                .resizable()
        )
        .edgesIgnoringSafeArea(.all)
        .onReceive(timer) { _ in
            if counter > 0 {
                counter -= 1
            }
        }
        .confettiCannon(counter: $counter, num: 50, openingAngle: Angle(degrees: 0), closingAngle: Angle(degrees: 360), radius: 400)
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackView(object: Category.dataObject().first!.object)
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

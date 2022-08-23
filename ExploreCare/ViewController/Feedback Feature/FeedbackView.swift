//
//  CarouselView.swift
//  ExploreCare
//
//  Created by Rasyid Ridla on 22/08/22.
//

import SwiftUI

struct FeedbackView: View {
    @State var heightMainView = UIScreen.main.bounds.height
    @State var widthMainView = UIScreen.main.bounds.width
    @State var object: [ObjectRecog] = []
    
    var body: some View {
        // MARK: Carousel
        VStack {
            Spacer()
            Text("")
            Text("")
            Text("You found all the things!")
            Carousel(cardWidth: widthMainView, spacing: -450) {
                ForEach(object) {obj in
                    CarouselCardModif {
                        CarouselCard(item: obj).onTapGesture {
//                            print(obj.objectImage.description.description)
                        }
                    }
                }
            }
        }
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackView(object: Category.dataObject().first!.object)
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

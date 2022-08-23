//
//  ItemCarouselView.swift
//  ExploreCare
//
//  Created by Rasyid Ridla on 22/08/22.
//

import SwiftUI

struct CarouselCard: View {
    var item: ObjectRecog
    
    var body: some View {
        VStack {
            Image(item.objectImageString)
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .aspectRatio(contentMode: .fill)
            HStack {
                Text(item.name)
                    .font(.system(size: 22, weight: .bold, design: .rounded))
                    .foregroundColor(Color.black)
                Image("ic_speaker")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .center)
                    .aspectRatio(contentMode: .fill)
            }
            Text(item.descriptionName)
                .font(.system(size: 14, weight: .bold, design: .rounded))
                .foregroundColor(Color.black)
        }
        .background(
            Image("bg_feedbackitem")
                .resizable()
                .frame(width: 370, height: 270, alignment: .center)
                .shadow(color: Color.gray, radius: 7, x: 0, y: 0)
        )
    }
}


struct CarouselCard_Previews: PreviewProvider {
    static var previews: some View {
        CarouselCard(item: ObjectRecog(id: 1, name: "Chair", objectName: "chair", descriptionName: "Manda hangs her jacket over the chair", objectImage: UIImage(named: "ic_chair")!, objectImageString: "ic_chair", objectImageLabel: UIImage(named: "ic_chair_label")!))
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

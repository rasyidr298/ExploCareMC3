//
//  ItemCarouselView.swift
//  ExploreCare
//
//  Created by Rasyid Ridla on 22/08/22.
//

import SwiftUI

struct CarouselCard: View {
    var item: ObjectRecog
    @State var heightMainView = UIScreen.main.bounds.height
    @State var widthMainView = UIScreen.main.bounds.width
    
    var body: some View {
        
        ZStack(alignment: .bottomLeading) {
            Image(item.objectImageString)
                .resizable()
                .frame(width: 400, height: (heightMainView - 120))
                .aspectRatio(contentMode: .fill)
            
            Text(item.objectName)
                .font(.callout)
                .bold()
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 20))
            
        }
        .clipShape(CustomShape(corner: [.allCorners], radius: 20))
    }
}

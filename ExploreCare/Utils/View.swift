//
//  View.swift
//  learnEnglish
//
//  Created by Rasyid Ridla on 30/06/22.
//

import Foundation
import UIKit
import SwiftUI
import AVFoundation

func allert(view: UIViewController, title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
                case .default:
                print("default")
                
                case .cancel:
                print("cancel")
                
                case .destructive:
                print("destructive")
                
            }
        }))
    view.present(alert, animated: true, completion: nil)
}

extension Sequence where Element: Hashable {
    func uniqued() -> [Element] {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}

func toAppSetting() {
    if let url = URL(string:UIApplication.openSettingsURLString) {
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

// MARK: CustomShape
public struct CustomShape: Shape {
    var corner: UIRectCorner
    var radius: CGFloat
    
    public init(corner: UIRectCorner, radius: CGFloat) {
        self.corner = corner
        self.radius = radius
    }
    
    public func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radius, height: radius))
        
        return Path(path.cgPath)
    }
}

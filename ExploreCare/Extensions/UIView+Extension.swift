//
//  UIView+Extension.swift
//  ExploCare-ARKit
//
//  Created by cleanmac-ada on 20/08/22.
//

import UIKit

extension UIView {
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        } set {
            self.layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var masksToBounds: Bool {
        get {
            return self.layer.masksToBounds
        } set {
            self.layer.masksToBounds = newValue
        }
    }
}


//
//  RoundedeShadowView.swift
//  NavigationApp
//
//  Created by Настя Сойко on 15.02.21.
//

import UIKit

@IBDesignable
class RoundedeShadowView: UIView {

    @IBInspectable
    var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius
        }
    }
    @IBInspectable
    var shadowRadius: CGFloat = 0 {
        didSet {
            self.layer.shadowRadius = self.shadowRadius
        }
    }
    @IBInspectable
    var shadowOpacity: Float = 1 {
        didSet {
            self.layer.shadowOpacity = self.shadowOpacity
        }
    }
    @IBInspectable
    var shadowColor: UIColor = UIColor.black{
        didSet {
            self.layer.shadowColor = self.shadowColor.cgColor
        }
    }
}

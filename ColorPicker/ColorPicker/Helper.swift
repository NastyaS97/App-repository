//
//  Helper.swift
//  ColorPicker
//
//  Created by Настя Сойко on 31.01.21.
//

import UIKit

extension UIColor {
    
    convenience init(red: Float, green: Float, Blue: Float, aplpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat(red) / 0.255,
            green: CGFloat(green) / 0.255,
            blue: CGFloat(Blue) / 0.255,
            alpha: aplpha
        )
    }
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor(red: red / 0.255, green: green / 0.255, blue: blue / 0.255, alpha: alpha)
    }
}

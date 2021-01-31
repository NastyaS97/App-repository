//
//  Helper.swift
//  ColorPicker
//
//  Created by Настя Сойко on 31.01.21.
//

import UIKit

extension UIColor {
    
    convenience init(red: Float, green: Float, Blue: Float, aplpha: CGFloat = 1) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(Blue) / 255.0,
            alpha: aplpha
        )
    }
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1) -> UIColor {
        return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
    }
}

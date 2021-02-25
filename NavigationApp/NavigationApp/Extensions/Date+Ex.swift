//
//  Date+Ex.swift
//  NavigationApp
//
//  Created by Настя Сойко on 25.02.21.
//

import Foundation

extension Date {
    var toString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        return formatter.string(from: self)
    }
}

//
//  WAPlace.swift
//  WorldApp
//
//  Created by Настя Сойко on 22.03.21.
//

import Foundation

struct WAPlace {
    let id = UUID()
    let title: String
    let description: String?
    let imageUrl: String
    var isFavourite: Bool
}

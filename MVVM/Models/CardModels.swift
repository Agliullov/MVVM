//
//  CardModels.swift
//  MVVM
//
//  Created by Ильдар Аглиуллов on 18.02.2023.
//

import Foundation

struct CardResponse: Codable {
    let data: [Card]
}

struct Card: Codable {
    let id: Int
    let name: String
    let type: String
    let desc: String
    let cardImages: [CardImages]
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case type = "type"
        case desc = "desc"
        case cardImages = "card_images"
    }
}

struct CardImages: Codable {
    let id: Int
    let imageURL: String
    let imageURLSmall: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case imageURL = "image_url"
        case imageURLSmall = "image_url_small"
    }
}

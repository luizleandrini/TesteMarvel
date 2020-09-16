//
//  MarvelClasses.swift
//  desafio-ios-luiz-leandrini
//
//  Created by Luiz Guilherme on 13/09/20.
//  Copyright © 2020 Luiz Guilherme. All rights reserved.
//

import Foundation
import UIKit

struct HeroInfo: Codable {
    let code: Int
    let status: String
    let data: HeroData
}
struct HeroData: Codable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [Hero]
}
struct Hero: Codable {
    let id: Int
    let name: String
    let description: String
    let thumbnail: Thumbnail
    let urls: [HeroURL]
}
struct Thumbnail: Codable{
    let path: String
    let ext: String
    
    var url: String {
        return path + "." + ext
    }
    
    enum CodingKeys: String, CodingKey{
        case path
        case ext = "extension"
    }
    
}
struct HeroURL: Codable {
    let type: String
    let url: String
}


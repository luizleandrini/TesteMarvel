//
//  HeroComicsModel.swift
//  desafio-ios-luiz-leandrini
//
//  Created by Luiz Guilherme on 15/09/20.
//  Copyright © 2020 Luiz Guilherme. All rights reserved.
//

import Foundation


struct ComicsInfo: Codable {
    let code: Int
    let status: String
    let data: ComicsData
}
struct ComicsData: Codable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [Comics]
}

struct Comics: Codable {
    let prices: [Price]
    let thumbnail: Thumbnail
    let title: String
    let description: String
}
struct Price: Codable {
    let type: String
    let price: Double
}

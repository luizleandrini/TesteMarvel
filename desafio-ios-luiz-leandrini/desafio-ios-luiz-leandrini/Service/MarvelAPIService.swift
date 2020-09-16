//
//  MarvelAPI.swift
//  desafio-ios-luiz-leandrini
//
//  Created by Luiz Guilherme on 13/09/20.
//  Copyright © 2020 Luiz Guilherme. All rights reserved.
//

import Foundation
import SwiftHash
import Alamofire

class MarvelAPIService{
    static private let basePath = "https://gateway.marvel.com/v1/public/characters"
    static private let privateKey = "7117be989ae397960f3b691ef8f10e7a2a3023ef"
    static private let publicKey = "5f4fe93cffcbb2bd8ba631f4bafcbd42"
    static private let limit = 20
    
    class func loadHero(name: String?, page: Int = 0, onComplete: @escaping(HeroInfo?) -> Void) {
        let offset = page * limit        
        let url = basePath + "?offset=\(offset)&" + getCredentials()
        print(url)
        
        AF.request(url).responseJSON{(response) in
            guard let data = response.data,
                  let heroInfo = try? JSONDecoder().decode(HeroInfo.self, from: data),
                heroInfo.code == 200 else{
                    onComplete(nil)
                    return
            }
            onComplete(heroInfo)
        }
    }
    
    private class func getCredentials() -> String{
        let ts = String(Date().timeIntervalSince1970)
        let hash = MD5(ts+privateKey+publicKey).lowercased()
        return "ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
    }
    
    class func loadComics(id: Int, onComplete: @escaping(ComicsInfo?) -> Void){
   //     let offset = page * limit
        ///v1/public/characters/{characterId}/comics

        let url = basePath + "/\(id)/comics?limit=100&" + getCredentials()
        print(url)

        AF.request(url).responseJSON{(response) in
            guard let data = response.data,
                  let comicsInfo = try? JSONDecoder().decode(ComicsInfo.self, from: data),
                comicsInfo.code == 200 else{
                    onComplete(nil)
                    return
            }
            onComplete(comicsInfo)
        }
    }
}

//
//  HqViewController.swift
//  desafio-ios-luiz-leandrini
//
//  Created by Luiz Guilherme on 15/09/20.
//  Copyright © 2020 Luiz Guilherme. All rights reserved.
//

import Foundation
import Alamofire

class HqViewController: UIViewController {
    @IBOutlet weak var lbId: UILabel!
    var hero: Hero!
    var comics: [Comics] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadComics()
        
        if comics.count > 0 {
            var maxPrice: Double = 0
            
            var idx: Int = 0
            var idxMaxPrice: Int = 0
            
            for comic in comics {
                for price in comic.prices {
                    if(maxPrice < price.price){
                        maxPrice = price.price
                        idxMaxPrice = idx
                    }
                }
                idx += 1
            }
            lbId.text = comics[idxMaxPrice].title
        }else{
            lbId.text = "Nao tem"
        }
        
    }
    
    private func loadComics(){
        MarvelAPIService.loadComics(id: hero.id) { (info) in
            if let info = info {
                self.comics += info.data.results
            }
        }
    }
}

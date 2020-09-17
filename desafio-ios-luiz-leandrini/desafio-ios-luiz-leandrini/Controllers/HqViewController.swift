//
//  HqViewController.swift
//  desafio-ios-luiz-leandrini
//
//  Created by Luiz Guilherme on 15/09/20.
//  Copyright © 2020 Luiz Guilherme. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import Kingfisher

class HqViewController: UIViewController {
    @IBOutlet weak var lbId: UILabel!
    @IBOutlet weak var ivComic: UIImageView!
    @IBOutlet weak var lbDescription: UILabel!
    @IBOutlet weak var lbPrice: UILabel!
    
    var hero: Hero!
    var comics: [Comics] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbId.text = "Buscando HQ mais cara..."
        
        DispatchQueue.main.async {
            self.loadComics()
        }

    }
    
    private func loadComics(){
        lbId.text = "Aguardando o servidor..."
        MarvelAPIService.loadComics(id: hero.id) { (info) in
            if let info = info {
                self.comics += info.data.results
                self.showExpensiveHq()
            }
        }
    }
    
        private func showExpensiveHq(){
            lbId.text = "Calculando hq mais cara..."
            if self.comics.count > 0 {
                var maxPrice: Double = 0
                
                var idx: Int = 0
                var idxMaxPrice: Int = 0
                
                for comic in self.comics {
                    for price in comic.prices {
                        if(maxPrice < price.price){
                            maxPrice = price.price
                            idxMaxPrice = idx
                        }
                    }
                    idx += 1
                }
                self.lbId.text = self.comics[idxMaxPrice].title
                
                 if let url = URL(string: self.comics[idxMaxPrice].thumbnail.url){
                ivComic.kf.indicatorType = .activity
                ivComic.kf.setImage(with: url)
                }else{
                    ivComic.image = nil
                }
                //self.ivComic.image = self.comics[idxMaxPrice].thumbnail.url
                self.lbDescription.text = self.comics[idxMaxPrice].description
                self.lbPrice.text = String(maxPrice)
                
            }else{
                self.lbId.text = "Personagem sem HQ"
            }
        }
        
    func loadComedia() {
        let group = DispatchGroup() // initialize


            // Here is an example of an asynchronous request which use a callback
            group.enter() // wait
            
            MarvelAPIService.loadComics(id: hero.id) { (info) in
                if let info = info {
                    self.comics += info.data.results
                    group.leave()
                }
            }
            

        group.notify(queue: .main) {
            // do something here when loop finished
        }
    }
    
    
}

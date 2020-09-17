//
//  DetailsViewController.swift
//  desafio-ios-luiz-leandrini
//
//  Created by Luiz Guilherme on 13/09/20.
//  Copyright © 2020 Luiz Guilherme. All rights reserved.
//

import Foundation
import Alamofire

class DetailsViewController: UIViewController {
    var hero: Hero!
    
    @IBOutlet weak var btHq: UIButton!
    @IBOutlet weak var lbDescription: UILabel!
    @IBOutlet weak var ivThumb: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //title = hero.name
        if let url = URL(string: hero.thumbnail.url){
            ivThumb.kf.indicatorType = .activity
            ivThumb.kf.setImage(with: url)
        }else{
            ivThumb.image = nil
        }
        if(hero.description == ""){
            
        }else{
        lbDescription.text = hero.description
        }
        lbName.text =  hero.name
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! HqViewController
        vc.hero = hero
    }
}

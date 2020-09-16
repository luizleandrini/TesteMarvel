//
//  HeroTableViewCell.swift
//  desafio-ios-luiz-leandrini
//
//  Created by Luiz Guilherme on 13/09/20.
//  Copyright © 2020 Luiz Guilherme. All rights reserved.
//

import UIKit
import Kingfisher

class HeroTableViewCell: UITableViewCell{
    @IBOutlet weak var ivThumb: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func prepareCell(with hero: Hero){
        lbName.text = hero.name
        if let url = URL(string: hero.thumbnail.url){
            ivThumb.kf.indicatorType = .activity
            ivThumb.kf.setImage(with: url)
        }else{
            ivThumb.image = nil
        }
        ivThumb.layer.cornerRadius = ivThumb.frame.size.height/2
        ivThumb.layer.borderColor = UIColor.white.cgColor
        ivThumb.layer.borderWidth = 2
    }
}

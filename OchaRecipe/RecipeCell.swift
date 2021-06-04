//
//  RecipeCell.swift
//  OchaRecipe
//
//  Created by 井ケ田　沙紀 on 2021/06/01.
//

import UIKit

class RecipeCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //kind of cheat and use an hack
        let starButton = UIButton(type: .system)
        starButton.setImage(#imageLiteral(resourceName: "fav_star@2x.png"), for: .normal)
        
        starButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        starButton.tintColor = .red
        
        accessoryView = starButton
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

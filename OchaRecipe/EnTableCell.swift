//
//  EnTableCell.swift
//  OchaRecipe
//
//  Created by 井ケ田　沙紀 on 2021/06/16.
//

import UIKit



class EnTableCell: UITableViewCell {
    
    @IBOutlet var imgViewEn: UIImageView!
    @IBOutlet var nameLblEn: UILabel!
    @IBOutlet var categoryLblEn: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

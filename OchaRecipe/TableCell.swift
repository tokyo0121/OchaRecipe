//
//  TableCell.swift
//  OchaRecipe
//
//  Created by 井ケ田　沙紀 on 2021/05/28.
//

import UIKit

protocol ArticleCellDelegate {
    func reloadCell(index: IndexPath)
}


class TableCell: UITableViewCell {
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var categoryLbl: UILabel!
    
    var delegte: ArticleCellDelegate?
    var index:IndexPath!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

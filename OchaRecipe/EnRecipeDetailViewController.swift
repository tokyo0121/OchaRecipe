//
//  EnRecipeDetailViewController.swift
//  OchaRecipe
//
//  Created by 井ケ田　沙紀 on 2021/06/15.
//

import UIKit

class EnRecipeDetailViewController: UIViewController {
    
    var recipeEn: EnOchaRecipe!
        
    @IBOutlet weak var recipeImageViewEn: UIImageView!
    @IBOutlet weak var recipeNameLabelEn: UILabel!
    @IBOutlet weak var recipeMaterialTextViewEn: UITextView!
    @IBOutlet weak var recipeRecipeTextViewEn: UITextView!
    @IBOutlet weak var recipeAmountLabelEn: UILabel!
    @IBOutlet weak var recipeLevelLabelEn: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipeImageViewEn.image = UIImage(named: recipeEn.imageNameEn)
        recipeNameLabelEn.text = recipeEn.nameEn
        recipeMaterialTextViewEn.text = recipeEn.materialEn
        recipeRecipeTextViewEn.text = recipeEn.recipeRecipeEn
        recipeAmountLabelEn.text = recipeEn.amountEn
        recipeLevelLabelEn.text = recipeEn.levelEn
    }
}

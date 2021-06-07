//
//  RecipeDetailViewController.swift
//  OchaRecipe
//
//  Created by 井ケ田　沙紀 on 2021/06/02.
//

import UIKit

class RecipeDetailViewController: UIViewController {
    
    var recipe: OchaRecipe!
        
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var recipeMaterialTextView: UITextView!
    @IBOutlet weak var recipeRecipeTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipeImageView.image = UIImage(named: recipe.imageName)
        recipeNameLabel.text = recipe.name
        recipeMaterialTextView.text = recipe.material
        recipeRecipeTextView.text = recipe.recipeRecipe
    }
}

//
//  RecipeDetailViewController.swift
//  OchaRecipe
//
//  Created by 井ケ田　沙紀 on 2021/06/02.
//

import UIKit

class RecipeDetailViewController: UIViewController {
    
    var recipe: recipeDetail!
        
    @IBOutlet weak var recipeImageView: UIImageView!
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var recipeMaterialTextView: UITextView!
    @IBOutlet weak var recipeRecipeTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func recipeArray() -> [recipeDetail]{
        
        var tempRecipe: [recipeDetail] = []
        
        let recipe1 = recipeDetail(recipeName: "おひたし", recipeImage: "meal_1_sample", recipeMaterial: "茶殻、お醤油", recipeRecipe: "①お茶を淹れる")
        let recipe2 = recipeDetail(recipeName: "ハンバーグ", recipeImage: "meal_1_sample", recipeMaterial: "茶殻、ひき肉", recipeRecipe: "①お茶を淹れる")
        
        tempRecipe.append(recipe1)
        tempRecipe.append(recipe2)
        
        return[recipe1]
    }
    
}

class  recipeDetail {
    let recipeName: String
    let recipeImage: String
    let recipeMaterial: String
    let recipeRecipe: String
    
    init(recipeName: String, recipeImage: String, recipeMaterial: String, recipeRecipe: String) {
        self.recipeName = recipeName
        self.recipeImage = recipeImage
        self.recipeMaterial = recipeMaterial
        self.recipeRecipe = recipeRecipe
    }
}

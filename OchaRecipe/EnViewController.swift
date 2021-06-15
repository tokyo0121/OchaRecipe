//
//  EnViewController.swift
//  OchaRecipe
//
//  Created by 井ケ田　沙紀 on 2021/06/15.
//

import UIKit

class EnViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate{
    
    @IBOutlet var Entable: UITableView!
    @IBOutlet var EnsearchBar: UISearchBar!
    @IBOutlet weak var EnlevelLabel: UILabel!
    
    
    var recipeArrayEn = [EnOchaRecipe]()
    var currentRecipeArrayEn = [EnOchaRecipe]() //updated table
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpRecipesEn()
        setUpSearchBarEn()
        alterLayoutEn()
        
        _ = NSLocalizedString("key", comment: "comment")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    private func setUpRecipesEn(){
        // MEALS
        recipeArrayEn.append(EnOchaRecipe(nameEn: "Sencha-Shumai", categoryEn: .mealEn,levelEn: "★★★☆☆", imageNameEn: "syu-mai",materialEn: " Sencha (dried tea leaves): 1 teaspoon\n Minced pork: 150g\n Shrimp: 150g\n Onion: one-half\n Shiitake mushrooms: 3 pieces\n Potato starch: 1 tablespoon\n ginger: 1 clove\n sake: a pinch\n salt: a pinch\n Shumai skin ", recipeRecipeEn: "① Finely chop the onion and shiitake mushrooms and sprinkle with potato starch.\n② Add salt and ginger juice to ①, then add minced pork, finely chopped shrimp, sake and salt, knead and refrigerate for 30 minutes.\n③Stir a teaspoon of sencha tea into the seeds, wrap in shumai skin, and steam in a steamer for about 8 minutes.\n④Sprinkle tea leaves on top as desired and serve! ",amountEn: "About 20 pieces" ))
        recipeArrayEn.append(EnOchaRecipe(nameEn: "Houjicha-Rice", categoryEn: .mealEn, levelEn: "★☆☆☆☆", imageNameEn: "chagayu", materialEn: " Boiled hojicha (green tea): 400 cc \n Cold rice: 1 cup \n Salt: a pinch \n Pickles of your choice: as needed", recipeRecipeEn: "①Put the boiled hojicha in a pot and add the cold rice to it.\n②Add a pinch of salt and cook like a porridge. \n③Prepare the pickles and you are done♪ ",amountEn: "2 servings"))
        recipeArrayEn.append(EnOchaRecipe(nameEn: "Dashimaki Egg", categoryEn: .mealEn, levelEn: "★★★☆☆", imageNameEn: "dashimaki", materialEn: " Egg: 2 pieces\nSakura shrimp: 1 tablespoon\n Sencha green tea: 1 teaspoon\n Mentsuyu: 1/2 teaspoon\n Water: 1 teaspoon", recipeRecipeEn: "①Mix all ingredients together.\n②Cook as you would make a Japanese omelet\n③Done♪",amountEn: "For 1 stick"))
        recipeArrayEn.append(EnOchaRecipe(nameEn: "Matcha Cookies", categoryEn: .sweetEn, levelEn: "★★☆☆☆", imageNameEn: "cookies", materialEn: " Butter: 60g \n Sugar: 35g \n Beaten egg: 1/2 M \n Vanilla extract: as needed \n Flour: 105g \n Matcha: 5g", recipeRecipeEn: "①Mix the softened butter and sugar until it turns white.\n②Add the beaten egg and mix well, then add the vanilla extract.\n③Sift in the flour and mix until smooth.\n④Shape the mixture into a ball.\n⑤Bake in a preheated oven at 160°C for 23 minutes.\n⑥Ready to serve♪",amountEn: "About 30 slices"))
        recipeArrayEn.append(EnOchaRecipe(nameEn: "Fried pork roll", categoryEn: .mealEn, levelEn: "★★★☆", imageNameEn: "senchaage", materialEn: " Sliced pork thigh: 5 slices \n Baby corn: 5 sticks \n Beaten egg: as needed \n Bread crumbs: as needed \n Flour: as needed \n Sencha: 2 teaspoons \n Salt: a pinch", recipeRecipeEn: "①Boil the baby corn.\n②Spread out the pork and sprinkle with salt and green tea.\n③Roll the baby corn in ②.\n④Dip the pork in the flour, beaten egg and breadcrumbs.\n⑤Deep-fry in oil until golden brown and ready to serve.",amountEn: "５ sticks"))
        recipeArrayEn.append(EnOchaRecipe(nameEn: "Healthy steak", categoryEn: .chagaraEn, levelEn: "★★★☆☆", imageNameEn: "hanba-gu", materialEn: " Minced pork: 200g \n Tofu: 150g \n Water sencha tea leaves: 2 tablespoons \n Maitake mushrooms: 1 \n egg: 1 \n Salt: 1/3 teaspoon", recipeRecipeEn: "①Drain the tofu.\n②Mix all ingredients in a bowl.\n③Mix well and roll into a ball.\n④Bake the tofu in a warm pan until the surface is browned♪",amountEn: "4 servings"))
        recipeArrayEn.append(EnOchaRecipe(nameEn: "Deodorizing bags", categoryEn: .goodsEn, levelEn: "★☆☆☆☆", imageNameEn: "nioikeshi", materialEn: " Tea husks of your choice: any amount you like", recipeRecipeEn: "①Brew and enjoy tea with the tea leaves of your choice.\n②Dry the tea shells in the sun on a sunny day.\n③Place them in a bag (preferably a cotton or linen bag) \n④Put them in your shoes or shoe boxes where you don't want them to smell!",amountEn: "As you like"))
        recipeArrayEn.append(EnOchaRecipe(nameEn: "Ohitashi", categoryEn: .chagaraEn, levelEn: "★☆☆☆☆", imageNameEn: "ohitashi", materialEn: " Asamushi sencha tea: any amount you like \n Ponzu or mentsuyu: as needed", recipeRecipeEn: "① Brew the Asamushi tea and enjoy.\n②Remove the tea leaves and place them on a plate.\n③Serve with your favorite seasoning (ponzu or mentsuyu is recommended)♪",amountEn: " "))
        recipeArrayEn.append(EnOchaRecipe(nameEn: "Chagoromo", categoryEn: .mealEn, levelEn: "★★☆☆☆", imageNameEn: "isobeage", materialEn: " Chikuwa: about 3 stalks \n Tea leaves: 1/2 tsp \n Tempura flour: as needed \n Water: as needed", recipeRecipeEn: "①Mix the tempura flour and water and make the batter as indicated on the back of the tempura flour.\n② Mix the tea leaves into the batter.\n③Deep-fry in oil as you would make isobe-age, and it is ready to eat♪",amountEn: "4 servings"))
        recipeArrayEn.append(EnOchaRecipe(nameEn: "Tempura", categoryEn: .chagaraEn, levelEn: "★★☆☆☆", imageNameEn: "chagaraten", materialEn: " Tea husks: as many as you want to eat\n empura powder: as needed\n Water: as needed", recipeRecipeEn: "①Brew and enjoy the Asamushi tea.\n②Remove the tea husks and drain them well.\n③Mix the tempura flour and water to make a batter according to the directions on the back of the tempura flour.\n④ Gently add the tea husks to the batter and deep-fry in enough oil to make kakiage.\n⑤It is ready when it becomes crispy♪",amountEn: "Up to you"))
        
        
        
        currentRecipeArrayEn = recipeArrayEn
        
    }
    
    
    private func setUpSearchBarEn(){
        EnsearchBar.delegate = self
        
    }
    
    func alterLayoutEn(){
        Entable.tableHeaderView = UIView()
        //search bar in section  header
        Entable.estimatedSectionHeaderHeight = 50
        // search bar in navigation bar
        navigationItem.titleView = EnsearchBar
        
        EnsearchBar.placeholder = "レシピを探す"
        
    }
    
    //Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentRecipeArrayEn.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? EnTableCell else{
            return UITableViewCell()
            
        }
        cell.nameLblEn.text = self.currentRecipeArrayEn[indexPath.row].nameEn
        cell.categoryLblEn.text = self.currentRecipeArrayEn[indexPath.row].categoryEn.rawValue
        cell.imgViewEn.image = UIImage(named: self.currentRecipeArrayEn[indexPath.row].imageNameEn)
        
        return cell
        
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailSegueEn" {
            if let indexPath = Entable.indexPathForSelectedRow {
                guard let destination = segue.destination as? EnRecipeDetailViewController else {
                    fatalError("Failed to prepare EnRecipeDetailViewController.")
                }
                
                destination.recipeEn = currentRecipeArrayEn[indexPath.row]
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let indexPath = Entable.indexPathForSelectedRow{
            Entable.deselectRow(at: indexPath, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return EnsearchBar
        
    }
    
    //search bar in section header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    //Search Bar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
    currentRecipeArrayEn = recipeArrayEn.filter({ EnOchaRecipe -> Bool in switch EnsearchBar.selectedScopeButtonIndex{
    case 0:
        if searchText.isEmpty{ return true}
        return EnOchaRecipe.nameEn.lowercased().contains(searchText.lowercased())
    case 1:
        if searchText.isEmpty{ return EnOchaRecipe.categoryEn == .mealEn}
        return EnOchaRecipe.nameEn.lowercased().contains(searchText.lowercased()) && EnOchaRecipe.categoryEn == .mealEn
    case 2:
        if searchText.isEmpty{ return EnOchaRecipe.categoryEn == .sweetEn}
        return EnOchaRecipe.nameEn.lowercased().contains(searchText.lowercased()) && EnOchaRecipe.categoryEn == .sweetEn
    case 3:
        if searchText.isEmpty{ return EnOchaRecipe.categoryEn == .goodsEn}
        return EnOchaRecipe.nameEn.lowercased().contains(searchText.lowercased()) && EnOchaRecipe.categoryEn == .goodsEn
    case 4:
        if searchText.isEmpty{ return EnOchaRecipe.categoryEn == .chagaraEn}
        return EnOchaRecipe.nameEn.lowercased().contains(searchText.lowercased()) && EnOchaRecipe.categoryEn == .chagaraEn
    
    default:
        return false
        
    }
    
})
        Entable.reloadData()
    
}
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int){
        switch selectedScope {
        case 0:
            currentRecipeArrayEn = recipeArrayEn
        case 1:
            currentRecipeArrayEn = recipeArrayEn.filter({ EnOchaRecipe -> Bool in
                EnOchaRecipe.categoryEn == EnRecipeType.mealEn
            })
        case 2:
            currentRecipeArrayEn = recipeArrayEn.filter({ EnOchaRecipe -> Bool in
                EnOchaRecipe.categoryEn == EnRecipeType.sweetEn
                
            })
        case 3:
            currentRecipeArrayEn = recipeArrayEn.filter({ EnOchaRecipe -> Bool in
                EnOchaRecipe.categoryEn == EnRecipeType.goodsEn
                
            })
        case 4:
            currentRecipeArrayEn = recipeArrayEn.filter({ EnOchaRecipe -> Bool in
                EnOchaRecipe.categoryEn == EnRecipeType.chagaraEn
                
            })
        default:
            break
            
        }
        Entable.reloadData()
        
    }
    
    
}

class EnOchaRecipe {
    let nameEn: String
    let imageNameEn: String
    let categoryEn: EnRecipeType
    let levelEn: String
    let materialEn: String
    let recipeRecipeEn: String
    let amountEn: String
    
    
    init(nameEn: String, categoryEn: EnRecipeType,levelEn: String, imageNameEn: String, materialEn: String, recipeRecipeEn: String, amountEn: String) {
        self.nameEn = nameEn
        self.categoryEn = categoryEn
        self.levelEn = levelEn
        self.imageNameEn = imageNameEn
        self.materialEn = materialEn
        self.recipeRecipeEn = recipeRecipeEn
        self.amountEn = amountEn
        
    }
}
enum EnRecipeType: String {
    case mealEn = "Meals"
    case sweetEn = "Sweets"
    case goodsEn = "Goods"
    case chagaraEn = "Chagara"
}



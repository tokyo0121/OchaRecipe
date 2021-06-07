//
//  ViewController.swift
//  OchaRecipe
//
//  Created by 井ケ田　沙紀 on 2021/05/22.
//
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate{
    
    @IBOutlet var table: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    
    
    var recipeArray = [OchaRecipe]()
    var currentRecipeArray = [OchaRecipe]() //updated table
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpRecipes()
        setUpSearchBar()
        alterLayout()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    private func setUpRecipes(){
        // MEALS
        recipeArray.append(OchaRecipe(name: "煎茶ハンバーグ", category: .meal, imageName: "meal_1_sample", material: "煎茶、ひき肉 ", recipeRecipe: "お茶を淹れる "))
        recipeArray.append(OchaRecipe(name: "煎茶のお豆腐", category: .meal, imageName: "meal_2_sample", material: " ", recipeRecipe: " "))
        //SWEETS
        recipeArray.append(OchaRecipe(name: "抹茶シフォンケーキ", category: .sweet, imageName: "sweets_1_sample", material: " ", recipeRecipe: " "))
        recipeArray.append(OchaRecipe(name: "抹茶クッキー", category: .sweet, imageName: "sweets_2_sample", material: " ", recipeRecipe: " "))
        //GOODS
        recipeArray.append(OchaRecipe(name: "日本茶の石鹸", category: .goods, imageName: "goods_1_sample", material: " ", recipeRecipe: " "))
        //CHAGARA
        recipeArray.append(OchaRecipe(name: "茶殻のおひたし", category: .chagara, imageName: "chagara_1_sample", material: " ", recipeRecipe: " "))
        recipeArray.append(OchaRecipe(name: "茶殻のおむすび", category: .chagara, imageName: "chagara_2_sample", material: " ", recipeRecipe: " "))
        
        
        currentRecipeArray = recipeArray
        
    }
    
    
    private func setUpSearchBar(){
        searchBar.delegate = self
        
    }
    
    func alterLayout(){
        table.tableHeaderView = UIView()
        //search bar in section  header
        table.estimatedSectionHeaderHeight = 50
        // search bar in navigation bar
        navigationItem.titleView = searchBar
        
        searchBar.placeholder = "レシピを探す"
        
    }
    
    //Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentRecipeArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? TableCell else{
            return UITableViewCell()
            
        }
        cell.nameLbl.text = currentRecipeArray[indexPath.row].name
        cell.categoryLbl.text = currentRecipeArray[indexPath.row].category.rawValue
        cell.imgView.image = UIImage(named: currentRecipeArray[indexPath.row].imageName)
        
        return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailSegue" {
            if let indexPath = table.indexPathForSelectedRow {
                guard let destination = segue.destination as? RecipeDetailViewController else {
                    fatalError("Failed to prepare RecipeDetailViewController.")
                }
                
                destination.recipe = recipeArray[indexPath.row]
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let indexPath = table.indexPathForSelectedRow{
            table.deselectRow(at: indexPath, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return searchBar
        
    }
    
    //search bar in section header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    //Search Bar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
    currentRecipeArray = recipeArray.filter({ OchaRecipe -> Bool in switch searchBar.selectedScopeButtonIndex{
    case 0:
        if searchText.isEmpty{ return true}
        return OchaRecipe.name.lowercased().contains(searchText.lowercased())
    case 1:
        if searchText.isEmpty{ return OchaRecipe.category == .meal}
        return OchaRecipe.name.lowercased().contains(searchText.lowercased()) && OchaRecipe.category == .meal
    case 2:
        if searchText.isEmpty{ return OchaRecipe.category == .sweet}
        return OchaRecipe.name.lowercased().contains(searchText.lowercased()) && OchaRecipe.category == .sweet
    case 3:
        if searchText.isEmpty{ return OchaRecipe.category == .goods}
        return OchaRecipe.name.lowercased().contains(searchText.lowercased()) && OchaRecipe.category == .goods
    case 4:
        if searchText.isEmpty{ return OchaRecipe.category == .chagara}
        return OchaRecipe.name.lowercased().contains(searchText.lowercased()) && OchaRecipe.category == .chagara
    
    default:
        return false
        
    }
    
})
    table.reloadData()
    
}
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int){
        switch selectedScope {
        case 0:
            currentRecipeArray = recipeArray
        case 1:
            currentRecipeArray = recipeArray.filter({ OchaRecipe -> Bool in
                OchaRecipe.category == RecipeType.meal
            })
        case 2:
            currentRecipeArray = recipeArray.filter({ OchaRecipe -> Bool in
                OchaRecipe.category == RecipeType.sweet
                
            })
        case 3:
            currentRecipeArray = recipeArray.filter({ OchaRecipe -> Bool in
                OchaRecipe.category == RecipeType.goods
                
            })
        case 4:
            currentRecipeArray = recipeArray.filter({ OchaRecipe -> Bool in
                OchaRecipe.category == RecipeType.chagara
                
            })
        default:
            break
            
        }
        table.reloadData()
        
    }
    
    
}

    class OchaRecipe {
        let name: String
        let imageName: String
        let category: RecipeType
        let material: String
        let recipeRecipe: String
        
        init(name: String, category: RecipeType, imageName: String, material: String, recipeRecipe: String) {
            self.name = name
            self.category = category
            self.imageName = imageName
            self.material = material
            self.recipeRecipe = recipeRecipe
        
    }
}
    enum RecipeType: String {
        case meal = "お料理"
        case sweet = "甘味"
        case goods = "日用品"
        case chagara = "茶殻"
}



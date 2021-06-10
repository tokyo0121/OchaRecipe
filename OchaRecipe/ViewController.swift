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
    @IBOutlet weak var levelLabel: UILabel!
    
    
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
        recipeArray.append(OchaRecipe(name: "煎茶香るシューマイ", category: .meal,level: "★★☆", imageName: "syu-mai",material: " 煎茶（乾燥茶葉）：小さじ１\n 豚の挽肉：150g\n エビ：150g\n 玉ねぎ：2分の1\n 椎茸：３枚\n 片栗粉：大さじ１\n 生姜：１かけ\n 酒：少々\n 塩：少々\n シューマイの皮 ", recipeRecipe: "① 玉ねぎと椎茸をみじん切りにし、片栗粉をまぶす。\n② ①に塩と生姜の汁を加え、豚の挽肉、細かく刻んだエビ、酒と塩を加えて練り、30分ほど冷蔵庫で寝かす。\n③タネに煎茶をティースプーン１杯分ほど入れてかき混ぜ、シューマイの皮で包み、蒸し器で8分ほど蒸す。\n④お好みで茶葉を上にふりかけたら出来上がり♪ ",amount: "4人前" ))
        recipeArray.append(OchaRecipe(name: "ほうじ茶の茶粥", category: .meal, level: "★★☆", imageName: "chagayu", material: "ほうじ茶（沸かしたもの）\n冷やご飯\n塩：少々 \nお好みのお漬物：適宜", recipeRecipe: "①沸かしたほうじ茶を鍋に入れ、そこに冷やご飯を入れる。\n②塩を少々加え、おかゆのように炊く。\n③お漬物を用意して完成♪ ",amount: "2人前"))
        recipeArray.append(OchaRecipe(name: "茶殻のだし巻き卵", category: .chagara, level: "★★☆", imageName: "dashimaki", material: "卵：", recipeRecipe: " ",amount: "１本分"))
        recipeArray.append(OchaRecipe(name: "抹茶クッキー", category: .sweet, level: "★★☆", imageName: "cookies", material: " ", recipeRecipe: " ",amount: "4人前"))
        
        
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
        let level: String
        let material: String
        let recipeRecipe: String
        let amount: String
        
        init(name: String, category: RecipeType,level: String, imageName: String, material: String, recipeRecipe: String, amount: String) {
            self.name = name
            self.category = category
            self.level = level
            self.imageName = imageName
            self.material = material
            self.recipeRecipe = recipeRecipe
            self.amount = amount
        
    }
}
    enum RecipeType: String {
        case meal = "お料理"
        case sweet = "甘味"
        case goods = "日用品"
        case chagara = "茶殻"
}



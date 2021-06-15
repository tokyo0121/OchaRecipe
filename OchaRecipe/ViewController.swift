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
        
        _ = NSLocalizedString("key", comment: "comment")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    private func setUpRecipes(){
        // MEALS
        recipeArray.append(OchaRecipe(name: "煎茶香るシューマイ", category: .meal,level: "★★★☆☆", imageName: "syu-mai",material: " 煎茶（乾燥茶葉）：小さじ１\n 豚の挽肉：150g\n エビ：150g\n 玉ねぎ：2分の1\n 椎茸：３枚\n 片栗粉：大さじ１\n 生姜：１かけ\n 酒：少々\n 塩：少々\n シューマイの皮 ", recipeRecipe: "① 玉ねぎと椎茸をみじん切りにし、片栗粉をまぶす。\n② ①に塩と生姜の汁を加え、豚の挽肉、細かく刻んだエビ、酒と塩を加えて練り、30分ほど冷蔵庫で寝かす。\n③タネに煎茶をティースプーン１杯分ほど入れてかき混ぜ、シューマイの皮で包み、蒸し器で8分ほど蒸す。\n④お好みで茶葉を上にふりかけたら出来上がり♪ ",amount: "約20こ" ))
        recipeArray.append(OchaRecipe(name: "ほうじ茶の茶粥", category: .meal, level: "★☆☆☆☆", imageName: "chagayu", material: "ほうじ茶（沸かしたもの）：400cc\n 冷やご飯：お茶碗１杯\n 塩：少々 \n お好みのお漬物：適宜", recipeRecipe: "①沸かしたほうじ茶を鍋に入れ、そこに冷やご飯を入れる。\n②塩を少々加え、おかゆのように炊く。\n③お漬物を用意して完成♪ ",amount: "2人前"))
        recipeArray.append(OchaRecipe(name: "煎茶のだし巻き卵", category: .meal, level: "★★★☆☆", imageName: "dashimaki", material: " 卵：２個\n 桜エビ：大さじ１\n 煎茶：小さじ１\n めんつゆ：小さじ2分の１\n 水：小さじ１", recipeRecipe: "①材料を全て混ぜる\n②卵焼きを作る要領で焼いていく\n②出来上がり♪",amount: "１本分"))
        recipeArray.append(OchaRecipe(name: "抹茶クッキー", category: .sweet, level: "★★☆☆☆", imageName: "cookies", material: " バター：60g\n 砂糖：35g\n 溶き卵：M２分の１個分\n バニラエッセンス：適宜\n 薄力粉：105g\n 抹茶：5g", recipeRecipe: "①柔らかくしたバターと砂糖を白っぽくなるまで練り混ぜる\n②溶き卵を加えてよく混ぜ、バニラエッセンスを加える\n③薄力粉をふるい入れて、サックリと混ぜる\n④形を整える\n⑤160℃に予熱したオーブンで23分焼く\n⑥完成♪",amount: "約30枚分"))
        recipeArray.append(OchaRecipe(name: "豚まきフライ", category: .meal, level: "★★★☆", imageName: "senchaage", material: " 豚もも肉(スライス)：５枚\n ベビーコーン：５本\n 溶き卵：適宜\n パン粉：適宜\n 小麦粉：適宜\n 煎茶：小さじ２\n 塩：少々", recipeRecipe: "①ベビーコーンを茹でておく\n②豚肉を広げて、塩と煎茶をふる\n③ベビーコーンを②で巻く\n④フライを作る要領で小麦粉、溶き卵、パン粉の順に、③までで作ったものをつけていく⑤油でキツネ色になるまで揚げて出来上がり♪",amount: "５本"))
        recipeArray.append(OchaRecipe(name: "ヘルシーハンバーグ", category: .chagara, level: "★★★☆☆", imageName: "hanba-gu", material: " 豚の挽肉：200g\n 木綿豆腐：150g\n 水だし煎茶の茶殻：大さじ２\n まいたけ：１個\n 卵：１個\n 塩：小さじ３分の１", recipeRecipe: "①木綿豆腐を水切りする\n②ボウルに材料を全て混ぜる\n③よく混ざったら丸める\n④温めたフライパンで③を焼き、表面に焼き目がついたら出来上がり♪",amount: "4人前"))
        recipeArray.append(OchaRecipe(name: "茶殻の消臭袋", category: .goods, level: "★☆☆☆☆", imageName: "nioikeshi", material: " お好きな茶殻：お好きな量", recipeRecipe: "①お好みの茶葉でお茶を淹れ、楽しむ\n②茶殻を天気の良い日に天日干しする\n③袋(綿や麻の袋が好ましい)に入れる\n④ニオイの気になる靴や靴箱に入れておく！",amount: "好きな量"))
        recipeArray.append(OchaRecipe(name: "おひたし", category: .chagara, level: "★☆☆☆☆", imageName: "ohitashi", material: " 浅むし煎茶：お好きな量\n ポン酢やめんつゆ：適宜", recipeRecipe: "①浅むし茶を淹れ、楽しむ\n②茶殻を取り出して、お皿に盛る\n③お好みの調味料(ポン酢かめんつゆがオススメ)をかけて出来上がり♪",amount: " "))
        recipeArray.append(OchaRecipe(name: "お茶衣揚げ", category: .meal, level: "★★☆☆☆", imageName: "isobeage", material: " ちくわ：３本くらい\n 茶葉：小さじ２分の１\n てんぷら粉：適宜\n 水：適宜", recipeRecipe: "①てんぷら粉と水を混ぜて、衣をてんぷら粉の裏などに記載がある通りに作る\n② ①に茶葉を混ぜる\n③磯辺揚げを作る要領で、油で揚げたら出来上がり♪",amount: "4人前"))
        recipeArray.append(OchaRecipe(name: "茶殻の天ぷら", category: .chagara, level: "★★☆☆☆", imageName: "chagaraten", material: " 浅むし煎茶の茶殻：食べたいだけ\n てんぷら粉：適宜\n 水：適宜", recipeRecipe: "①浅むし茶を淹れ、楽しむ\n②茶殻を取り出し、水をよくきる\n③てんぷら粉と水を混ぜて、衣をてんぷら粉の裏などに記載がある通りに作る\n④ ③に茶殻をそっと入れ、かき揚げを作る容量で油で揚げていく\n⑤カラッとしてきたら完成♪",amount: "食べたい量"))
        
        
        
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
        cell.nameLbl.text = self.currentRecipeArray[indexPath.row].name
        cell.categoryLbl.text = self.currentRecipeArray[indexPath.row].category.rawValue
        cell.imgView.image = UIImage(named: self.currentRecipeArray[indexPath.row].imageName)
        
        return cell
        
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailSegue" {
            if let indexPath = table.indexPathForSelectedRow {
                guard let destination = segue.destination as? RecipeDetailViewController else {
                    fatalError("Failed to prepare RecipeDetailViewController.")
                }
                
                destination.recipe = currentRecipeArray[indexPath.row]
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



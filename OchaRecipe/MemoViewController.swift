//
//  MemoViewController.swift
//  OchaRecipe
//
//  Created by 井ケ田　沙紀 on 2021/06/02.
//
//　Memoのメイン画面をここに書きます。


import UIKit

class MemoViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var memoTableView: UITableView!
    var memoArray = [String]()
    
    let ud = UserDefaults.standard
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "memoCell", for: indexPath)
        cell.textLabel?.text = memoArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetail", sender: nil)
        //押したら押した状態を解除
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 60
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        memoTableView.delegate = self
        memoTableView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        memoTableView.reloadData()
        loadMemo()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //destinationのクラッシュ防ぐ
        if segue.identifier == "toDetail"{
            //detailViewControllerを取得
            //as! DetailViewControllerでダウンキャストしている
            let DetailViewController = segue.destination as! DetailViewController
            //遷移前に選ばれているCellが取得できる
            let selectedIndexPath = memoTableView.indexPathForSelectedRow!
            DetailViewController.selectedMemo = memoArray[selectedIndexPath.row]
            DetailViewController.selectedRow = selectedIndexPath.row
        }
    }
    func loadMemo(){
        if ud.array(forKey: "memoArray") != nil{
            //取得 またas!でアンラップしているのでnilじゃない時のみ
            memoArray = ud.array(forKey: "memoArray") as![String]
            //reloadしてくれる
            memoTableView.reloadData()
        }
    }

}



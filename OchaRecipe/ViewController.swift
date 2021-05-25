//
//  ViewController.swift
//  OchaRecipe
//
//  Created by 井ケ田　沙紀 on 2021/05/22.
//

import UIKit

class ViewController: UIViewController {
    
    //セグメントのアウトレット
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    //ラベルのアウトレット
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func segmentChanged(sender: AnyObject){
        //セグメントが変更されたときの処理
        //選択されているセグメントのインデックス
        let selectedIndex = segmentedControl.selectedSegmentIndex
        //選択されたインデックスの文字列を取得してラベルに設定
        label.text = segmentedControl.titleForSegment(at: selectedIndex)
    }

}


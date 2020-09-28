//
//  View2Controller.swift
//  realmTest
//
//  Created by minamikawa on 2020/09/27.
//  Copyright © 2020 minamikawa. All rights reserved.
//

import UIKit
import RealmSwift

class View4Controller: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    
    @IBOutlet weak var table: UITableView!
    
    // モデルクラスを使用し、取得データを格納する変数を作成
    var tableCells: Results<Memo2>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Interface Builderのファイルを読み込む
        let nib = UINib(nibName: "placeCell", bundle: nil)
        
        // UITableViewに登録する。NewsCellを使用するという宣言
        table.register(nib, forCellReuseIdentifier: "placeCell")

        // Realmインスタンス取得
        let realm = try! Realm()
         
        // データ全権取得
        self.tableCells = realm.objects(Memo2.self)
    }
    
    @IBAction func pushButton(_ sender: Any) {
        
        // モデルクラスのインスタンスを取得
        let MemoInstance:Memo2 = Memo2()
         
        // テキスト入力値をインスタンスに詰める
        //MemoInstance.memo = self.textField.text
        MemoInstance.name = self.nameField.text
        MemoInstance.address = self.addressField.text
         
        // Realmインスタンス取得
        let realm = try! Realm()
         
        // DB登録処理
        try! realm.write {
            realm.add(MemoInstance)
        }
         
        // テーブル再読み込み
        self.table.reloadData()
        
        self.nameField.text = "";
        self.addressField.text = "";
        
    }
    
    // cellの数を指定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableCells.count
    }

    // cellに値を設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        //let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //let tmpCell: Memo = self.tableCells[(indexPath as NSIndexPath).row];
        //cell.textLabel?.text = tmpCell.memo
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "placeCell",
        for: indexPath) as! placeCell
        
        let tmpCell: Memo2 = self.tableCells[(indexPath as NSIndexPath).row];
        
        cell.nameLabel.text = tmpCell.name
        cell.addressLabel.text = tmpCell.address
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}

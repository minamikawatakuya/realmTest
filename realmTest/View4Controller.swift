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
    var tableCells: Results<Memo>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Realmインスタンス取得
        let realm = try! Realm()
         
        // データ全権取得
        self.tableCells = realm.objects(Memo.self)
    }
    
    @IBAction func pushButton(_ sender: Any) {
    }
    
    // cellの数を指定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableCells.count
    }

    // cellに値を設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let tmpCell: Memo = self.tableCells[(indexPath as NSIndexPath).row];

        cell.textLabel?.text = tmpCell.memo

        return cell;
    }

}


import UIKit

class View3Controller: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    
    @IBOutlet weak var table: UITableView!
    
    /*
    var shopList : [
        (
        name:String , address:String, latitude:Double, longitude:Double,
        note:String , identifier:String
        )
    ] = []
 */
    var shopList : [Place] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Interface Builderのファイルを読み込む
        let nib = UINib(nibName: "placeCell", bundle: nil)
        
        // UITableViewに登録する。NewsCellを使用するという宣言
        table.register(nib, forCellReuseIdentifier: "placeCell")
        
        

    }

    @IBAction func pushRegist(_ sender: Any) {
        //PlaceInstance.name = self.nameField.text
        //PlaceInstance.address = self.addressField.text
        //array.insert("piyo", atIndex: 0)
        
        //shopList.append( (
        /*
        shopList.insert( (
            name : self.nameField.text! ,
            address : self.addressField.text!,
            latitude : 0.0,
            longitude : 0.0,
            note : "hoge",
            identifier : "hoge"
            ) , at: 0)
 */
        // モデルクラスのインスタンスを取得
        let PlaceInstance:Place = Place()
         
        // テキスト入力値をインスタンスに詰める
        PlaceInstance.name = self.nameField.text!
        PlaceInstance.address = self.addressField.text!
        PlaceInstance.latitude = 0.0
        PlaceInstance.longitude = 0.0
        PlaceInstance.note = "hoge"
        PlaceInstance.identifier = "hoge"
        
        shopList.insert( PlaceInstance , at: 0)
        
        // テーブル再読み込み
        self.table.reloadData()
        
        self.nameField.text = "";
        self.addressField.text = "";
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shopList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "placeCell",
        for: indexPath) as! placeCell
        
        cell.nameLabel.text = shopList[indexPath.row].name
        cell.addressLabel.text = shopList[indexPath.row].address
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

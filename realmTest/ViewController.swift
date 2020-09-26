//
//  ViewController.swift
//  realmTest
//
//  Created by minamikawa on 2020/09/27.
//  Copyright © 2020 minamikawa. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm = try! Realm()
        let obj = realm.objects(Obj.self)

        for objData in obj{
            label.text = objData.name
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        label.text = textField.text
        textField.resignFirstResponder()
       
        return true
    }

    @IBAction func saveButton(_ sender: UIButton) {
        let obj = Obj()
        obj.name = textField.text
        label.text = obj.name

        let realm = try! Realm()

        try! realm.write {
            realm.add(obj)
        }
    }
    
}


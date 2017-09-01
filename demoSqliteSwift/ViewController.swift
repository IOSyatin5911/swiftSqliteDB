//
//  ViewController.swift
//  demoSqliteSwift
//
//  Created by user11 on 9/1/17.
//  Copyright © 2017 user11. All rights reserved.


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var txtId: UITextField!
    @IBOutlet var txtName: UITextField!
    @IBOutlet var txtCity: UITextField!
    @IBOutlet var txtYear: UITextField!
    
    var str = NSString()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func btnSave(_ sender: Any) {
        var success = true
        str = (self.txtId.text == "") ? "Please Enter UserID" : (self.txtName.text == "") ? "Please Enter UserName" : (self.txtCity.text == "") ? "Please Enter City":(self.txtYear.text == "") ? "Please Enter year": ""
        
        if str == "" {
            
            success = DBManager.getSharedInstance().saveData(txtId.text, name: txtName.text, department: txtCity.text, year: txtYear.text)
            
            if success == false {
                str = "Data Insertion failed"
                self.alertShow()
            }else{
                print("Data Save Successfully");
            }
        }
        else{
            self.alertShow()
        }
    }
    func alertShow() {
    
        let alertController = UIAlertController(title: "Notice", message: str as String, preferredStyle:.alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }
}


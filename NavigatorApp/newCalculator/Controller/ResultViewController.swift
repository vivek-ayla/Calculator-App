//
//  ResultViewController.swift
//  newCalculator
//
//  Created by Vivek K on 17/07/24.
//

import Foundation
import UIKit

protocol ResultDelegate{
    func sendDataToCVC(data: String)
}

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultLable: UILabel!
    @IBOutlet weak var textField: UITextField!

    var resultValue: String?
    var delegate: ResultDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let textFieldValue = UserDefaults.standard.value(forKey: "textFieldValue"){
            textField.text = textFieldValue as? String
        }
    }
}

extension ResultViewController{
    
    @IBAction func sendButtonTapped(){
        let textFieldValue = textField.text ?? " "
        UserDefaults.standard.setValue(textFieldValue, forKey: "textFieldValue")
        
        self.navigationController?.popViewController(animated: true)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: notificationKey), object: self, userInfo: ["data": textField.text ?? ""])
        //delegate?.sendDataToCVC(data: data)
    }
    
}


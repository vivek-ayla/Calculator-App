//
//  ResultViewController.swift
//  newCalculator
//
//  Created by Vivek K on 17/07/24.
//

import Foundation
import UIKit


class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultLable: UILabel!
    var resultValue: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLable.text = "Result =  \(resultValue!)"
    }
}


//
//  ResultViewController.swift
//  newCalculator
//
//  Created by Vivek K on 17/07/24.
//

import Foundation
import UIKit


class ResultViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
}

extension ResultViewController: CalculatorViewDelegate{
    func sendResult(result: Double) {
        resultLabel.text = ""
    }
}

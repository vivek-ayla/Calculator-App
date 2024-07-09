//
//  Utility.swift
//  newCalculator
//
//  Created by admin on 09/07/24.
//

import Foundation
import UIKit

class Utility{
    static public func generateRandomColor() -> UIColor {
        let redValue = CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        let blueValue = CGFloat(drand48())
        let randomColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
        return randomColor
    }

}

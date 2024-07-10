//
//  TableViewCellModel.swift
//  newCalculator
//
//  Created by admin on 10/07/24.
//

import Foundation
import UIKit

public struct TableViewCellModel{
    var item:String?
    var image:UIImage?
    
    public mutating func setItem(item: String){
        self.item = item
    }
    
    public mutating func setImage(image: UIImage){
        self.image = image
    }
    
    public func getItem() -> String{
        return item!
    }
    
    public func getImage() -> UIImage{
        return image!
    }
}

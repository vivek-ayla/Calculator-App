//
//  TableViewCellModel.swift
//  newCalculator
//
//  Created by admin on 10/07/24.
//

import Foundation
import UIKit

public struct TableViewCellModel{
    let title:String?
    let image:UIImage?
    
    init(title: String? = nil, image: UIImage? = nil) {
        self.title = title
        self.image = image
    }
    
    public func getTitle() -> String{
        return title!
    }
    
    public func getImage() -> UIImage{
        return image!
    }
}

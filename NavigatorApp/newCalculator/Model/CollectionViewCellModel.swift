//
//  CollectionViewCellModel.swift
//  newCalculator
//
//  Created by admin on 11/07/24.
//

import Foundation
import UIKit

class CollectionViewCellModel {
    let id: Int
    let title: String?
    let bgColor: UIColor?
    
    init(id: Int, title: String? = nil, bgColor: UIColor) {
        self.id = id
        self.title = title
        self.bgColor = bgColor
    }
    
    convenience init(){
        self.init(id: 0, title: "Dummy", bgColor: Utility.generateRandomColor())
    }
    
    public func getId()-> Int{
        return id
    }
    
    public func getTitle() -> String{
        guard let title = self.title else {
            return ""
        }
        return title
    }
    
    public func getBgColor()-> UIColor{
        guard let bgColor = self.bgColor else{
            return .black
        }
        return bgColor
    }
    
    
}

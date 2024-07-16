//
//  CollectionViewCellModel.swift
//  newCalculator
//
//  Created by admin on 11/07/24.
//

import Foundation
import UIKit

struct CollectionViewCellModel {
    static var idCount = 1
    
    let id: Int
    let title: String?
    
    init(title: String? = nil) {
        id = CollectionViewCellModel.idCount
        self.title = title
        CollectionViewCellModel.idCount += 1
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
}

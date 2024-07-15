//
//  CollectionViewCellModel.swift
//  newCalculator
//
//  Created by admin on 11/07/24.
//

import Foundation
import UIKit

struct CollectionViewCellModel {
    let title: String?
    
    init(title: String? = nil) {
        self.title = title
    }
    
    public func getTitle() -> String{
        guard let title = self.title else {
            return ""
        }
        return title
    }
}

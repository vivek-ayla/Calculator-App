//
//  TableViewCellModel.swift
//  newCalculator
//
//  Created by admin on 10/07/24.
//

import Foundation
import UIKit

class TableViewCellModel {

    let id: Int
    var title: String?
    let subTitle: String?
    let image: UIImage?
    
    init(id: Int, title: String? = nil, subTitle:String? = nil, image: UIImage? = nil) {
        self.id = id
        self.title = title
        self.subTitle = subTitle
        self.image = image
    }
    
    convenience init(){
        self.init(id: 0, title: "Dummy", subTitle: "Dummy", image: UIImage(systemName: "info.circle"))
    }
    
    public func getId()->Int{
        return id
    }
    
    public func getTitle() -> String {
        guard let title = self.title else {
            return ""
        }
        return title
    }
    
    public func getSubTitle()->String {
        guard let subTitle = self.subTitle else {
            return ""
        }
        return subTitle
    }
    
    public func getImage() -> UIImage {
        guard let image = self.image else {
            return UIImage(systemName: "info.circle")!
        }
        return image
    }
}

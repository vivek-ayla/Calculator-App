//
//  CollectionViewCollectionViewCell.swift
//  newCalculator
//
//  Created by admin on 03/07/24.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUp(_ cellItems:[Int],_ index: Int){
       // self.backgroundColor = Utility.generateRandomColor()
        self.cellLabel.text = String(cellItems[index])
    }
    
}

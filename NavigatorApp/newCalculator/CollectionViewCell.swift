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
    
    func generateRandomColor() -> UIColor {
        let redValue = CGFloat(drand48())
        let greenValue = CGFloat(drand48())
        let blueValue = CGFloat(drand48())
        let randomColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
        return randomColor
    }
    
    func setUp(_ cellItems:[Int],_ index: Int){
        self.backgroundColor = generateRandomColor()
        self.cellLabel.text = String(cellItems[index])
    }
    
}

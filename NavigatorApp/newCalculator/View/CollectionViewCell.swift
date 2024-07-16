//
//  CollectionViewCollectionViewCell.swift
//  newCalculator
//
//  Created by admin on 03/07/24.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUp(collectionCell:CollectionViewCellModel) {
        backgroundColor = Utility.generateRandomColor()
        cellLabel.text = collectionCell.getTitle()
        cellLabel.textColor = .white
        cellView.completelyRoundedCorner()
        cellView.backgroundColor = .blue
    }
}

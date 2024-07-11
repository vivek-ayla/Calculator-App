//
//  TableViewCell.swift
//  newCalculator
//
//  Created by admin on 04/07/24.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUp(tableCell:TableViewCellModel){
        self.cellImage.frame = CGRect(x: 5, y: 5 , width: 50, height: 50)
        self.cellImage.image = tableCell.getImage()
        self.cellLabel?.text = tableCell.getTitle()
    }
}

//
//  GreenScreenViewController.swift
//  newCalculator
//
//  Created by admin on 27/06/24.
//

import UIKit

class GreenScreenViewController: UIViewController {
    
    
    @IBOutlet var viewUI: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var cellItems:[CollectionViewCellModel] = [CollectionViewCellModel(title: "1"),
                                               CollectionViewCellModel(title: "2"),
                                               CollectionViewCellModel(title: "3"),
                                               CollectionViewCellModel(title: "4"),
                                               CollectionViewCellModel(title: "5"),
                                               CollectionViewCellModel(title: "6"),
                                               CollectionViewCellModel(title: "7"),
                                               CollectionViewCellModel(title: "8"),
                                               CollectionViewCellModel(title: "9"),
                                               CollectionViewCellModel(title: "10"),
                                               CollectionViewCellModel(title: "11"),
                                               CollectionViewCellModel(title: "12"),
                                               CollectionViewCellModel(title: "13"),
                                               CollectionViewCellModel(title: "14"),
                                               CollectionViewCellModel(title: "15")
                                            ]
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        let collectionViewCellNib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.register(collectionViewCellNib, forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        // Do any additional setup after loading the view.
    }
}

extension GreenScreenViewController: UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.setUp(collectionCell: cellItems[indexPath.row])
        return cell
    }
    
    
    
}

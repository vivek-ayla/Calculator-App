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
    
    var cellItems:[CollectionViewCellModel] = [CollectionViewCellModel(id: 1, title: "1", bgColor: .blue),
                                               CollectionViewCellModel(id: 2, title: "2", bgColor: .blue),
                                               CollectionViewCellModel(id: 3, title: "3", bgColor: .blue),
                                               CollectionViewCellModel(id: 4, title: "4", bgColor: .blue),
                                               CollectionViewCellModel(id: 5, title: "5", bgColor: .blue),
                                               CollectionViewCellModel(id: 6, title: "6", bgColor: .blue),
                                               CollectionViewCellModel(id: 7, title: "7", bgColor: .blue),
                                               CollectionViewCellModel(id: 8, title: "8", bgColor: .blue),
                                               CollectionViewCellModel(id: 9, title: "9", bgColor: .blue),
                                               CollectionViewCellModel(id: 10, title: "10", bgColor: .blue),
                                               CollectionViewCellModel(id: 11, title: "11", bgColor: .blue),
                                               CollectionViewCellModel(id: 12, title: "12", bgColor: .blue),
                                               CollectionViewCellModel(id: 13, title: "13", bgColor: .blue),
                                               CollectionViewCellModel(id: 14, title: "14", bgColor: .blue),
                                               CollectionViewCellModel()
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

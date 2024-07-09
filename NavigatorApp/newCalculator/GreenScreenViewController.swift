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
    
    var cellItems:[Int] = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
    
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
        cell.setUp(cellItems,indexPath.row)
        return cell
        
    }
    
    
    
}

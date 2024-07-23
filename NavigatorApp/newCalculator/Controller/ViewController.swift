//
//  ViewController.swift
//  newCalculator
//
//  Created by admin on 27/06/24.
//

import UIKit

enum images {
    static let imageOne = UIImage(named: "calculator")
    static let imageTwo = UIImage(named: "greenScreen")
    static let imageThree = UIImage(named: "alert1")
    static let imageFour = UIImage(named: "alert2")
    static let imageFive = UIImage(named: "alert3")
}

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var tableCell:[TableViewCellModel] = [
        TableViewCellModel(id: 1, title: "Calculator",subTitle: "Calculator SubTitle" , image: images.imageOne),
        TableViewCellModel(id: 2, title: "Green Screen", subTitle: "Green SubTitle", image: images.imageTwo),
        TableViewCellModel(id: 3, title: "Alert", subTitle: "Alert SubTitle", image: images.imageThree),
        TableViewCellModel(id: 4, title: "Alert", subTitle: "Alert SubTitle", image: images.imageFour),
        TableViewCellModel(id:5, title: "Alert", subTitle: "Alert SubTitle", image: images.imageFive)
        ]
    
    var viewControllerID:[String] = ["calculatorVC","greenScreenVC" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .red
        
        let tableViewCellNib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(tableViewCellNib, forCellReuseIdentifier: "TableViewCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateTable(_ :)), name: Notification.Name(rawValue: notificationKey), object: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    @objc func updateTable(_ notifications:NSNotification){
        tableCell[0].title = notifications.userInfo?["data"] as? String
        tableView?.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)

        if(indexPath.row < viewControllerID.count){
            let vc = storyBoard.instantiateViewController(withIdentifier: viewControllerID[indexPath.row])
            if(viewControllerID[indexPath.row] == "calculatorVC"){
                vc.navigationItem.title = "Calculator"
            }else if let vc = vc as? GreenScreenViewController{
                vc.navigationItem.title = "Green Screen"
            }
            
            let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
            vc.navigationController?.navigationBar.titleTextAttributes = textAttributes
            navigationController?.pushViewController(vc, animated: true)
        }else{
            let alertController = UIAlertController(title: tableCell[indexPath.row].getTitle(), message: "This is not clickable", preferredStyle: .alert)
            let okAlert = UIAlertAction(title: "Ok", style: .default){_ in
                            
            }
            alertController.addAction(okAlert)
            present(alertController,animated: true,completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableCell.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for:indexPath) as! TableViewCell
        cell.setUp(tableCell:tableCell[indexPath.row])
        return cell
    }
}

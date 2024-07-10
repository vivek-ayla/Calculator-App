//
//  ViewController.swift
//  newCalculator
//
//  Created by admin on 27/06/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var viewControllerID:[String] = ["calculatorVC","greenScreenVC" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .red
        
        let tableViewCellNib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(tableViewCellNib, forCellReuseIdentifier: "TableViewCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
    }
    
    //    override func viewWillTransition(to size: CGSize, with coordinator: any UIViewControllerTransitionCoordinator) {
    //
    //    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)

        if(indexPath.row < viewControllerID.count){
            let vc = storyBoard.instantiateViewController(withIdentifier: viewControllerID[indexPath.row])
            if(viewControllerID[indexPath.row] == "calculatorVC"){
                vc.navigationItem.title = "Calculator"
            }else{
                vc.navigationItem.title = "Green Screen"
            }
            
            let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
            vc.navigationController?.navigationBar.titleTextAttributes = textAttributes
            navigationController?.pushViewController(vc, animated: true)
        }else{
            let alertController = UIAlertController(title: "Hi", message: "This is not clickable", preferredStyle: .alert)
            let okAlert = UIAlertAction(title: "Ok", style: .default){_ in
                            
            }
            alertController.addAction(okAlert)
            present(alertController,animated: true,completion: nil)

        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for:indexPath) as! TableViewCell
        var tableCell = TableViewCellModel()
        cell.setUp(tableCell: &tableCell,index: indexPath.row)
        return cell
    }
}

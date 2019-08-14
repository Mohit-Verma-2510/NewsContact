//
//  ViewController.swift
//  ThirdAssignment
//
//  Created by Mohit Verma on 19/07/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let cellID = "TempCell"
    
    @IBOutlet weak var tableView: UITableView!
    
    var tempArr = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        //tableView.register(nib, forCellReuseIdentifier: cellID)
        tableView.register(AutoLayoutTableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        
        tempArr = ["Swift is a powerful and intuitive programming language for macOS, iOS, watchOS, tvOS and beyond. Writing Swift code is interactive and fun, the syntax is concise yet expressive, and Swift includes modern features developers love. Swift code is safe by design, yet also produces software that runs lightning-fast.","Hello this is only one line."]
        
    }
    
    
}

extension ViewController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? AutoLayoutTableViewCell else {
            return UITableViewCell()
        }
        cell.messageLbl.text = tempArr[indexPath.row]
        
        return cell
    }
    
}


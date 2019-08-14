//
//  RealmTestViewController.swift
//  ThirdAssignment
//
//  Created by Mohit Verma on 02/08/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import UIKit
import RealmSwift

//MARK: - Modal Class For REALM
class Dog: Object {
    @objc dynamic var name = ""
    @objc dynamic var age = 0
}
class Person: Object {
    @objc dynamic var name = ""
    @objc dynamic var picture: Data? = nil
    let dogs = List<Dog>()
}

/// View Controller for testing REALM
class RealmTestViewController: UIViewController {
    
    let realmInstance = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

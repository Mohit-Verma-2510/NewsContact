//
//  DetailVC.swift
//  ContactCRUD
//
//  Created by Mohit Verma on 07/07/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import UIKit

class DetailContactVC: BaseViewController {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var phoneLbl: UILabel!
    
    var delegate : StatusProtocol?
    
    var data = ContactModel(data: [:])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeVal()
    }
    
    func changeVal(){
        nameLbl.text  = "Name : " + data.name
        phoneLbl.text = "Phone : " + data.phone
    }
    
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func editBtnAction(_ sender: Any) {
        guard let destVC = storyboard?.instantiateViewController(withIdentifier: "EditContactVC") as? EditContactVC else {
            print("Error with EditContactVC")
            return
        }
        destVC.delegate = self
        destVC.oldData = data
        present(destVC, animated: true, completion: nil)
    }
    
}

//MARK:- Status Protocol
extension DetailContactVC : StatusProtocol{
    func success(msg: String) {
        self.delegate?.success(msg: "")
        changeVal()
    }
}

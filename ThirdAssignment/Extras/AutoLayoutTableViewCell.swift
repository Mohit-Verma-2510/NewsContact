//
//  AutoLayoutTableViewCell.swift
//  ThirdAssignment
//
//  Created by Mohit Verma on 19/07/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import UIKit

class AutoLayoutTableViewCell: UITableViewCell {

    let messageLbl = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(messageLbl)
        messageLbl.backgroundColor = UIColor.yellow
        messageLbl.translatesAutoresizingMaskIntoConstraints = false
        messageLbl.numberOfLines = 0
        
        let constraints = [messageLbl.topAnchor.constraint(equalTo: topAnchor),
                           messageLbl.leadingAnchor.constraint(equalTo: leadingAnchor),
                           messageLbl.bottomAnchor.constraint(equalTo: bottomAnchor),
                           messageLbl.trailingAnchor.constraint(equalTo: trailingAnchor)]

        NSLayoutConstraint.activate(constraints)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}

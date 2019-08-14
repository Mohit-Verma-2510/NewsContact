//
//  NewsObject.swift
//  ThirdAssignment
//
//  Created by Mohit Verma on 14/08/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import RealmSwift
import Foundation

class NewsObject: Object {
    
    /// news title
    @objc dynamic var title: String = ""
    
    /// news description
    @objc dynamic var desc: String = ""
    
    /// news url
    @objc dynamic var url: String = ""
    
    /// news image url
    @objc dynamic var urlToImage: String = ""
    
    /// news content
    @objc dynamic var content:String = ""
    
    /// news is favourite or not
    @objc dynamic var isFav:Bool = false
    
    /// news testing for migration
    //@objc dynamic var testing:String = ""
    
    /// Setting primary key as url
    override static func primaryKey() -> String? {
        return "url"
    }
    
    /// Init for variable
    convenience init(data:NSDictionary) {
        self.init()
        self.title = data["title"] as? String ?? ""
        self.desc = data["description"] as? String ?? ""
        self.url = data["url"] as? String ?? ""
        self.urlToImage = data["urlToImage"] as? String ?? ""
        self.isFav = data["isFav"] as? Bool ?? false
        self.content = data["content"] as? String ?? ""
    }
    
}

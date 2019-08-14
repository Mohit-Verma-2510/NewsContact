//
//  RealmOperation.swift
//  ThirdAssignment
//
//  Created by Mohit Verma on 05/08/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import RealmSwift
import Foundation


/// Realm for news data
class RealmNews {
    
    /// singleton
    static let shared = RealmNews()
    
    /// realm variable
    private let realm:Realm
    
    /// notification token for realm
    private let token: NotificationToken?
    
    /// delegate to send data
    var realmDelegate: RealmProtocol?
    
    /// initialization
    private init(){
        
//        /// Migration
//        Realm.Configuration.defaultConfiguration = Realm.Configuration(
//            schemaVersion: 1,
//            migrationBlock: { migration, oldSchemaVersion in
//                if (oldSchemaVersion < 1) {
//                    migration.enumerateObjects(ofType: NewsObject.className()) { oldObject, newObject in
//                        newObject?["content"] = ""
//                    }
//                }
//        })
        
        /// setting realm object
        realm = try! Realm()
        
        /*
        do {
            realm = try Realm()
        }
        catch let error {
            print("Cannot create realm object. Error is :: \(error)")
            assertionFailure("Cannot create realm reference")
        }
        */
        
        /// Setting observer for realm
        token = realm.observe { (notification, realm) in
            print("Start---------------------------------------------->>>>>>>>>>>>>>>>>>>>>>>>")
            print("The notificationn is :: \(notification)")
            print("The realms is  is :: \(realm)")
            print("End---------------------------------------------->>>>>>>>>>>>>>>>>>>>>>>>")
        }
    }
    
    deinit {
        token?.invalidate()
    }
    
    /// Getting alll data
    func getAllData() {
        let allNews = realm.objects(NewsObject.self)
        realmDelegate?.allData(data: allNews)
    }
    
    /// Saving and Modifying
    func saveData(allNews: [NewsObject]){
        do {
            try realm.write {
                for news in allNews {
                    realm.add(news,update: .modified)
                }
            }
        }
        catch let error {
            print("RealM Error : \(error)")
            assertionFailure("Could not save data.")
        }
    }
    
    /// Delete one object
    func deleteData(data: NewsObject){
        do{
            try realm.write {
                realm.delete(data)
            }
        }
        catch let error{
            print("The error is :: \(error)")
            assertionFailure("Could not delete data.")
        }
    }
    
    /// Delete All Data
    private func deleteAll(){
        do{
            try realm.write {
                realm.deleteAll()
            }
        }
        catch{
            print("error in deleting all files")
            assertionFailure("Could not delete all data.")
        }
    }
    
    /// Update
    func updateData(data:NewsObject) {
        do {
            try realm.write {
                realm.create(NewsObject.self, value:data, update: .modified)
            }
        }
        catch let error {
            print("The error is :: \(error)")
            assertionFailure("Could not update data.")
        }
    }
    
}

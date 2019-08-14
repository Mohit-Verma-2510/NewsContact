//
//  CoreDataOperation.swift
//  ContactCRUD
//
//  Created by Mohit Verma on 04/07/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import UIKit
import CoreData


/// All core data operation for contact
class CoreDataOperationForContact {
    
    /// singleton
    static let shared = CoreDataOperationForContact()
    private init(){}
    
    /// delegate for sending data and status
    weak var delegate : ContactProtocol?
    
    /// Insert operation
    func saveContact(ename:String , data:NSDictionary) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let context = appDelegate.persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: ename, in: context) else { return }
        
        let newEntry = NSManagedObject(entity: entity, insertInto: context)
        
        for case let (key,value) as (String , String) in data {
            newEntry.setValue( value , forKey: key )
        }
        
        do {
            try context.save()
            delegate?.contactSaved(msg: "Saved")
        }
        catch let error as NSError {
            delegate?.contactError(errMsg: "The error is saving contact : \(error)")
        }
    }
    
    /// Update Operation
    func editContact(ename:String,oldData:ContactModel,newData:ContactModel) {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: ename)
        fetchRequest.predicate = NSPredicate(format: "name==%@", oldData.name)
        
        do {
            guard let result = try context.fetch(fetchRequest).first as? NSManagedObject else { return }
            
            let value = result
            value.setValue(newData.name, forKey:"name" )
            value.setValue(newData.phone, forKey: "phone")
            
            do {
                try context.save()
                delegate?.contactSaved(msg: "Edited")
            }
            catch let error as NSError {
                delegate?.contactError(errMsg: "The error is editing contact : \(error)")
            }
        }
        catch let error as NSError {
            print(error)
            delegate?.contactError(errMsg: "The error is editing contact : \(error)")
        }
        
    }
    
    ///Delete operation
    func deleteContact(ename:String , data:ContactModel){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: ename)
        fetchRequest.predicate = NSPredicate(format: "name==%@", data.name)
        
        do {
            let results = try context.fetch(fetchRequest)
            
            if let firstObject = results.first as? NSManagedObject {
                context.delete(firstObject)
            }
            
            do {
                try context.save()
            }
            catch let error as NSError {
                delegate?.contactError(errMsg: "The error is saving contact in delete : \(error)")
                
            }
            
            delegate?.contactDeleted(msg: "")
        }
        catch let error as NSError {
            delegate?.contactError(errMsg: "The error is delete contact : \(error)")
        }
        
        
    }
    
    ///Retrieve Operation
    func getContact(ename:String , data:[NSDictionary]){
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: ename)
        
        if let value = data.first?["phone"] as? String {
            fetchRequest.predicate = NSPredicate(format: "phone=%@", value)
        }
        
        do {
            guard let result  = try context.fetch(fetchRequest) as? [NSManagedObject] else { return }
            
            var tempData = [ContactModel]()
            
            for res in result {
                guard let name = res.value(forKey: "name"),
                    let phone = res.value(forKey: "phone") else {
                        print("Error in fetching values.")
                        return
                }
                let tempVal = ContactModel(data: ["name":name,"phone":phone])
                tempData.append(tempVal)
            }
            
            delegate?.contactData(data: tempData)
        }
        catch let error as NSError {
            delegate?.contactError(errMsg: "The error is getting contact : \(error)")
        }
        
    }
    
    
}

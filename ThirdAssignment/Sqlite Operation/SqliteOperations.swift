//
//  SqliteOperations.swift
//  ThirdAssignment
//
//  Created by Mohit Verma on 01/08/19.
//  Copyright © 2019 Mohit Verma. All rights reserved.
//

import Foundation
import SQLite3

/// SQlite Operation.
class SqliteOperations {
    static let shared = SqliteOperations()
    private var db: OpaquePointer?
    
    var val: Int32 = 1
    
    private init(){
        db = openDatabase()
        createTable()
        insertDataIntoTable()
        insertDataIntoTable()
        insertDataIntoTable()
        getData()
    }
    
    deinit {
        print("DEINIT IS CALLED")
        sqlite3_close_v2(db)
    }
    
    private let createTableString = """
        CREATE TABLE IF NOT EXISTS Contact  (
        Id INT PRIMARY KEY NOT NULL,
        Name CHAR(255));
        """
    
    private let insertStatementString = "INSERT INTO Contact (Id, Name) VALUES (?, ?);"
    
    /// Opening Database
    ///
    /// - Returns: database reference
    private func openDatabase() -> OpaquePointer? {
        var db: OpaquePointer? = nil
        
        guard let bundle = Bundle.main.path(forResource: "test", ofType: "db") else {
            return nil
        }
        let url = URL.init(fileURLWithPath: bundle)
        
        guard sqlite3_open(url.path, &db) == SQLITE_OK else {
            print("DB Opened.")
            return nil
        }
        return db
    }
    
    
    /// Creating table with table name if exist
    ///
    /// - Parameter createTableStr: pass create table query
    func createTable(){
        var createTableStatement: OpaquePointer? = nil
        
        /// craete table string need toi be dynamic
        
        guard let db = openDatabase() else {
            print("Error with opening Database")
            return
        }
        
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK {
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                //created successfully
                print("Table Created")
            }
            else{
                print("Error With Table Created")
            }
        }
        else{
            print("Error with preparing statement")
        }
        
        sqlite3_finalize(createTableStatement)
    }
    
    
    /// Insert into table
    func insertDataIntoTable(){
        
        /// should be Dynamic parameters and insertstatementstring also need to be dynamic
        let id: Int32 = val
        let name: NSString = "some name"
        
        val = val + 1
        
        var insertStatement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            
            sqlite3_bind_int(insertStatement, 1, id)
            
            sqlite3_bind_text(insertStatement, 2, name.utf8String, -1, nil)
            
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("successfully inserted row.")
            } else {
                print("could not insert row.")
            }
        } else {
            print("inert statement could not be prepared.")
        }
        
        sqlite3_finalize(insertStatement)
        
    }
    
    func getData(){
        let queryStatementString = "SELECT * FROM Contact;" //need to be dynacmic
        
        var queryStatement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                
                let id = sqlite3_column_int(queryStatement, 0)
                
                guard let queryResultCol1 = sqlite3_column_text(queryStatement, 1) else { return }
                let name = String(cString: queryResultCol1)
                
                print("the id is :: : \(id) and the name is ::: :  \(name)")
            }
        }
        else {
            print("select statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
    }
    
    
    
}

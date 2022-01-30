//
//  DatabaseCreation.swift
//  OneKyat
//
//  Created by Naw Su Su Nyein on 1/30/22.
//

import Foundation
import SQLite3

class DataBaseCreation{
    
    let dbURL : URL
    var db : OpaquePointer?
    
    var insertEntryStmt : OpaquePointer?
    var readEntryStmt : OpaquePointer?
    var updateEntryStmt : OpaquePointer?
    
    init(){
        do{
            do{
                dbURL = try FileManager.default
                    .url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                .appendingPathComponent("onekyat.db")
            }catch{
                print("path error")
                dbURL = URL(fileURLWithPath: "")
                return
            }
            
            try openDB()
            createSellerTable()
        }catch{
            print("something wrong in opening DB")
            return
        }
    }
    
    func openDB() throws{
        if sqlite3_open(dbURL.path, &db) != SQLITE_OK{
            throw SqliteError(message: "error opening database : \(dbURL.absoluteString)")
        }
    }
    
    func createSellerTable(){
        
        
        let createTableString = "CREATE TABLE IF NOT EXISTS Seller(SellerId TEXT PRIMARY KEY,SellerName TEXT NOT NULL,SellerImage TEXT NOT NULL,SellerLocation TEXT NOT NULL,SellerPhoneNumber TEXT NOT NULL);"
        var createTableStmt : OpaquePointer? = nil
        if(sqlite3_prepare_v2(db, createTableString, -1, &createTableStmt, nil) == SQLITE_OK){
            if(sqlite3_step(createTableStmt) == SQLITE_DONE){
                print("seller table created")
            }else{
                print("seller table can't be created")
            }
        }else{
            print("CREATE TABLE statement could not be prepared.")
        }
        
        sqlite3_finalize(createTableStmt)
    }
    
    
}

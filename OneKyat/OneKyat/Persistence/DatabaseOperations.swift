//
//  DatabaseOperations.swift
//  OneKyat
//
//  Created by Naw Su Su Nyein on 1/30/22.
//

import Foundation
import SQLite3

extension DataBaseCreation{
    func prepareReadStmt() -> Int32{
        guard readEntryStmt == nil else{
            return SQLITE_OK
        }
        
        let sql = "SELECT * FROM Seller;"
        let prepareResult = sqlite3_prepare(db, sql, -1, &readEntryStmt, nil)
        if prepareResult != SQLITE_OK{
            print("Preparing read fails")
        }
        return prepareResult
    }
    
    func insertSeller(seller : SellerModel){
        
        let insertStatmentString = "INSERT INTO Seller(SellerId,SellerName,SellerImage,SellerLocation,SellerPhoneNumber) VALUES(?,?,?,?,?)"
               if sqlite3_prepare_v2(db, insertStatmentString, -1, &insertEntryStmt, nil) == SQLITE_OK{
                   
                    if sqlite3_bind_text(self.insertEntryStmt, 1, (seller.sellerId as NSString).utf8String, -1, nil) != SQLITE_OK{
                                print("Inserting Error : Seller Id")
                        }
                    if sqlite3_bind_text(self.insertEntryStmt, 2, (seller.sellerName as NSString).utf8String, -1, nil) != SQLITE_OK{
                           print("Inserting Error : Seller Name")
                       }
                if sqlite3_bind_text(self.insertEntryStmt, 3, (seller.sellerImage as NSString).utf8String, -1, nil) != SQLITE_OK{
                           print("Inserting Error : Seller Image")
                       }
                if sqlite3_bind_text(self.insertEntryStmt, 4, (seller.sellerLocation as NSString).utf8String, -1, nil) != SQLITE_OK{
                           print("Inserting Error : Seller Location")
                       }
                if sqlite3_bind_text(self.insertEntryStmt, 5, (seller.sellerPhoneNumber as NSString).utf8String, -1, nil) != SQLITE_OK{
                           print("Inserting Error : Seller Phone Number")
                       }
                       
               }
        
               let insertResult = sqlite3_step(self.insertEntryStmt)
                if(insertResult != SQLITE_DONE){
                   print("Executing Insert Query Fails")
                    return
                }else{
                    print("Inserting success")
                }
            sqlite3_finalize(insertEntryStmt)
    }
    
    func reaSellerList(queryStatementString : String) -> [SellerModel]{
        var sellerList : [SellerModel] = [SellerModel]()
       
        var sellerId : String
        var sellerName : String
        var sellerImage : String
        var sellerLocation : String
        var sellerPhoneNumber : String
        
        
        let readQueryStatementString = queryStatementString
        
        guard self.prepareReadStmt() == SQLITE_OK else{
            return sellerList
            
        }

        if sqlite3_prepare_v2(db, readQueryStatementString, -1, &readEntryStmt, nil) == SQLITE_OK{
            while(sqlite3_step(self.readEntryStmt) == SQLITE_ROW){
                
                let col1 = sqlite3_column_text(self.readEntryStmt, 0)
                sellerId = String(cString: col1!)
                print("SellerId : \(sellerId)")
                
                let col2 = sqlite3_column_text(self.readEntryStmt, 1)
                sellerName = String(cString: col2!)
                print("Seller Name : \(sellerName)")
                
                let col3 = sqlite3_column_text(self.readEntryStmt, 2)
                sellerImage = String(cString: col3!)
                print("Seller Image : \(sellerImage)")
                
                let col4 = sqlite3_column_text(self.readEntryStmt, 3)
                sellerLocation = String(cString: col4!)
                print("Seller Location : \(sellerLocation)")
                
                let col5 = sqlite3_column_text(self.readEntryStmt, 4)
                sellerPhoneNumber = String(cString: col5!)
                print("Seller Phone Number : \(sellerPhoneNumber)")
                
                let sellerModel = SellerModel(sellerId: sellerId, sellerName: sellerName, sellerImage: sellerImage, sellerLocation: sellerLocation, sellerPhoneNumber: sellerPhoneNumber)
                sellerList.append(sellerModel)
               
            }
        }else{
            print("Select statement could not be prepared")
        }
       
        return sellerList
}

}

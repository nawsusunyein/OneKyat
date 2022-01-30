//
//  DatabaseOperations.swift
//  OneKyat
//
//  Created by Naw Su Su Nyein on 1/30/22.
//

import Foundation
import SQLite3

extension DataBaseCreation{
    func prepareReadStmt(tableName: String) -> Int32{
        guard readEntryStmt == nil else{
            return SQLITE_OK
        }
        
        let sql = "SELECT * FROM \(tableName);"
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
    
    func readSellerList(queryStatementString : String) -> [SellerModel]{
        var sellerList : [SellerModel] = [SellerModel]()
       
        var sellerId : String
        var sellerName : String
        var sellerImage : String
        var sellerLocation : String
        var sellerPhoneNumber : String
        
        
        let readQueryStatementString = queryStatementString
        
        guard self.prepareReadStmt(tableName: "Seller") == SQLITE_OK else{
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

//Operations for item table
extension DataBaseCreation{
    func insertItem(item : ItemModel){
       
        let insertStatmentString = "INSERT INTO Item(ItemId,ItemName,ItemPrice,SellerId,ItemDescription,ItemImage,ItemUploadTime) VALUES(?,?,?,?,?,?,?)"
               if sqlite3_prepare_v2(db, insertStatmentString, -1, &insertEntryStmt, nil) == SQLITE_OK{
                 
                if sqlite3_bind_int(self.insertEntryStmt, 1, Int32(item.itemId)) != SQLITE_OK{
                       print("Inserting Error : Item Id")
                    }
                   
                if sqlite3_bind_text(self.insertEntryStmt, 2, (item.itemName as NSString).utf8String, -1, nil) != SQLITE_OK{
                                print("Inserting Error : Item Name")
                        }
                if sqlite3_bind_double(self.insertEntryStmt, 3, Double(item.itemPrice)) != SQLITE_OK{
                       print("Inserting Error : Item Price")
                }
                if sqlite3_bind_text(self.insertEntryStmt, 4, (item.sellerId as NSString).utf8String, -1, nil) != SQLITE_OK{
                        print("Inserting Error : Seller Id")
                }
                if sqlite3_bind_text(self.insertEntryStmt, 5, (item.itemDescription as NSString).utf8String, -1, nil) != SQLITE_OK{
                           print("Inserting Error : Item description")
                }
                if sqlite3_bind_text(self.insertEntryStmt, 6, (item.itemImage as NSString).utf8String, -1, nil) != SQLITE_OK{
                           print("Inserting Error : Item image")
                }
                if sqlite3_bind_text(self.insertEntryStmt, 7, (item.itemUploadTime as NSString).utf8String, -1, nil) != SQLITE_OK{
                           print("Inserting Error : Item image")
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
    
    func readItemList(queryStatementString : String) -> [ItemModel]{
        var itemList : [ItemModel] = [ItemModel]()
        
        var itemId : Int32
        var itemName : String
        var itemPrice : Double
        var sellerId : String
        var itemDescription : String
        var itemImage : String
        var itemUploadTime : String
       
        let readQueryStatementString = queryStatementString
        
        guard self.prepareReadStmt(tableName: "Item") == SQLITE_OK else{
            return itemList
            
        }

        if sqlite3_prepare_v2(db, readQueryStatementString, -1, &readEntryStmt, nil) == SQLITE_OK{
            while(sqlite3_step(self.readEntryStmt) == SQLITE_ROW){
                
                itemId = sqlite3_column_int(self.readEntryStmt, 0)
                print("id : \(itemId)")
                
                let col1 = sqlite3_column_text(self.readEntryStmt, 1)
                itemName = String(cString: col1!)
                print("Item Nmae : \(itemName)")
                
                itemPrice = sqlite3_column_double(self.readEntryStmt, 2)
                print("Item Price : \(itemPrice)")
                
                let col3 = sqlite3_column_text(self.readEntryStmt, 3)
                sellerId = String(cString: col3!)
                print("Seller Id : \(sellerId)")
                
                let col4 = sqlite3_column_text(self.readEntryStmt, 4)
                itemDescription = String(cString: col4!)
                print("Item description : \(itemDescription)")
                
                let col5 = sqlite3_column_text(self.readEntryStmt, 5)
                itemImage = String(cString: col5!)
                print("Item image : \(itemImage)")
                
                let col6 = sqlite3_column_text(self.readEntryStmt, 5)
                itemUploadTime = String(cString: col6!)
                print("Item Upload Time : \(itemUploadTime)")
                
                let itemModel = ItemModel(itemId: Int(itemId), itemName: itemName, itemPrice: itemPrice, sellerId: sellerId, itemDescription: itemDescription, itemImage: itemImage, itemUploadTime: "")
                itemList.append(itemModel)
               
            }
        }else{
            print("Select statement could not be prepared")
        }
       
        return itemList
   }
}

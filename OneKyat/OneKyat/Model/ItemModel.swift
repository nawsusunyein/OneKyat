//
//  ItemModel.swift
//  OneKyat
//
//  Created by Naw Su Su Nyein on 1/29/22.
//

import Foundation

class ItemModel{
    var itemId : Int
    var itemName : String
    var itemPrice : Double
    var sellerId : String
    var itemDescription : String
    var itemImage : String
    var itemUploadTime : String
    
    init(itemId : Int, itemName : String, itemPrice : Double,sellerId : String, itemDescription : String, itemImage : String, itemUploadTime : String){
        self.itemId = itemId
        self.itemName = itemName
        self.itemPrice = itemPrice
        self.sellerId = sellerId
        self.itemDescription = itemDescription
        self.itemImage = itemImage
        self.itemUploadTime = itemUploadTime
    }
}

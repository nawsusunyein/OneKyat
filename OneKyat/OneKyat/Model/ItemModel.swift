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
    
    init(itemId : Int, itemName : String, itemPrice : Double){
        self.itemId = itemId
        self.itemName = itemName
        self.itemPrice = itemPrice
    }
}

//
//  SellerModel.swift
//  OneKyat
//
//  Created by Naw Su Su Nyein on 1/29/22.
//

import Foundation

class SellerModel{
    var sellerId : String
    var sellerName : String
    var sellerImage : String
    var sellerLocation : String
    var sellerPhoneNumber : String
    
    init(sellerId : String, sellerName : String, sellerImage : String, sellerLocation : String, sellerPhoneNumber : String){
        self.sellerId = sellerId
        self.sellerName = sellerName
        self.sellerImage = sellerImage
        self.sellerLocation = sellerLocation
        self.sellerPhoneNumber = sellerPhoneNumber
    }
    
}

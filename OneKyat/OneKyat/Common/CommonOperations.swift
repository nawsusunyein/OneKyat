//
//  CommonOperations.swift
//  OneKyat
//
//  Created by Naw Su Su Nyein on 1/29/22.
//

import Foundation
import UIKit

class CommonOperations{
    static let shared = CommonOperations()
    
    //Call given phone number
    func callPhoneNumber(phoneNumer : String){
        if let url = URL(string: "tel://\(phoneNumer)") {
             UIApplication.shared.open(url)
         }
    }
}

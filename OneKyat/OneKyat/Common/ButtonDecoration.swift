//
//  ButtonDecoration.swift
//  OneKyat
//
//  Created by Naw Su Su Nyein on 1/28/22.
//

import Foundation
import UIKit

class ButtonDecoration{
    static let shared = ButtonDecoration()
    
    //To add button corner
    func setButtonCorner(button : UIButton, cornerRadius : CGFloat){
        button.layer.cornerRadius = cornerRadius
    }
}

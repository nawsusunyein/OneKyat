//
//  UIViewDecoration.swift
//  OneKyat
//
//  Created by Naw Su Su Nyein on 1/30/22.
//

import Foundation
import UIKit

class UIViewDecoration{
    static let shared = UIViewDecoration()
    
    func cardView(corner : CGFloat, shadowColor : UIColor,cardView : UIView,shadowWidth : CGFloat, shadowHeight : CGFloat,opacity: CGFloat){
        cardView.layer.cornerRadius = corner
        cardView.layer.shadowColor = shadowColor.cgColor
        cardView.layer.shadowOffset = CGSize(width: shadowWidth, height: shadowHeight)
        cardView.layer.shadowOpacity = Float(opacity)
    }
}

//
//  TextFieldDecoration.swift
//  OneKyat
//
//  Created by Naw Su Su Nyein on 1/28/22.
//

import Foundation
import UIKit

class TextFieldDecoration{
   static let shared = TextFieldDecoration()
    
    //To add bottom line on textfields
    func showBottonLineOnTextField(textField : UITextField, width : CGFloat){
        
        //Create the bottom line
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: textField.frame.height - 2, width: width - 48  , height: 2)
        bottomLine.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1).cgColor
        
        //Remove border on textfield
        textField.borderStyle = .none
        
        //Add the line to the textfield
        textField.layer.addSublayer(bottomLine)
    }
    
    
    //To add icon on textfields
    func showIconLeftOnTextField(textField: UITextField, iconName : String){
        
        //create content wrapper of image view
        let wrapperView = UIView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        
        //create image view to add image
        let imageView = UIImageView(image : UIImage(named: iconName))
        imageView.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        imageView.contentMode = .scaleAspectFit
        
        //add image view in wrapper view
        wrapperView.addSubview(imageView)
        
        //add wrapper view which include image at left side of textfield
        textField.leftView = wrapperView
        textField.leftViewMode = .always
    }
    
    
    //To add done button on top of keyboard
    func showDoneButtonOnKeyboard(textField : UITextField){
        let toolBar = UIToolbar()
        toolBar.items = [UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil),UIBarButtonItem(title: "Done", style: .done, target: textField, action: #selector(UITextField.resignFirstResponder))]
        toolBar.sizeToFit()
        textField.inputAccessoryView = toolBar
    }
    
}

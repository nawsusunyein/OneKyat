//
//  ViewController.swift
//  OneKyat
//
//  Created by Naw Su Su Nyein on 1/28/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var txtPhoneNumber: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setAttributesForTextFields()
        self.setAttributesForButton()
    }

    func setAttributesForTextFields(){
        
        //show bottom line on textfields
        TextFieldDecoration.shared.showBottonLineOnTextField(textField : self.txtPhoneNumber, width : self.view.frame.width)
        TextFieldDecoration.shared.showBottonLineOnTextField(textField : self.txtPassword, width : self.view.frame.width)
       
        //show icon at left side of textfield
        TextFieldDecoration.shared.showIconLeftOnTextField(textField: self.txtPhoneNumber, iconName: LoginIconName.phone)
        TextFieldDecoration.shared.showIconLeftOnTextField(textField: self.txtPassword, iconName: LoginIconName.password)
        
        //show done button on toolbar of keyboard
        TextFieldDecoration.shared.showDoneButtonOnKeyboard(textField: self.txtPhoneNumber)
        TextFieldDecoration.shared.showDoneButtonOnKeyboard(textField: self.txtPassword)
        
        //show number pad for phone number
        self.txtPhoneNumber.keyboardType = .asciiCapableNumberPad
        
    }
    
    func setAttributesForButton(){
        //set button disabled color
        self.btnLogin.backgroundColor = ButtonColor.LoginButton.disabledColor
        
        //set button corner
        ButtonDecoration.shared.setButtonCorner(button: self.btnLogin, cornerRadius : 5.0)
    }
}

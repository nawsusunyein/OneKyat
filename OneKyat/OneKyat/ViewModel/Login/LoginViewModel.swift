//
//  LoginViewModel.swift
//  OneKyat
//
//  Created by Naw Su Su Nyein on 1/28/22.
//

import Foundation

class LoginViewModel : NSObject{
    
    private(set) var isCheckAgreement : Bool!{
        didSet{
            self.bindCheckAgreementValueLoginViewModelToVC()
        }
    }
    
    private(set) var isSatisifyCredentials : Bool!{
        didSet{
            self.bindCheckCredentialsValueLoginViewModelToVC()
        }
    }
    
    private(set) var errorMessage : String!{
        didSet{
            self.bindErrorMessageLoginViewModelToVC()
        }
    }
    
    private(set) var isSuccess : Bool!{
        didSet{
            self.bindLoginSuccessLoginViewModelToVC()
        }
    }
    
    private let validation : ValidationServices!
    
    var phoneNumber : String!
    var password : String!
    
    var bindCheckAgreementValueLoginViewModelToVC : (() -> ()) = {}
    var bindCheckCredentialsValueLoginViewModelToVC : (() -> ()) = {}
    var bindErrorMessageLoginViewModelToVC : (() -> ()) = {}
    var bindLoginSuccessLoginViewModelToVC : (() -> ()) = {}
    
    override init(){
        self.validation = ValidationServices()
        super.init()
    }
    
    func checkAgreementOrNot(isCheck : Bool){
        if(isCheck){
            isCheckAgreement = false
        }else{
            isCheckAgreement = true
        }
    }
    
    func checkLoginCredentialsIsEmptyOrNot(phoneNumber : String?, password : String?){
        let phone = phoneNumber?.trimmingCharacters(in: .whitespacesAndNewlines)
        let pass = password?.trimmingCharacters(in: .whitespacesAndNewlines)
        guard
             let phoneNumber = phone , !phoneNumber.isEmpty,
            let password = pass, !password.isEmpty
        else{
            self.isSatisifyCredentials = false
            return
        }
        self.isSatisifyCredentials = true
        
    }
    
    func validateCredentialsValue(phoneNumber : String, password : String){
        do{
            self.phoneNumber = try self.validation.validatePhoneNumber(phoneNumber : phoneNumber)
            self.password = try self.validation.validatePassword(password: password)
            self.errorMessage = ""
            self.checkLoginCredentialsCorrectOrNot()
        }catch{
            self.errorMessage = error.localizedDescription
        }
    }
    
    func checkLoginCredentialsCorrectOrNot(){
        if(self.phoneNumber == "09420000001" && self.password == "password_123$#"){
            self.errorMessage = ""
            self.isSuccess = true
        }else{
            self.errorMessage = "Credentials Value is not correct"
        }
    }
   
}

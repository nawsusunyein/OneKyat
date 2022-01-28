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
    
    var bindCheckAgreementValueLoginViewModelToVC : (() -> ()) = {}
    var bindCheckCredentialsValueLoginViewModelToVC : (() -> ()) = {}
    
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
}

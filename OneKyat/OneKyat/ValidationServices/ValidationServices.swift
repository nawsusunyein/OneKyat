//
//  ValidationServices.swift
//  OneKyat
//
//  Created by Naw Su Su Nyein on 1/28/22.
//

import Foundation

struct ValidationServices{
    func validatePhoneNumber(phoneNumber : String?) throws -> String{
        guard let phoneNumber = phoneNumber else{throw ValidationError.isValueEmptyOrInvalid}
        if(!phoneNumber.isNumeric){
            throw ValidationError.valueIncludeString
        }
        guard phoneNumber.count > 5 else {throw ValidationError.valuePhoneTooShort}
        guard phoneNumber.count < 12 else {throw ValidationError.valuePhoneTooLong}
        return phoneNumber
    }
    
    func validatePassword(password : String?) throws -> String{
        guard let password = password else {throw ValidationError.isValueEmptyOrInvalid}
        guard password.count > 8 else {throw ValidationError.valuePasswordTooShort}
        guard password.count < 50 else {throw ValidationError.valuePasswordTooLong}
        return password
    }
}

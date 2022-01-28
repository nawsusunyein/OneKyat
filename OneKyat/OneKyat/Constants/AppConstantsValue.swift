//
//  AppConstantsValue.swift
//  OneKyat
//
//  Created by Naw Su Su Nyein on 1/28/22.
//

import Foundation

struct LoginIconName{
    public static let phone = "phonenumber"
    public static let password = "password"
}

struct WebsiteURL{
    public static let onekyat = "https://www.onekyat.com"
}

enum ValidationError : LocalizedError{
    case isValueEmptyOrInvalid
    case valueIncludeString
    case valuePasswordTooShort
    case valuePasswordTooLong
    case valuePhoneTooShort
    case valuePhoneTooLong
    case emailInvalid
    case valueInclueNumber
    
    var errorDescription: String?{
        switch self{
        case .isValueEmptyOrInvalid : return "Value is being empty or invalid"
        case .valueIncludeString : return "Phone number can contain only numbers"
        case .valueInclueNumber : return "Password should not include only number.Should also include characters and special characters"
        case .valuePasswordTooShort: return "Password is too short"
        case .valuePasswordTooLong: return "Password is too long"
        case .valuePhoneTooLong : return "Phone number is too long"
        case .valuePhoneTooShort : return "Phone number is too short"
        case .emailInvalid: return "Email is invalid"
        }
    }
}

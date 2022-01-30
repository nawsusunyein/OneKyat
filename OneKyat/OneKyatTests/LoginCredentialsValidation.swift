//
//  LoginCredentialsValidation.swift
//  OneKyatTests
//
//  Created by Naw Su Su Nyein on 1/30/22.
//

import XCTest
@testable import OneKyat

class LoginCredentialsValidation: XCTestCase {
 
    var validation = ValidationServices()
    
    func test_phonenumber_valid() throws{
        XCTAssertNoThrow(try validation.validatePhoneNumber(phoneNumber:"095182004"))
    }
    
    func test_phonenumber_invalid() throws{
        let expectedError = ValidationError.valueIncludeString
        var error : ValidationError?
        
        XCTAssertThrowsError(try validation.validatePhoneNumber(phoneNumber: "abcdefg09")){thrownError in
            error = thrownError as? ValidationError
        }
        
        XCTAssertEqual(error, expectedError)
        XCTAssertEqual(error?.errorDescription, expectedError.errorDescription)
        
    }
    
    func test_phonenumber_tooshort() throws{
        let expectedError = ValidationError.valuePhoneTooShort
        var error : ValidationError?
        
        XCTAssertThrowsError(try validation.validatePhoneNumber(phoneNumber: "0924")){thrownError in
            error = thrownError as? ValidationError
        }
        
        XCTAssertEqual(error, expectedError)
        XCTAssertEqual(error?.errorDescription, expectedError.errorDescription)
    }
    
    func test_phonenumber_toolong() throws{
        let expectedError = ValidationError.valuePhoneTooLong
        var error : ValidationError?
        
        XCTAssertThrowsError(try validation.validatePhoneNumber(phoneNumber: "0962536373526272727272")){thrownError in
            error = thrownError as? ValidationError
        }
        
        XCTAssertEqual(error, expectedError)
        XCTAssertEqual(error?.errorDescription, expectedError.errorDescription)
    }

    func test_password_valid() throws{
        XCTAssertNoThrow(try validation.validatePassword(password: "hellokitty$%34"))
    }
    
    func test_password_invalid() throws{
        let expectedError = ValidationError.isValueEmptyOrInvalid
        var error : ValidationError?
        
        XCTAssertThrowsError(try validation.validatePassword(password: nil)){thrownError in
            error = thrownError as? ValidationError
        }
        
        XCTAssertEqual(error, expectedError)
        XCTAssertEqual(error?.errorDescription, expectedError.errorDescription)
        
    }
    
    func test_password_tooshort() throws{
        let expectedError = ValidationError.valuePasswordTooShort
        var error : ValidationError?
        
        XCTAssertThrowsError(try validation.validatePassword(password: "34230ac")){thrownError in
            error = thrownError as? ValidationError
        }
        
        XCTAssertEqual(error, expectedError)
        XCTAssertEqual(error?.errorDescription, expectedError.errorDescription)
    }
    
    func test_password_toolong() throws{
        let expectedError = ValidationError.valuePasswordTooLong
        var error : ValidationError?
        
        XCTAssertThrowsError(try validation.validatePassword(password: "abcd24fg#$@dsfdfmo3922ltuv#$#sdfferesfsfd3423##@$sfs")){thrownError in
            error = thrownError as? ValidationError
        }
        
        XCTAssertEqual(error, expectedError)
        XCTAssertEqual(error?.errorDescription, expectedError.errorDescription)
    }
}

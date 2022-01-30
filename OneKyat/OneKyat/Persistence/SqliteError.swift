//
//  SqliteError.swift
//  OneKyat
//
//  Created by Naw Su Su Nyein on 1/30/22.
//

import Foundation
import SQLite3

class SqliteError : Error{
    var message : String = ""
    var error = SQLITE_ERROR
    
    init(message:String = ""){
        self.message = message
    }
}

//
//  StringExtension.swift
//  OneKyat
//
//  Created by Naw Su Su Nyein on 1/28/22.
//

import Foundation

extension String{
    var isNumeric : Bool{
        return !(self.isEmpty) && self.allSatisfy{$0.isNumber}
    }
}

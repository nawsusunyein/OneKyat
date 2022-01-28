//
//  NSAttributedStringExtension.swift
//  OneKyat
//
//  Created by Naw Su Su Nyein on 1/28/22.
//

import Foundation

extension NSAttributedString{
    
    static func makeHyperLink(path: String, fullString : String, subString: String) -> NSAttributedString{
        let nsString = NSString(string:fullString)
        let subStringRange = nsString.range(of: subString)
        let attributedString = NSMutableAttributedString(string: fullString)
        attributedString.addAttribute(.link,value: path,range:subStringRange)
        return attributedString
    }
}

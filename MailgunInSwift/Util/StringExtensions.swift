//
//  StringExtensions.swift
//  MailgunInSwift
//
//  Created by Ao Zhang on 2017/10/25.
//  Copyright © 2017年 Ao Zhang. All rights reserved.
//

import Foundation

// MARK: - Extension to remove HTML Attributes from Strings
public extension String {
    
    var htmlToAttributedString: NSAttributedString? {
        guard
            let data = data(using: String.Encoding.utf8)
            else { return nil }
        do {
            //return try NSAttributedString(data: data, options: [NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType,NSCharacterEncodingDocumentAttribute:NSNumber(value: String.Encoding.utf8.rawValue)], documentAttributes: nil)
            
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch let error as NSError {
            print(error.localizedDescription)
            return  nil
        }
    }
    
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}


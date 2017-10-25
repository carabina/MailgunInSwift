//
//  MailgunEmail.swift
//  MailgunInSwift
//
//  Created by Ao Zhang on 2017/10/25.
//  Copyright © 2017年 Ao Zhang. All rights reserved.
//

import Foundation
import ObjectMapper


open class MailgunEmail : Mappable{
    
    open var from     :String?
    open var to       :String?
    open var subject  :String?
    open var html     :String?
    open var text     :String?
    
    
    public required init?(map: Map) {}
    
    public init(){}
    
    public convenience init(to:String, from:String, subject:String, html:String){
        
        self.init()
        
        self.to = to
        self.from = from
        self.subject = subject
        self.html = html
        self.text = html.htmlToString
        
    }
    
    open func mapping(map: Map){
        to       <- map["to"]
        from     <- map["from"]
        subject  <- map["subject"]
        html     <- map["html"]
        text     <- map["text"]
    }
    
    
}


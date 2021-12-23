//
//  SymbolReportingDataClass.swift
//  AlphaVantageTestProject
//
//  Created by DynamologicSolutions on 22/12/2021.
//

import UIKit

class SymbolReportingDataClass: NSObject
{

    var timestamp : String!
    var openString : String!
    var hightString : String!
    var lowString : String!
    var closeString : String!
    var volumeString : String!

    
    override init()
    {
        super.init()
    }
    
    convenience init(Dictionary dictionary : NSDictionary)
    {
        self.init()
        
        let timestamp  : String? = dictionary.object(forKey: "timestamp") as? String
        let open  : String? = dictionary.object(forKey: "open") as? String
        let hight  : String? = dictionary.object(forKey: "high") as? String
        let low : String? = dictionary.object(forKey: "low") as? String
        let close  : String? = dictionary.object(forKey: "close") as? String
        let volume  : String? = dictionary.object(forKey: "volume") as? String
      
        
        
        self.timestamp = timestamp ?? "null"
        self.openString = open ?? "null"
        self.hightString = hight ?? "null"
        self.lowString = low ?? "null"
        self.closeString = close ?? "null"
        self.volumeString = volume ?? "null"
        
    }
    
}

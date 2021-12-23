//
//  SymbolDataClass.swift
//  AlphaVantageTestProject
//
//  Created by DynamologicSolutions on 22/12/2021.
//

import UIKit

class SymbolDataClass: NSObject
{
    var symbol : String!
    var name : String!
    var type : String!
    var region : String!
    var marketOpen : String!
    var marketClose : String!
    var currency : String!
    var isFavourite : Bool = false
    
    override init()
    {
        super.init()
    }
    
    convenience init(Dictionary dictionary : NSDictionary)
    {
        self.init()
        
        let symbol  : String? = dictionary.object(forKey: "symbol") as? String
        let name  : String? = dictionary.object(forKey: "name") as? String
        let type  : String? = dictionary.object(forKey: "type") as? String
        let marketOpen  : String? = dictionary.object(forKey: "marketOpen") as? String
        let marketClose  : String? = dictionary.object(forKey: "marketClose") as? String
        let currency  : String? = dictionary.object(forKey: "currency") as? String
        let region  : String? = dictionary.object(forKey: "region") as? String
        
        self.symbol = symbol ?? "null"
        self.name = name ?? "null"
        self.type = type ?? "null"
        self.region = region ?? "null"
        self.marketOpen = marketOpen ?? "null"
        self.marketClose = marketClose ?? "null"
        self.currency = currency ?? "null"
        
        
    }
    
}

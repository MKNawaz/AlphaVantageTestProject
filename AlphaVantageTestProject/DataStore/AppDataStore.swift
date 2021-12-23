//
//  AppDataStore.swift
//  AlphaVantageTestProject
//
//  Created by DynamologicSolutions on 22/12/2021.
//

import UIKit


typealias CompletionSearchBlock = (_ success : Bool ,_ result : [SymbolDataClass]) -> Void
typealias CompletionReportingBlock = (_ success : Bool ,_ result : [SymbolReportingDataClass]) -> Void

class AppDataStore: NSObject
{
    
    private static var defaultStore : AppDataStore = AppDataStore.init()
    class func shared() -> AppDataStore
    {
        return defaultStore
    }
    
    
    
    let local : LocalDataStore = LocalDataStore.init()
    let online : AlphaVantageOnlineStore = AlphaVantageOnlineStore.init()
    
}

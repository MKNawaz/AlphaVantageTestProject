//
//  SymbolReportingViewModelClass.swift
//  AlphaVantageTestProject
//
//  Created by DynamologicSolutions on 22/12/2021.
//

import UIKit

class SymbolReportingViewModelClass: NSObject
{
    var reportingDidPerformBlock : CompletionReportingBlock?
    
    var searchResultArray : [SymbolReportingDataClass] = []
    
    
    func loadData(Type type : SymbolReportingType, Symbol string : String)
    {
        AppDataStore.shared().online.symbolReporting(type: type, Symbol: string) { success, result in
            
            self.searchResultArray = result
            
            if self.reportingDidPerformBlock != nil
            {
                DispatchQueue.main.async
                {
                    self.reportingDidPerformBlock!(true,[])
                }
            } 
        }
    }
    
    
}

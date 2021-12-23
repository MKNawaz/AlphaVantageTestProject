//
//  AlphaVantageOnlineStore.swift
//  AlphaVantageTestProject
//
//  Created by DynamologicSolutions on 22/12/2021.
//

import UIKit

class AlphaVantageOnlineStore: NSObject
{
    let urlProvider : AlphaVantageUrlProvider = AlphaVantageUrlProvider.init()
    
    
    
    func search(searchTerm term : String,comp block :@escaping CompletionSearchBlock)
    {
        let urlString = self.urlProvider.searchUrlString(Keyword: term)
        
        guard let url = URL(string: urlString)
        else
        {
            block(false,[])
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, err in
            
            guard let data = data, err == nil
            else {
                block(false,[])
                return
                
            }
            
            // CSV parse
            let parser = CSVParser.init()
            let contentArray = parser.parse(Data: data)
            
            // mapping to class
            var mappedObjectArray : [SymbolDataClass] = []
            for content in contentArray
            {
                let mappedObject = SymbolDataClass.init(Dictionary: content)
                mappedObjectArray.append(mappedObject)
            }
            
            
            // Local fav check
            AppDataStore.shared().local.updateOnlineDataWithFavouriteLocalRecords(OnlineData: mappedObjectArray)
            
            // escpaing block
            block(true,mappedObjectArray)
             
        }.resume() // don't forget

    }
    
    
    func symbolReporting(type reportType : SymbolReportingType , Symbol symbol : String,comp block :@escaping CompletionReportingBlock)
    {
        var urlString : String
        
        switch reportType
        {
            case .Daily:
                urlString = self.urlProvider.dailyUrlString(Symbol: symbol)
            case .Weekly:
                urlString = self.urlProvider.weeklyUrlString(Symbol: symbol)
            case .Monthly:
                urlString = self.urlProvider.monthlyUrlString(Symbol: symbol)
        }
        
        guard let url = URL(string: urlString)
        else
        {
            block(false,[])
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, err in
            
            guard let data = data, err == nil
            else {
                block(false,[])
                return
                
            }
            
            // CSV parse
            let parser = CSVParser.init()
            let contentArray = parser.parse(Data: data)
            
            // mapping to class
            var mappedObjectArray : [SymbolReportingDataClass] = []
            for content in contentArray
            {
                let mappedObject = SymbolReportingDataClass.init(Dictionary: content)
                mappedObjectArray.append(mappedObject)
            }
            
            // escpaing block
            block(true,mappedObjectArray)
             
        }.resume() // don't forget

    }
    

}

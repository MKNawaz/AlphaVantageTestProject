//
//  AlphaVantageUrlProvider.swift
//  AlphaVantageTestProject
//
//  Created by DynamologicSolutions on 22/12/2021.
//

import UIKit

class AlphaVantageUrlProvider: NSObject
{
    
    /*
     Note:
     Selection of CSV over json
     Reason : API documents recomends CSV overs json
              JSON keys have numberical prefixes, they is not gurantee they will not change keys
              Decodeable not recomended
     */
    
    /// Returns the url string for the search term with API key
    /// - Parameter keyword: Search term
    /// - Returns: url String
    func searchUrlString(Keyword keyword : String) -> String
    {
        /*
         sample
         https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=BA&apikey=demo&datatype=csv
         */
        
        let apikey = apiKey()
        let searchUrlString = "https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=" + keyword + "&apikey=" + apikey + "&datatype=csv"
        return searchUrlString
    }
    
    /// Url String for the Daily report for a specific stock symbol
    /// - Parameter symbol: stock symbol (ibm etc.)
    /// - Returns: url string
    func dailyUrlString(Symbol symbol:String) -> String
    {
        let apikey = apiKey()
        let dailyUrlString = "https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol=" + symbol + "&apikey=" + apikey + "&datatype=csv"
        return dailyUrlString
    }
    
    /// Url String for the Weekly report for a specific stock symbol
    /// - Parameter symbol: stock symbol (ibm etc.)
    /// - Returns: url string
    func weeklyUrlString(Symbol symbol:String) -> String
    {
        /*
         sample
         https://www.alphavantage.co/query?function=TIME_SERIES_WEEKLY&symbol=IBM&apikey=demo&datatype=csv
         */
        let apikey = apiKey()
        let dailyUrlString = "https://www.alphavantage.co/query?function=TIME_SERIES_WEEKLY&symbol=" + symbol + "&apikey=" + apikey + "&datatype=csv"
        return dailyUrlString
    }

    /// Url String for the Monthly report for a specific stock symbol
    /// - Parameter symbol: stock symbol (ibm etc.)
    /// - Returns: url string
    func monthlyUrlString(Symbol symbol:String) -> String
    {
        /*
         sample
         https://www.alphavantage.co/query?function=TIME_SERIES_MONTHLY&symbol=IBM&apikey=demo&datatype=csv
         */
        let apikey = apiKey()
        let dailyUrlString = "https://www.alphavantage.co/query?function=TIME_SERIES_MONTHLY&symbol=" + symbol + "&apikey=" + apikey + "&datatype=csv"
        return dailyUrlString
    }
    
    
}

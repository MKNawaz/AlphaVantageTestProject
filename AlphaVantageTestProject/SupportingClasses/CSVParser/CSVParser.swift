//
//  CSVParser.swift
//  AlphaVantageTestProject
//
//  Created by DynamologicSolutions on 21/12/2021.
//

import UIKit

class CSVParser: NSObject
{
    
    func parse(Data data : Data) -> [NSMutableDictionary]
    {
        let csvString = String.init(data: data, encoding: .utf8)
        
       // var lines = csvString?.components(separatedBy: "\r\n")
        
        guard let lines = csvString?.components(separatedBy: "\r\n") else { return [] }
        
        let keys : [String] = lines.first!.components(separatedBy: ",")
        
        let dataArray  = NSMutableArray.init()
//        let dataArray  = [NSMutableDictionary]()
        
        for index in 1...lines.count-1
        {
            let dict = NSMutableDictionary.init()
            
            let value = lines[index]
            let values : [String] = value.components(separatedBy: ",")
            if values.count == keys.count
            {
                for keyCounter in 0...keys.count-1
                {
                    let key = keys[keyCounter]
                    let va = values[keyCounter]
                    
                    
                    dict.setValue(va, forKey: key)
                }
                
                dataArray.add(dict)
            }
            
            
           
        }
        
        return dataArray as? [NSMutableDictionary] ?? []
    }

}

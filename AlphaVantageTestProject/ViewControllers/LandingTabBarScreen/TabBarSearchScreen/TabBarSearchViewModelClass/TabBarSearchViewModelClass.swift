//
//  TabBarSearchViewModelClass.swift
//  AlphaVantageTestProject
//
//  Created by DynamologicSolutions on 22/12/2021.
//

import UIKit

class TabBarSearchViewModelClass: NSObject
{

    var searchResultArray : [SymbolDataClass] = []
    var searchTerm : String?
    var searchDelayTimer : Timer?
    var searchDidPerformBlock : CompletionSearchBlock?
    
    
    func searchTermDidChange(SearchTerm string : String)
    {
        // Need to delay search so not to trigger search for each change
        
        // nil to clear
        self.searchTerm = string.count == 0 ? nil : string
        
        
        
        if searchDelayTimer != nil
        {
            searchDelayTimer?.invalidate()
            searchDelayTimer = nil
        }
        
        
        // Delayed time
        searchDelayTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(delayedSearch), userInfo: nil, repeats: false)
        
    }
    
    
    @objc func delayedSearch()
    {
        if self.searchTerm == nil
        {
            self.searchResultArray = []
            if self.searchDidPerformBlock != nil
            {
                DispatchQueue.main.async
                {
                    self.searchDidPerformBlock!(true,[])
                }
                
            }
        }
        else
        {
            // search
            
            AppDataStore.shared().online.search(searchTerm: self.searchTerm!) { success, result in
                self.searchResultArray = result
                if self.searchDidPerformBlock != nil
                {
                    
                    DispatchQueue.main.async
                    {
                        self.searchDidPerformBlock!(success,result)
                    }
                    
                }
            }
        }
    }
    
    
}

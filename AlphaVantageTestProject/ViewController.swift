//
//  ViewController.swift
//  AlphaVantageTestProject
//
//  Created by DynamologicSolutions on 20/12/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        
//        var test = StockOnlineDataStore.init()
//        
//        let test2 = test.searchUrl(keyword: "ibm")
//        
////        test.searchOnline(searchTerm: "ibm") { success, results in
////
////            guard let contentArray : [NSMutableDictionary] = results as? [NSMutableDictionary] else { return }
////            for record in contentArray
////            {
////                let key : String = record.value(forKey: "symbol") as! String
////                print(key)
////            }
////
////            print("test pass")
////        }
        
        
//        AppDataStore.shared().online.search(searchTerm: "ibm") { success, result in
//            print(result)
//        }
        

        AppDataStore.shared().online.symbolReporting(type: .Weekly, Symbol: "ibm") { success, result in
            print(result)
        }
        
    }


}


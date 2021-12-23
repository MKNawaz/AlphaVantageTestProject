//
//  Symbol+CoreDataProperties.swift
//  AlphaVantageTestProject
//
//  Created by DynamologicSolutions on 22/12/2021.
//
//

import Foundation
import CoreData


extension Symbol {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Symbol> {
        return NSFetchRequest<Symbol>(entityName: "Symbol")
    }

    @NSManaged public var symbol: String?
    @NSManaged public var name: String?
    @NSManaged public var user: Users?

}

extension Symbol : Identifiable {

}

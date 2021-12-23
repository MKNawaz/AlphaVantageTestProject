//
//  Users+CoreDataProperties.swift
//  AlphaVantageTestProject
//
//  Created by DynamologicSolutions on 22/12/2021.
//
//

import Foundation
import CoreData


extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users")
    }

    @NSManaged public var userName: String?
    @NSManaged public var userEmail: String?
    @NSManaged public var userID: String?
    @NSManaged public var userNumber: Int16
    @NSManaged public var favouriteSymbols: NSSet?

}

// MARK: Generated accessors for favouriteSymbols
extension Users {

    @objc(addFavouriteSymbolsObject:)
    @NSManaged public func addToFavouriteSymbols(_ value: Symbol)

    @objc(removeFavouriteSymbolsObject:)
    @NSManaged public func removeFromFavouriteSymbols(_ value: Symbol)

    @objc(addFavouriteSymbols:)
    @NSManaged public func addToFavouriteSymbols(_ values: NSSet)

    @objc(removeFavouriteSymbols:)
    @NSManaged public func removeFromFavouriteSymbols(_ values: NSSet)

}

extension Users : Identifiable {

}

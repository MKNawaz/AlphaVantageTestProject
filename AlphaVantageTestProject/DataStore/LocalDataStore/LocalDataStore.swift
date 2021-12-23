//
//  LocalDataStore.swift
//  AlphaVantageTestProject
//
//  Created by DynamologicSolutions on 22/12/2021.
//

import UIKit
import CoreData
class LocalDataStore: NSObject
{

    private var currentUser : Users?
    
    func updateBookmarkStatus(SymbolData data:SymbolDataClass)
    {
        if currentUser == nil
        {
            self.loadCurrentUser()
        }
        
    }
    
    func loadCurrentUser()
    {
        
        let context = self.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            
            if result.count == 0
            {
                let user = self.addAnnomusUser()
                currentUser = user
            }
            else
            {
                for data in result as! [Users]
                {
                    let name = data.userName
                    let email = data.userEmail
                    print("User Name is : "+name!+" and Age is : "+email!)
                    if data.userNumber == 0
                    {
                        currentUser = data
                    }
                }
            }
        } catch {
            print("Fetching data Failed")
        }
    }
    
    func addAnnomusUser() -> Users?
    {
        let context = self.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "Users", in: context) else { return nil}
        
        let user = Users.init(entity: entity, insertInto: context)
        user.userName = "Anonymous"
        user.userEmail = "sample@test.com"
        user.userNumber = 0
        user.userID = "SDFDSFSDF123"
        self.saveContext()
        
        return user
    }
    
    func addBookmarkForCurrentUser(Symbol symbolData : SymbolDataClass)
    {
        if self.currentUser == nil
        {
            self.loadCurrentUser()
        }
        
        let context = self.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "Symbol", in: context) else { return }
        
        let symbolRecord = Symbol.init(entity: entity, insertInto: context)
        symbolRecord.symbol = symbolData.symbol
        symbolRecord.name = symbolData.name
        currentUser?.addToFavouriteSymbols(symbolRecord)
        self.saveContext()
    }
    
    func removeFavouriteForCurrentUser(Symbol symbolData :  SymbolDataClass)
    {
        if self.currentUser == nil
        {
            self.loadCurrentUser()
        }
        
        let context = self.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Symbol")
        request.returnsObjectsAsFaults = false
        do
        {
            let result = try context.fetch(request)
            for data in result as! [Symbol]
            {
                if data.user?.userID == self.currentUser!.userID
                {
                    if symbolData.symbol == data.symbol
                    {
                        data.user?.removeFromFavouriteSymbols(data)
                        print("Removed Successfully")
                        self.saveContext()
                    }
                }
            }
        } catch {
            print("Fetching data Failed")
        }
    }
    
    
    func updateOnlineDataWithFavouriteLocalRecords(OnlineData array : [SymbolDataClass])
    {
        if self.currentUser == nil
        {
            self.loadCurrentUser()
        }
        
        let context = self.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Symbol")
        request.returnsObjectsAsFaults = false
        do
        {
            let result = try context.fetch(request)
            for data in result as! [Symbol]
            {
                if data.user?.userID == self.currentUser!.userID
                {
                    for symbolData in array
                    {
                        if symbolData.symbol == data.symbol
                        {
                            symbolData.isFavourite = true
                            print("Favourite record found")
                        }
                    }
                    
                }
            }
        } catch {
            print("Fetching data Failed")
        }
    }
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "AlphaVantageTestProject")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

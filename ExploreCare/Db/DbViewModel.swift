//
//  DbViewModel.swift
//  ExploreCare
//
//  Created by Rasyid Ridla on 19/08/22.
//

//import Foundation
//import CoreData
//
//class DbViewModel {
//
//    func insertDataFirst(context: NSManagedObjectContext) {
//        context.performAndWait {
//            //insert item 1
//            let object1 = Item(context: context)
//            object1.itemName = "Chair"
//            object1.itemImage = "ic_chair"
//            object1.isFound = false
//            object1.catItem = Category(context: context)
//            object1.catItem?.categoryName = "Living Room"
//            object1.catItem?.categoryImage = "ic_livingRoom"
//            object1.catItem?.isLocked = false
//
//            //insert item 2
//            let object2 = Item(context: context)
//            object2.itemName = "Laptop"
//            object2.itemImage = "ic_laptop"
//            object2.isFound = false
//            object2.catItem = Category(context: context)
//            object2.catItem?.categoryName = "Living Room"
//            object2.catItem?.categoryImage = "ic_livingRoom"
//            object2.catItem?.isLocked = false
//
//            try? context.save()
//        }
//    }
//
//    func fetchRequest(context: NSManagedObjectContext) throws -> [CategoryModel] {
//        let fetchRequest: NSFetchRequest<Category> = Category.fetchRequest()
//        var resultArray: [CategoryModel] = []
//        let results = try context.fetch(fetchRequest)
//        for result in results {
//            let resultModel = result.asStruct
//            resultArray.append(resultModel)
//        }
//        return resultArray
//    }
//
//    func isFoundItem(context: NSManagedObjectContext) {
//        context.perform {
//        }
//    }
//}

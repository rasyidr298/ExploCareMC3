//
//  Category+CoreDataProperties.swift
//  ExploreCare
//
//  Created by Rasyid Ridla on 19/08/22.
//
//

//import Foundation
//import CoreData
//
//
//extension Category {
//
//    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
//        return NSFetchRequest<Category>(entityName: "Category")
//    }
//
//    @NSManaged public var categoryName: String?
//    @NSManaged public var categoryImage: String?
//    @NSManaged public var isLocked: Bool
//    @NSManaged public var item: NSSet?
//    
//    var asStruct: CategoryModel {
//        get {
//            return CategoryModel(categoryName: self.categoryName!, categoryImage: self.categoryImage!, isLocked: self.isLocked, item: [])
//        } set {
//            self.categoryName = newValue.categoryName
//            self.categoryImage = newValue.categoryImage
//            self.isLocked = newValue.isLocked
//            self.item = []
//        }
//    }
//    
//    public var objectArray: [Item] {
//        let set = item as? Set<Item> ?? []
//    
//        return set.sorted{
//            $0.wrappedName < $1.wrappedName
//        }
//    }
//
//}
//
//// MARK: Generated accessors for item
//extension Category {
//
//    @objc(addItemObject:)
//    @NSManaged public func addToItem(_ value: Item)
//
//    @objc(removeItemObject:)
//    @NSManaged public func removeFromItem(_ value: Item)
//
//    @objc(addItem:)
//    @NSManaged public func addToItem(_ values: NSSet)
//
//    @objc(removeItem:)
//    @NSManaged public func removeFromItem(_ values: NSSet)
//
//}
//
//extension Category : Identifiable {
//
//}

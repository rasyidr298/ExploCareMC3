//
//  Missions.swift
//  learnEnglish
//
//  Created by Rasyid Ridla on 29/06/22.
//

import Foundation
import UIKit

struct Category {
    var categoryName: String
    var categoryImage: UIImage
    var isLockLevel: Bool
    var object: [ObjectRecog]
}


struct ObjectRecog {
    var name: String
    var objectName: String
    var objectImage: UIImage
}


//dummy data
extension Category {
    static func dataObject() -> [Category] {
        return [
            Category(categoryName: "Living Room", categoryImage: UIImage(systemName: "trash.circle.fill")!, isLockLevel: false, object: [
                ObjectRecog(name: "Chair", objectName: "chair", objectImage: UIImage(systemName: "trash.circle.fill")!),
                ObjectRecog(name: "Sofa", objectName: "sofa", objectImage: UIImage(systemName: "trash.circle.fill")!),
                ObjectRecog(name: "Dining Table", objectName: "diningtable", objectImage: UIImage(systemName: "trash.circle.fill")!),
                ObjectRecog(name: "Tv Monitor", objectName: "tvmonitor", objectImage: UIImage(systemName: "trash.circle.fill")!),
                ObjectRecog(name: "Bench", objectName: "bench", objectImage: UIImage(systemName: "trash.circle.fill")!)
            ]),
            
            Category(categoryName: "Kitchen", categoryImage: UIImage(systemName: "trash.circle.fill")!, isLockLevel: false, object: [
                ObjectRecog(name: "Oven", objectName: "oven", objectImage: UIImage(systemName: "trash.circle.fill")!),
                ObjectRecog(name: "Toaster", objectName: "toaster", objectImage: UIImage(systemName: "trash.circle.fill")!),
                ObjectRecog(name: "Sink", objectName: "sink", objectImage: UIImage(systemName: "trash.circle.fill")!),
                ObjectRecog(name: "Refrigerator", objectName: "refrigerator", objectImage: UIImage(systemName: "trash.circle.fill")!),
                ObjectRecog(name: "Cup", objectName: "cup", objectImage: UIImage(systemName: "trash.circle.fill")!),
                ObjectRecog(name: "Fork", objectName: "fork", objectImage: UIImage(systemName: "trash.circle.fill")!),
                ObjectRecog(name: "Knife", objectName: "bench", objectImage: UIImage(systemName: "trash.circle.fill")!),
                ObjectRecog(name: "Spoon", objectName: "knife", objectImage: UIImage(systemName: "trash.circle.fill")!),
                ObjectRecog(name: "Bowl", objectName: "bowl", objectImage: UIImage(systemName: "trash.circle.fill")!)
            ]),
            
            Category(categoryName: "Bedroom", categoryImage: UIImage(systemName: "trash.circle.fill")!, isLockLevel: false, object: [
                ObjectRecog(name: "Bed", objectName: "bed", objectImage: UIImage(systemName: "trash.circle.fill")!),
                ObjectRecog(name: "Bench", objectName: "bench", objectImage: UIImage(systemName: "trash.circle.fill")!),
                ObjectRecog(name: "Backpack", objectName: "backpack", objectImage: UIImage(systemName: "trash.circle.fill")!),
                ObjectRecog(name: "Handbag", objectName: "handbag", objectImage: UIImage(systemName: "trash.circle.fill")!),
                ObjectRecog(name: "Book", objectName: "book", objectImage: UIImage(systemName: "trash.circle.fill")!)
            ]),
            
            Category(categoryName: "Garden", categoryImage: UIImage(systemName: "trash.circle.fill")!, isLockLevel: false, object: [
                ObjectRecog(name: "Potted Plant", objectName: "pottedplant", objectImage: UIImage(systemName: "trash.circle.fill")!),
                ObjectRecog(name: "Vase", objectName: "vase", objectImage: UIImage(systemName: "trash.circle.fill")!),
                ObjectRecog(name: "Sports Ball", objectName: "sportsball", objectImage: UIImage(systemName: "trash.circle.fill")!),
                ObjectRecog(name: "Kite", objectName: "kite", objectImage: UIImage(systemName: "trash.circle.fill")!),
                ObjectRecog(name: "Skateboard", objectName: "skateboard", objectImage: UIImage(systemName: "trash.circle.fill")!),
                ObjectRecog(name: "Umbrella", objectName: "umbrella", objectImage: UIImage(systemName: "trash.circle.fill")!),
                ObjectRecog(name: "Frisbee", objectName: "frisbee", objectImage: UIImage(systemName: "trash.circle.fill")!)
            ]),
            
            Category(categoryName: "Test1", categoryImage: UIImage(systemName: "trash.circle.fill")!, isLockLevel: true, object: []),
        
            Category(categoryName: "Test2", categoryImage: UIImage(systemName: "trash.circle.fill")!, isLockLevel: true, object: [])
        ]
    }
}


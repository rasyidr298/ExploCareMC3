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
    var descriptionName: String
    var objectImage: UIImage
    var objectImageLabel: UIImage
}


//dummy data
extension Category {
    static func dataObject() -> [Category] {
        return [
            Category(categoryName: "Living Room", categoryImage: UIImage(named: "ic_livingroom")!, isLockLevel: false, object: [
                ObjectRecog(name: "Chair", objectName: "chair", descriptionName: "\(udUserName ?? "") hangs her jacket over the chair.", objectImage: UIImage(named: "ic_chair")!, objectImageLabel: UIImage(named: "ic_chair_label")!),
                ObjectRecog(name: "Sofa", objectName: "sofa", descriptionName: "\(udUserName ?? "")'s cat loves to sleep on the sofa.", objectImage: UIImage(named: "ic_sofa")!, objectImageLabel: UIImage(named: "ic_sofa_label")!),
                ObjectRecog(name: "Remote", objectName: "remote", descriptionName: "\(udUserName ?? "") lost her TV remote between the sofa.", objectImage: UIImage(named: "ic_remote")!, objectImageLabel: UIImage(named: "ic_remote_label")!),
                ObjectRecog(name: "Monitor", objectName: "tvmonitor", descriptionName: "\(udUserName ?? "")'s monitor is playing a movie.", objectImage: UIImage(named: "ic_tvmonitor")!, objectImageLabel: UIImage(named: "ic_tvmonitor_label")!),
                ObjectRecog(name: "Clock", objectName: "clock", descriptionName: "The clock shows \(udUserName ?? "") that it’s noon.", objectImage: UIImage(named: "ic_clock")!, objectImageLabel: UIImage(named: "ic_clock_label")!)
            ]),
            
            Category(categoryName: "Kitchen", categoryImage: UIImage(named: "ic_kitchen")!, isLockLevel: false, object: [
                ObjectRecog(name: "Refrigerator", objectName: "refrigerator", descriptionName: "Tep keeps her leftovers in the refrigerator.", objectImage: UIImage(named: "ic_refrigerator")!, objectImageLabel: UIImage(named: "ic_refrigerator")!),
                ObjectRecog(name: "Cup", objectName: "cup", descriptionName: "Tep fills the cup with apple juice.", objectImage: UIImage(named: "ic_cup")!, objectImageLabel: UIImage(named: "ic_cup_label")!),
                ObjectRecog(name: "Fork", objectName: "fork", descriptionName: "Tep eats steak with fork and knife.", objectImage: UIImage(named: "ic_fork")!, objectImageLabel: UIImage(named: "ic_fork_label")!),
                ObjectRecog(name: "Spoon", objectName: "spoon", descriptionName: "Tep stirred her tea with a spoon. ", objectImage: UIImage(named: "ic_spoon")!, objectImageLabel: UIImage(named: "ic_spoon_label")!),
                ObjectRecog(name: "Bowl", objectName: "bowl", descriptionName: "Tep eats chicken soup from a bowl.", objectImage: UIImage(named: "ic_bowl")!, objectImageLabel: UIImage(named: "ic_bowl_label")!)
            ]),
            
            Category(categoryName: "Bedroom", categoryImage: UIImage(named: "ic_bedroom")!, isLockLevel: false, object: [
                ObjectRecog(name: "Clock", objectName: "clock", descriptionName: "\(udUserName ?? "") bought a new clock yesterday.", objectImage: UIImage(named: "ic_clock")!, objectImageLabel: UIImage(named: "ic_clock_label")!),
                ObjectRecog(name: "Laptop", objectName: "laptop", descriptionName: "\(udUserName ?? "") is turning off his laptop.", objectImage: UIImage(named: "ic_laptop")!, objectImageLabel: UIImage(named: "ic_laptop_label")!),
                ObjectRecog(name: "Backpack", objectName: "backpack", descriptionName: "\(udUserName ?? "") puts his sandwich in the backpack.", objectImage: UIImage(named: "ic_backpack")!, objectImageLabel: UIImage(named: "ic_backpack_label")!),
                ObjectRecog(name: "Bottle", objectName: "bottle", descriptionName: "\(udUserName ?? "") is filling up his water bottle.", objectImage: UIImage(named: "ic_bottle")!, objectImageLabel: UIImage(named: "ic_bottle_label")!),
                ObjectRecog(name: "Book", objectName: "book", descriptionName: "\(udUserName ?? "") loves to read his comic book.", objectImage: UIImage(named: "ic_book")!, objectImageLabel: UIImage(named: "ic_book_label")!)
            ]),
            
            Category(categoryName: "Garden", categoryImage: UIImage(named: "ic_garden")!, isLockLevel: false, object: [
                ObjectRecog(name: "Potted Plant", objectName: "pottedplant", descriptionName: "\(udUserName ?? "") is taking care of his potted plant.", objectImage: UIImage(named: "ic_pottedplant")!, objectImageLabel: UIImage(named: "ic_pottedplant_label")!),
                ObjectRecog(name: "Vase", objectName: "vase", descriptionName: "\(udUserName ?? "") just bought a new flower vase.", objectImage: UIImage(named: "ic_vase")!, objectImageLabel: UIImage(named: "ic_vase_label")!),
                ObjectRecog(name: "Ball", objectName: "sportsball", descriptionName: "\(udUserName ?? "") got a new soccer ball on his birthday.", objectImage: UIImage(named: "ic_sportsball")!, objectImageLabel: UIImage(named: "ic_sportsball_label")!),
                ObjectRecog(name: "Bench", objectName: "bench", descriptionName: "\(udUserName ?? "") likes to read on the bench.", objectImage: UIImage(named: "ic_bench")!, objectImageLabel: UIImage(named: "ic_bench_label")!),
                ObjectRecog(name: "Umbrella", objectName: "umbrella", descriptionName: "\(udUserName ?? "") has a colorful umbrella. ", objectImage: UIImage(named: "ic_umbrella")!, objectImageLabel: UIImage(named: "ic_umbrella_label")!)
            ]),
            
            Category(categoryName: "Zoo", categoryImage: UIImage(named: "ic_zoo")!, isLockLevel: false, object: [
                ObjectRecog(name: "Bear", objectName: "bear", descriptionName: "\(udUserName ?? "") sees the big sleeping bear.", objectImage: UIImage(named: "ic_bear")!, objectImageLabel: UIImage(named: "ic_bear_label")!),
                ObjectRecog(name: "Zebra", objectName: "zebra", descriptionName: "\(udUserName ?? "") loves petting the baby zebra.  ", objectImage: UIImage(named: "ic_zebra")!, objectImageLabel: UIImage(named: "ic_zebra_label")!),
                ObjectRecog(name: "Bird", objectName: "bird", descriptionName: "\(udUserName ?? "") watches a colorful bird show.", objectImage: UIImage(named: "ic_bird")!, objectImageLabel: UIImage(named: "ic_bird_label")!),
                ObjectRecog(name: "Elephant", objectName: "elephant", descriptionName: "\(udUserName ?? "") feeds fruits to the elephant. ", objectImage: UIImage(named: "ic_elephant")!, objectImageLabel: UIImage(named: "ic_elephant_label")!),
                ObjectRecog(name: "Giraffe", objectName: "giraffe", descriptionName: "\(udUserName ?? "") waves at the giraffe.", objectImage: UIImage(named: "ic_giraffe")!, objectImageLabel: UIImage(named: "ic_giraffe_label")!)
            ]),
            
            Category(categoryName: "Food", categoryImage: UIImage(named: "ic_food")!, isLockLevel: false, object: [
                ObjectRecog(name: "Banana", objectName: "banana", descriptionName: "Tep orders a banana split.", objectImage: UIImage(named: "ic_banana")!, objectImageLabel: UIImage(named: "ic_banana_label")!),
                ObjectRecog(name: "Apple", objectName: "apple", descriptionName: "Tep gives apple to her teacher.", objectImage: UIImage(named: "ic_apple")!, objectImageLabel: UIImage(named: "ic_apple_label")!),
                ObjectRecog(name: "Orange", objectName: "orange", descriptionName: "Tep drinks orange juice for breakfast.", objectImage: UIImage(named: "ic_orange")!, objectImageLabel: UIImage(named: "ic_orange_label")!),
                ObjectRecog(name: "Carrot", objectName: "carrot", descriptionName: "Tep feeds carrots to her rabbits.", objectImage: UIImage(named: "ic_carrot")!, objectImageLabel: UIImage(named: "ic_carrot_label")!),
                ObjectRecog(name: "Broccoli", objectName: "broccoli", descriptionName: "Tep loves her broccoli soup.", objectImage: UIImage(named: "ic_broccoli")!, objectImageLabel: UIImage(named: "ic_broccoli_label")!)
            ]),
            
            Category(categoryName: "Vehicles", categoryImage: UIImage(named: "ic_vehicle")!, isLockLevel: false, object: [
                ObjectRecog(name: "Bus", objectName: "bus", descriptionName: "\(udUserName ?? "") takes the bus to school.", objectImage: UIImage(named: "ic_bus")!, objectImageLabel: UIImage(named: "ic_bus_label")!),
                ObjectRecog(name: "Truck", objectName: "truck", descriptionName: "\(udUserName ?? "") loves playing with his toy truck.", objectImage: UIImage(named: "ic_truck")!, objectImageLabel: UIImage(named: "ic_truck_label")!),
                ObjectRecog(name: "Bicycle", objectName: "bicycle", descriptionName: "\(udUserName ?? "") goes to the park with his bicycle.", objectImage: UIImage(named: "ic_bicycle")!, objectImageLabel: UIImage(named: "ic_bicycle_label")!),
                ObjectRecog(name: "Car", objectName: "car", descriptionName: "\(udUserName ?? "") counts all the passing car.", objectImage: UIImage(named: "ic_car")!, objectImageLabel: UIImage(named: "ic_car_label")!),
                ObjectRecog(name: "Motorbike", objectName: "motorbike", descriptionName: "\(udUserName ?? "") rides the motorbike with his brother.", objectImage: UIImage(named: "ic_motorbike")!, objectImageLabel: UIImage(named: "ic_motorbike_label")!)
            ]),
            
            Category(categoryName: "Test1", categoryImage: UIImage(systemName: "trash.circle.fill")!, isLockLevel: true, object: []),
        
            Category(categoryName: "Test2", categoryImage: UIImage(systemName: "trash.circle.fill")!, isLockLevel: true, object: [])
        ]
    }
}


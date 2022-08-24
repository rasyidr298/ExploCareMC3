//
//  Missions.swift
//  learnEnglish
//
//  Created by Rasyid Ridla on 29/06/22.
//

import Foundation
import UIKit

struct Category: Equatable, Identifiable {
    var id: Int
    var categoryName: String
    var categoryImage: UIImage
    var isLockLevel: Bool
    var storyTellingText: String
    var charImage: UIImage
    var object: [ObjectRecog]
}


struct ObjectRecog: Equatable, Identifiable {
    var id: Int
    var name: String
    var objectName: String
    var descriptionName: String
    var objectImage: UIImage
    var objectImageString: String
    var objectImageLabel: UIImage
}

//storytelling text
func storyTelling(type: String) -> String {
    switch type {
    case "livingroom" : return "Hey, Manda here! Let's explore our living room. This is where our family spends time together. Now, can you help me find these things?"
    case "kitchen" : return "Hey, I'm Tep! Come with me to the kitchen, where all our yummy food is made. Can you spot where these things are?"
    case "bedroom" : return "Hiii, I'm Iky! I'm preparing for school and getting ready for bedtime. Can you help me look for these things?"
    case "garden" : return "Hiii, Rass here! The weather is sunny, let's play in the garden! Can you find these things?"
    case "zoo" : return "Hi, it's Manda here! We love and care for our animal friends. Let's go and meet them!"
    case "food" : return "Hey, it's Tep again! Food gives us energy to be healthy and strong. Let’s go find all of them!"
    case "vehicles" : return "Hiii, it's Iky! It's always fun to go outside and getting on rides. Let's see if you can find them!"
    default: return ""
    }
}


//dummy data
extension Category {
    static func dataObject() -> [Category] {
        return [
            Category(id: 1, categoryName: "Living Room", categoryImage: UIImage(named: "background_livingroom")!, isLockLevel: false, storyTellingText: storyTelling(type: "livingroom"), charImage: UIImage(named: "ic_char_manda")!, object: [
                ObjectRecog(id: 1, name: "Chair", objectName: "chair", descriptionName: "Manda hangs her jacket over the chair.", objectImage: UIImage(named: "ic_chair")!, objectImageString: "ic_chair", objectImageLabel: UIImage(named: "ic_chair_label")!),
                ObjectRecog(id: 2, name: "Sofa", objectName: "sofa", descriptionName: "Manda's cat loves to sleep on the sofa.", objectImage: UIImage(named: "ic_sofa")!, objectImageString: "ic_sofa", objectImageLabel: UIImage(named: "ic_sofa_label")!),
                ObjectRecog(id: 3, name: "Remote", objectName: "remote", descriptionName: "Manda lost her TV remote between the sofa.", objectImage: UIImage(named: "ic_remote")!, objectImageString: "ic_remote", objectImageLabel: UIImage(named: "ic_remote_label")!),
                ObjectRecog(id: 4, name: "Monitor", objectName: "tvmonitor", descriptionName: "Manda's monitor is playing a movie.", objectImage: UIImage(named: "ic_tvmonitor")!, objectImageString: "ic_tvmonitor", objectImageLabel: UIImage(named: "ic_tvmonitor_label")!),
                ObjectRecog(id: 5, name: "Clock", objectName: "clock", descriptionName: "The clock shows Manda that it’s noon.", objectImage: UIImage(named: "ic_clock")!, objectImageString: "ic_clock", objectImageLabel: UIImage(named: "ic_clock_label")!)
            ]),
            
            Category(id: 2, categoryName: "Kitchen", categoryImage: UIImage(named: "background_kitchen")!, isLockLevel: false, storyTellingText: storyTelling(type: "kitchen"), charImage: UIImage(named: "ic_char_tep")!, object: [
                ObjectRecog(id: 1, name: "Refrigerator", objectName: "refrigerator", descriptionName: "Tep keeps her leftovers in the refrigerator.", objectImage: UIImage(named: "ic_refrigerator")!, objectImageString: "", objectImageLabel: UIImage(named: "ic_refrigerator")!),
                ObjectRecog(id: 2, name: "Cup", objectName: "cup", descriptionName: "Tep fills the cup with apple juice.", objectImage: UIImage(named: "ic_cup")!, objectImageString: "ic_cup", objectImageLabel: UIImage(named: "ic_cup_label")!),
                ObjectRecog(id: 3, name: "Fork", objectName: "fork", descriptionName: "Tep eats steak with fork and knife.", objectImage: UIImage(named: "ic_fork")!, objectImageString: "ic_fork", objectImageLabel: UIImage(named: "ic_fork_label")!),
                ObjectRecog(id: 4, name: "Spoon", objectName: "spoon", descriptionName: "Tep stirred her tea with a spoon. ", objectImage: UIImage(named: "ic_spoon")!, objectImageString: "ic_spoon", objectImageLabel: UIImage(named: "ic_spoon_label")!),
                ObjectRecog(id: 5, name: "Bowl", objectName: "bowl", descriptionName: "Tep eats chicken soup from a bowl.", objectImage: UIImage(named: "ic_bowl")!, objectImageString: "ic_bowl", objectImageLabel: UIImage(named: "ic_bowl_label")!)
            ]),
            
            Category(id: 3, categoryName: "Bedroom", categoryImage: UIImage(named: "background_bedroom")!, isLockLevel: false, storyTellingText: storyTelling(type: "bedroom"), charImage: UIImage(named: "ic_char_iky")!, object: [
                ObjectRecog(id: 4, name: "Bottle", objectName: "bottle", descriptionName: "Iky is filling up his water bottle.", objectImage: UIImage(named: "ic_bottle")!, objectImageString: "ic_bottle", objectImageLabel: UIImage(named: "ic_bottle_label")!),
                ObjectRecog(id: 1, name: "Clock", objectName: "clock", descriptionName: "Iky bought a new clock yesterday.", objectImage: UIImage(named: "ic_clock")!, objectImageString: "ic_clock", objectImageLabel: UIImage(named: "ic_clock_label")!),
                ObjectRecog(id: 2, name: "Laptop", objectName: "laptop", descriptionName: "Iky is turning off his laptop.", objectImage: UIImage(named: "ic_laptop")!, objectImageString: "ic_laptop", objectImageLabel: UIImage(named: "ic_laptop_label")!),
                ObjectRecog(id: 5, name: "Book", objectName: "book", descriptionName: "Iky loves to read his comic book.", objectImage: UIImage(named: "ic_book")!, objectImageString: "ic_book", objectImageLabel: UIImage(named: "ic_book_label")!),
                ObjectRecog(id: 5, name: "Backpack", objectName: "backpack", descriptionName: "Iky puts his sandwich in the backpack.", objectImage: UIImage(named: "ic_backpack")!, objectImageString: "ic_backpack", objectImageLabel: UIImage(named: "ic_backpack_label")!)
            ]),
            
            Category(id: 4, categoryName: "Food", categoryImage: UIImage(named: "background_food")!, isLockLevel: false, storyTellingText: storyTelling(type: "food"), charImage: UIImage(named: "ic_char_tep")!, object: [
                ObjectRecog(id: 1, name: "Banana", objectName: "banana", descriptionName: "Tep orders a banana split.", objectImage: UIImage(named: "ic_banana")!, objectImageString: "ic_banana", objectImageLabel: UIImage(named: "ic_banana_label")!),
                ObjectRecog(id: 2, name: "Apple", objectName: "apple", descriptionName: "Tep gives apple to her teacher.", objectImage: UIImage(named: "ic_apple")!, objectImageString: "ic_apple", objectImageLabel: UIImage(named: "ic_apple_label")!),
                ObjectRecog(id: 3, name: "Orange", objectName: "orange", descriptionName: "Tep drinks orange juice for breakfast.", objectImage: UIImage(named: "ic_orange")!, objectImageString: "ic_orange", objectImageLabel: UIImage(named: "ic_orange_label")!),
                ObjectRecog(id: 4, name: "Carrot", objectName: "carrot", descriptionName: "Tep feeds carrots to her rabbits.", objectImage: UIImage(named: "ic_carrot")!, objectImageString: "ic_carrot", objectImageLabel: UIImage(named: "ic_carrot_label")!),
                ObjectRecog(id: 5, name: "Broccoli", objectName: "broccoli", descriptionName: "Tep loves her broccoli soup.", objectImage: UIImage(named: "ic_broccoli")!, objectImageString: "ic_broccoli", objectImageLabel: UIImage(named: "ic_broccoli_label")!)
            ]),
        ]
    }
    
    static func dataObjectAdventure() -> [Category] {
        return [
            Category(id: 5, categoryName: "Garden", categoryImage: UIImage(named: "background_garden")!, isLockLevel: false, storyTellingText: storyTelling(type: "garden"), charImage: UIImage(named: "ic_char_rass")!, object: [
                ObjectRecog(id: 1, name: "Potted Plant", objectName: "pottedplant", descriptionName: "Rass is taking care of his potted plant.", objectImage: UIImage(named: "ic_pottedplant")!, objectImageString: "ic_pottedplant", objectImageLabel: UIImage(named: "ic_pottedplant_label")!),
                ObjectRecog(id: 2, name: "Vase", objectName: "vase", descriptionName: "Rass just bought a new flower vase.", objectImage: UIImage(named: "ic_vase")!, objectImageString: "ic_vase", objectImageLabel: UIImage(named: "ic_vase_label")!),
                ObjectRecog(id: 3, name: "Ball", objectName: "sportsball", descriptionName: "Rass got a new soccer ball on his birthday.", objectImage: UIImage(named: "ic_sportsball")!, objectImageString: "ic_sportsball", objectImageLabel: UIImage(named: "ic_sportsball_label")!),
                ObjectRecog(id: 4, name: "Bench", objectName: "bench", descriptionName: "Rass likes to read on the bench.", objectImage: UIImage(named: "ic_bench")!, objectImageString: "ic_bench", objectImageLabel: UIImage(named: "ic_bench_label")!),
                ObjectRecog(id: 5, name: "Umbrella", objectName: "umbrella", descriptionName: "Rass has a colorful umbrella. ", objectImage: UIImage(named: "ic_umbrella")!, objectImageString: "ic_umbrella", objectImageLabel: UIImage(named: "ic_umbrella_label")!)
            ]),
            
            Category(id: 6, categoryName: "Zoo", categoryImage: UIImage(named: "background_zoo")!, isLockLevel: false, storyTellingText: storyTelling(type: "zoo"), charImage: UIImage(named: "ic_char_manda")!, object: [
                ObjectRecog(id: 1, name: "Bear", objectName: "bear", descriptionName: "Manda sees the big sleeping bear.", objectImage: UIImage(named: "ic_bear")!, objectImageString: "ic_bear", objectImageLabel: UIImage(named: "ic_bear_label")!),
                ObjectRecog(id: 2, name: "Zebra", objectName: "zebra", descriptionName: "Manda loves petting the baby zebra.  ", objectImage: UIImage(named: "ic_zebra")!, objectImageString: "ic_zebra", objectImageLabel: UIImage(named: "ic_zebra_label")!),
                ObjectRecog(id: 3, name: "Bird", objectName: "bird", descriptionName: "Manda watches a colorful bird show.", objectImage: UIImage(named: "ic_bird")!, objectImageString: "ic_bird", objectImageLabel: UIImage(named: "ic_bird_label")!),
                ObjectRecog(id: 4, name: "Elephant", objectName: "elephant", descriptionName: "Manda feeds fruits to the elephant. ", objectImage: UIImage(named: "ic_elephant")!, objectImageString: "ic_elephant", objectImageLabel: UIImage(named: "ic_elephant_label")!),
                ObjectRecog(id: 5, name: "Giraffe", objectName: "giraffe", descriptionName: "Manda waves at the giraffe.", objectImage: UIImage(named: "ic_giraffe")!, objectImageString: "ic_giraffe", objectImageLabel: UIImage(named: "ic_giraffe_label")!)
            ]),
            
            Category(id: 7, categoryName: "Vehicles", categoryImage: UIImage(named: "background_vehicle")!, isLockLevel: false, storyTellingText: storyTelling(type: "vehicles"), charImage: UIImage(named: "ic_char_iky")!, object: [
                ObjectRecog(id: 1, name: "Bus", objectName: "bus", descriptionName: "Iky takes the bus to school.", objectImage: UIImage(named: "ic_bus")!, objectImageString: "ic_bus", objectImageLabel: UIImage(named: "ic_bus_label")!),
                ObjectRecog(id: 2, name: "Truck", objectName: "truck", descriptionName: "Iky loves playing with his toy truck.", objectImage: UIImage(named: "ic_truck")!, objectImageString: "ic_truck", objectImageLabel: UIImage(named: "ic_truck_label")!),
                ObjectRecog(id: 3, name: "Bicycle", objectName: "bicycle", descriptionName: "Iky goes to the park with his bicycle.", objectImage: UIImage(named: "ic_bicycle")!, objectImageString: "ic_bicycle", objectImageLabel: UIImage(named: "ic_bicycle_label")!),
                ObjectRecog(id: 4, name: "Car", objectName: "car", descriptionName: "Iky counts all the passing car.", objectImage: UIImage(named: "ic_car")!, objectImageString: "ic_car", objectImageLabel: UIImage(named: "ic_car_label")!),
                ObjectRecog(id: 5, name: "Motorbike", objectName: "motorbike", descriptionName: "Iky rides the motorbike with his brother.", objectImage: UIImage(named: "ic_motorbike")!, objectImageString: "ic_motorbike", objectImageLabel: UIImage(named: "ic_motorbike_label")!)
            ])
        ]
    }
}


//dummy tutorial
extension Category {
    static func dataObjectTutorial() -> Category {
        return Category(id: 1, categoryName: "Tutorial", categoryImage: UIImage(named: "background_bedroom")!, isLockLevel: false, storyTellingText: storyTelling(type: "bedroom"), charImage: UIImage(named: "ic_char_iky")!, object: [
            ObjectRecog(id: 0, name: "Bottle", objectName: "bottle", descriptionName: "Iky is filling up his water bottle.", objectImage: UIImage(named: "ic_bottle")!, objectImageString: "ic_bottle", objectImageLabel: UIImage(named: "ic_bottle_label")!),
            ObjectRecog(id: 1, name: "Bottle", objectName: "truck", descriptionName: "Iky is filling up his water bottle.", objectImage: UIImage(named: "ic_bottle")!, objectImageString: "ic_bottle", objectImageLabel: UIImage(named: "ic_bottle_label")!)
        ])
        
    }
}


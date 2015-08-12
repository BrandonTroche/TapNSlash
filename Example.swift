//
//  AnimalDictionary.swift
//  PoopGame
//
//  Created by Jottie Brerrin on 6/8/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

/*
Global dictionary which defines the animal classes as:
Level: [String - Level: Dictionary - Animals]
Animals: [String:AnimalStruct]
*/

//let ANIMALDICTIONARY = [
//    //  "template":AnimalStruct(ID: "template",
//    //    spriteArray: ["blue","Art/Backyard/Mouse/mousetest.png"],
//    //    baseCapacity: 50,
//    //    baseRisk: 1,
//    //    baseRate: 30,
//    //    baseCost: 234,
//    //    baseTimeForUpgrade: 44
//    //  )
//    "DEFAULT":["DEFAULT":AnimalStruct(ID: "DEFAULT",
//        spriteArray: ["Art/Default/stop.png"],
//        baseCapacity: 0,
//        baseRate: 0,
//        baseCost: 0,
//        baseTimeForUpgrade: 0
//        )
//    ],
//    
//    //MARK: BACKYARD
//    "BACKYARD":[
//        "Skunk":AnimalStruct(ID: "Skunk",
//            spriteArray: ["Art/Backyard/skunk.png","Art/Backyard/skunk.png"],
//            baseCapacity: 50,
//            baseRate: 10,
//            baseCost: 234,
//            baseTimeForUpgrade: 10
//        ),
//        
//        "Cat":AnimalStruct(ID: "Cat",
//            spriteArray: ["Art/Backyard/cat.png","Art/Backyard/cat.png"],
//            baseCapacity: 50,
//            baseRate: 10,
//            baseCost: 234,
//            baseTimeForUpgrade: 10
//        ),
//        
//        "Dog":AnimalStruct(ID: "Dog",
//            spriteArray: ["Art/Backyard/dog.png","Art/Backyard/dog.png"],
//            baseCapacity: 50,
//            baseRate: 10,
//            baseCost: 234,
//            baseTimeForUpgrade: 10
//        ),
//        
//        "Sparrow":AnimalStruct(ID: "Sparrow",
//            spriteArray: ["Art/Backyard/sparrow.png","Art/Backyard/sparrow.png"],
//            baseCapacity: 50,
//            baseRate: 10,
//            baseCost: 234,
//            baseTimeForUpgrade: 10
//        ),
//        
//        "Squirrel":AnimalStruct(ID: "Squirrel",
//            spriteArray: ["Art/Backyard/squirrel.png","Art/Backyard/squirrel.png"],
//            baseCapacity: 50,
//            baseRate: 10,
//            baseCost: 234,
//            baseTimeForUpgrade: 10
//        ),
//        
//        "Fox":AnimalStruct(ID: "Fox",
//            spriteArray: ["Art/Backyard/fox.png","Art/Backyard/fox.png"],
//            baseCapacity: 50,
//            baseRate: 10,
//            baseCost: 234,
//            baseTimeForUpgrade: 10
//        )
//    ],//END BACKYARD
//    
//    
//    //MARK: FARM
//    "FARM":[
//        "Cow":AnimalStruct(ID: "Cow",
//            spriteArray: ["Art/Farm/cow.png","Art/Farm/cow.png"],
//            baseCapacity: 50,
//            baseRate: 10,
//            baseCost: 234,
//            baseTimeForUpgrade: 44
//        )
//        ,
//        "Bull":AnimalStruct(ID: "Bull",
//            spriteArray: ["Art/Farm/bull.png","Art/Farm/bull.png"],
//            baseCapacity: 50,
//            baseRate: 10,
//            baseCost: 234,
//            baseTimeForUpgrade: 44
//        )
//        ,
//        "Goat":AnimalStruct(ID: "Goat",
//            spriteArray: ["Art/Farm/goat.png","Art/Farm/goat.png"],
//            baseCapacity: 50,
//            baseRate: 10,
//            baseCost: 234,
//            baseTimeForUpgrade: 44
//        )
//        ,
//        "Pig":AnimalStruct(ID: "Pig",
//            spriteArray: ["Art/Farm/pig.png","Art/Farm/pig.png"],
//            baseCapacity: 50,
//            baseRate: 10,
//            baseCost: 234,
//            baseTimeForUpgrade: 44
//        ),
//        "Chicken":AnimalStruct(ID: "Chicken",
//            spriteArray: ["Art/Farm/chicken.png","Art/Farm/chicken.png"],
//            baseCapacity: 50,
//            baseRate: 10,
//            baseCost: 234,
//            baseTimeForUpgrade: 44
//        )
//        ,
//        "Sheep":AnimalStruct(ID: "Sheep",
//            spriteArray: ["Art/Farm/sheep.png","Art/Farm/sheep.png"],
//            baseCapacity: 50,
//            baseRate: 10,
//            baseCost: 234,
//            baseTimeForUpgrade: 44
//        )
//    ]//ENDFARM
//    
//      var baseCapacity: Float?,
//      var baseRisk: Float?,
//      var baseRate: Float?,
//      var baseCost: Float?,
//      var baseTimeForUpgrade: CCTime?,
//      //other dict values
//      var ID: String?, //String - its display name and key in dictionary
//      var spriteArray: NSArray?,
//    
//]
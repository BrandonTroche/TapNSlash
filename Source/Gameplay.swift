//
//  Gameplay.swift
//  TapNSlash
//
//  Created by Brandon Troche on 7/13/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation
import CoreMotion

class Gameplay: CCNode, CCPhysicsCollisionDelegate {
   
    /*Load in enemies between 60% and 100%*/
    
    weak var currentLevel: CCNode!
    weak var player: CCSprite!
    weak var walker: WalkerGoblin!
    
    var currentMaxAccelX: Double = 0.0
    var currentMaxAccelY: Double = 0.0
    var currentMaxAccelZ: Double = 0.0
    var currentMaxRotX: Double = 0.0
    var currentMaxRotY: Double = 0.0
    var currentMaxRotZ: Double = 0.0
    
    var motionManager = CMMotionManager()
    
    
    
    func resetMaxValues(){
        
        currentMaxRotX = 0.0
        currentMaxRotY = 0.0
        currentMaxRotZ = 0.0
        
        currentMaxAccelX = 0.0
        currentMaxAccelY = 0.0
        currentMaxAccelZ = 0.0
        
    }
    
    func didLoadFromCCB () {
       // motionManager.startAccelerometerUpdates()
       // println(motionManager.accelerometerData)
        
        let lvl = CCBReader.load("Levels/Level1") as! Level1
        
        currentLevel.addChild(lvl)
    }

    override func onEnter() {
        super.onEnter()
     //   self.resetMaxValues()
    }
    
    override func update(delta: CCTime) {
        
        
        
        
        if arc4random_uniform(100) < 3 {
            spawnAGoblin()
        }
        
        
    }
    
    
    func spawnAGoblin () {
        var newGoblin = CCBReader.load("WalkerGoblin") as! WalkerGoblin
        
        self.addChild(newGoblin)
        
//        newGoblin.positionType = CCPositionTypeMake(CCPositionTypeNormalized,CCPositionTypeNormalized, CCPositionReferenceCornerTopLeft)
        
        var randomXValue = CGFloat(arc4random_uniform(101)/100)
        
        //Arc4Random returns an integer. CCPositions are CGFLoats, so we cast the int as a CGFloat. We want the y position to be a number between 1 and 1.5, so we use some math to accomplish this.
        var randomYValue = CGFloat((arc4random_uniform(51)/100)+1)
        
        newGoblin.position = ccp(randomXValue, randomYValue)
    }
    
}

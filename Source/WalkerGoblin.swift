//
//  WalkerGoblin.swift
//  TapNSlash
//
//  Created by Brandon Troche on 7/13/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class WalkerGoblin: CCSprite {
   
    var speed: CGFloat = 3
    weak var healthBar: CCSprite!
    
    override func update(delta: CCTime) {
        self.position = ccp(position.x, position.y - speed)
    }
 
//    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, hero nodeA: CCNode!, goal: CCNode!) -> Bool {
//        goal.removeFromParent()
//        points++
//        scoreLabel.string = String(points)
//        return true
//    }
    
}

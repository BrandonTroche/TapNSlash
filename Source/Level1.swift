//
//  Level1.swift
//  TapNSlash
//
//  Created by Brandon Troche on 7/14/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class Level1: CCNode{
    
    var delegate: SpawnProtocol!
 
//    weak var walker: CCNode!
//    
//    var speed: CGFloat = 10
    
//    override func update(delta: CCTime) {
//        walker.position = ccp(position.x, position.y - speed)
//    }
    
    override func update(delta: CCTime) {
        
        if arc4random_uniform(100) < 5 {
            delegate.spawnGoblin()
        }
        
        
        if arc4random_uniform(100) < 1 {
            delegate.spawnQuickie()
        }
        
        
        
        //        numCoins.string = String(GameState.sharedInstance.score)
        
    }

    
}

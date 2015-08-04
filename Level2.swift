//
//  Level2.swift
//  TapNSlash
//
//  Created by Brandon Troche on 8/4/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class Level2: Level {
    
    override func update(delta: CCTime) {
        
        
        if arc4random_uniform(250) < 5 && gobCount != 40 {
            
            delegate.spawnGoblin()
            
            gobCount++
        }
        
        
        if arc4random_uniform(250) < 1 && qckCount != 8 {
            delegate.spawnQuickie()
            qckCount++
        }
        
        levelFinished()
        
        checkLevelOver()
        
        
    }

    
}
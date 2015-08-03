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
    var gobCount:Int = 0
    var qckCount:Int = 0
    
    enum GameState{
        case over, playing
    }
    
    var gameState: GameState = .playing

    
    override func update(delta: CCTime) {

        
        if arc4random_uniform(100) < 5 && gobCount != 20 {
            delegate.spawnGoblin()
            gobCount++
        }
        
        
        if arc4random_uniform(100) < 1 && qckCount != 5 {
            delegate.spawnQuickie()
            qckCount++
        }
        
        levelFinished()
        checkLevelOver()
        
        
    }
    
    func checkLevelOver() -> Bool {
        if gameState == .over {
            return true
        }
        return false
    }

    func levelFinished() -> Bool {
        if gobCount == 20 && qckCount == 5 {
            gameState = .over
            return true
        }
        return false
    }
    
}

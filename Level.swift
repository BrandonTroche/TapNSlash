//
//  Level.swift
//  TapNSlash
//
//  Created by Brandon Troche on 8/4/15.
//  Copyright (c) 2015 Apportable. All rights reserved.

import Foundation

class Level: CCNode {

    weak var lvlEndUI:LevelEndUI!

    var delegate: SpawnProtocol!

 
    enum GameState{
        case over, playing
    }

    var gameState: GameState = .playing
    var gobCount:Int = 0
    var qckCount:Int = 0

    
    override func update(delta: CCTime) {
        
        
        if ((arc4random_uniform(500) < 10) && gobCount < 12) {
            delegate.spawnGoblin()
            gobCount++
        }
    
        
        if ((arc4random_uniform(600) < 8) && qckCount < 12) {
            delegate.spawnQuickie()
            qckCount++
        }
        

        
            checkLevelOver()
                
                
    }
    
    func gob_Check()->Int{
        return gobCount
    }
    
    func qck_Check()->Int{
        return qckCount
    }
    
    func gob_Died(var died:Int){
        gobCount -= died
    }
    
    func qck_Died(var died:Int){
        qckCount -= died
    }

    func checkLevelOver() -> Bool {
        if gameState == .over {
            return true
        }
        return false
    }
 
}


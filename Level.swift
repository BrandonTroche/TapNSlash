//
//  Level.swift
//  TapNSlash
//
//  Created by Brandon Troche on 8/4/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
// Singleton~

import Foundation

class Level: CCNode {
    
    weak var lvlEndUI:LevelEndUI!
    
    var delegate: SpawnProtocol!
    
    var gobCount:Int = 0
    var qckCount:Int = 0
    var ogreCount:Int = 0
    
    var maxGob = 0
    var backParameterGob = 0
    var frontParameterGob = 0
    
    var maxVamp = 0
    var backParameterVamp = 0
    var frontParameterVamp = 0
    
    var maxOgre = 0
    var backParameterOgre = 0
    var frontParameterOgre = 0
    
    
    
    enum GameState{
        case over, playing
    }
    
    var gameState: GameState = .playing

    
    override func update(delta: CCTime) {
        
        
        if arc4random_uniform(UInt32(backParameterGob)) < UInt32(frontParameterGob) && gobCount != maxGob {
    
            delegate.spawnGoblin()
            gobCount++
        
        }
        
    
        if arc4random_uniform(UInt32(backParameterVamp)) < UInt32(frontParameterVamp) && qckCount != maxVamp {
            
            delegate.spawnQuickie()
            qckCount++
        
        }
        
        if arc4random_uniform(UInt32(backParameterOgre)) < UInt32(frontParameterOgre) && ogreCount != maxOgre {
            
            delegate.spawnOgre()
            ogreCount++
        
        }
                
            levelFinished()
                
            checkLevelOver()
                
                
    }

    func setVariables(var maxG:Int, var backG: Int, var frontG: Int,
                      var maxV:Int, var backV: Int, var frontV: Int,
                      var maxO:Int, var backO: Int, var frontO: Int) {
        
        maxGob = maxG
        backParameterGob = backG
        frontParameterGob = frontG
        
        maxVamp = maxV
        backParameterVamp = backV
        frontParameterVamp = frontV
        
        maxOgre = maxO
        backParameterOgre = backO
        frontParameterOgre = frontO
        
    }
    
    func checkLevelOver() -> Bool {
        if gameState == .over {
            return true
        }
        return false
    }
    
    func levelFinished() -> Bool {
        if gobCount == maxGob && qckCount == maxVamp && ogreCount == maxOgre {
            gameState = .over
            return true
        }
        return false
    }
    
    
}


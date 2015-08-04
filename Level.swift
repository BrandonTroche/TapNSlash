//
//  Level.swift
//  TapNSlash
//
//  Created by Brandon Troche on 8/4/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class Level: CCNode {
    
    var delegate: SpawnProtocol!
    var gobCount:Int = 0
    var qckCount:Int = 0
    
    enum GameState{
        case over, playing
    }
    
    var gameState: GameState = .playing

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
//
//  Player.swift
//  TapNSlash
//
//  Created by Brandon Troche on 7/13/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class Player: CCSprite {
    
    func tap() {
        
        stopAllActions()
        
        var slash = CCActionRotateTo(duration: 0.15, angle: -10)
        var center = CCActionRotateTo(duration: 0.15, angle: -55)
        
        runAction(CCActionSequence(array: [slash, center]))
    }
    
    func specialMove(){
        self.animationManager.runAnimationsForSequenceNamed("Special Attack")
    }
    
}

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
                
//        var slash = CCActionRotateBy(duration: 0.15, angle: 30)
        
//        self.runAction(slash) ?? 0
        
        self.animationManager.runAnimationsForSequenceNamed("Tap")

    }
//    
//    func center() {
//        var center = CCActionRotateBy(duration: 0.15, angle: -30)
//        self.runAction(center) ?? 0
//
//    }
    
    func specialMove(){
        self.animationManager.runAnimationsForSequenceNamed("Special Attack")
    }
    
}

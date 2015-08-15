//
//  Tutorial.swift
//  TapNSlash
//
//  Created by Brandon Troche on 8/15/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class Tutorial: CCNode {

    func gotIt(){
        self.animationManager.runAnimationsForSequenceNamed("TapToSlash")

    }
    
    func YeahGotIT(){
        self.animationManager.runAnimationsForSequenceNamed("CoinCollect")

    }
    
    func OkayCool(){
        self.animationManager.runAnimationsForSequenceNamed("GoodLuck")

    }
    
    func GoodLuck(){
        let scene = CCBReader.loadAsScene("Gameplay")
        CCDirector.sharedDirector().presentScene(scene)
    }
    
    func skip(){
        let scene = CCBReader.loadAsScene("Gameplay")
        CCDirector.sharedDirector().presentScene(scene)
    }
}

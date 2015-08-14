//
//  LevelEndUI.swift
//  TapNSlash
//
//  Created by Brandon Troche on 8/12/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class LevelEndUI: CCNode {
    func next(){
        if LEVEL < 19{
        LEVEL++
        let scene = CCBReader.loadAsScene("Gameplay")
        CCDirector.sharedDirector().presentScene(scene)
        } else{
            let scene = CCBReader.loadAsScene("LevelSelect")
            CCDirector.sharedDirector().presentScene(scene)
        }
    }
    
    func last(){
        if LEVEL > 1{
            LEVEL--
            let scene = CCBReader.loadAsScene("Gameplay")
            CCDirector.sharedDirector().presentScene(scene)
            
        } else{
            let scene = CCBReader.loadAsScene("LevelSelect")
            CCDirector.sharedDirector().presentScene(scene)
        }
    }
    
    func menu(){
        let scene = CCBReader.loadAsScene("LevelSelect")
        CCDirector.sharedDirector().presentScene(scene)
    }
}

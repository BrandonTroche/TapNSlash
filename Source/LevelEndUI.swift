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
        
    }
    
    func last(){
        
    }
    
    func menu(){
        let scene = CCBReader.loadAsScene("LevelSelect")
        CCDirector.sharedDirector().presentScene(scene)
    }
}

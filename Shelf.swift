//
//  Shelf.swift
//  TapNSlash
//
//  Created by Brandon Troche on 7/29/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class Shelf: CCSprite{
    
    func level1(){
        let scene = CCBReader.loadAsScene("Gameplay")
        CCDirector.sharedDirector().presentScene(scene)
    }
    
    
}
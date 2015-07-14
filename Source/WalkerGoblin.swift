//
//  WalkerGoblin.swift
//  TapNSlash
//
//  Created by Brandon Troche on 7/13/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class WalkerGoblin: CCSprite {
   
    var speed: CGFloat = 10
    
    override func update(delta: CCTime) {
        self.position = ccp(position.x, position.y - 10)
    }
    

    
}

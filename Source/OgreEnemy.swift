//
//  OgreEnemy.swift
//  TapNSlash
//
//  Created by Brandon Troche on 8/6/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class OgreEnemy: CCSprite {

    var speed: CGFloat = 0.5
    weak var healthBar: CCSprite!
    
    override func update(delta: CCTime) {
        
        self.position = ccp(position.x, position.y - speed)
        
        
    }
    
}

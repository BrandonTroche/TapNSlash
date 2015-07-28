//
//  RunnerGoblin.swift
//  TapNSlash
//
//  Created by Brandon Troche on 7/22/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class RunnerGoblin: CCSprite {
    
    var speed: CGFloat = 10
    weak var healthBar: CCSprite!
    
    func didLoadFromCCB(){
//        var action = CCAction
//        var particle = CCBReader.load("ParticleSystem") as! CCParticleSystem
    }
    
    override func update(delta: CCTime) {
        self.position = ccp(position.x, position.y - speed)
    }

    
}

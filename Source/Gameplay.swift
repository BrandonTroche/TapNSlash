//
//  Gameplay.swift
//  TapNSlash
//
//  Created by Brandon Troche on 7/13/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation
import CoreMotion

class Gameplay: CCNode, CCPhysicsCollisionDelegate {
   
    /*Load in enemies between 60% and 100%*/
    
    weak var currentLevel: CCNode!
    weak var player: Player!
    weak var gamePhysicsNode: CCPhysicsNode!
    weak var restartButton: CCButton!
    weak var experience: CCNode!
    weak var health: CCNode!
    
    var currentMaxAccelX: Double = 0.0
    var currentMaxAccelY: Double = 0.0
    var currentMaxAccelZ: Double = 0.0
    var currentMaxRotX: Double = 0.0
    var currentMaxRotY: Double = 0.0
    var currentMaxRotZ: Double = 0.0
    
    
    
    var motionManager = CMMotionManager()
    let damageDone:Float = 0.05
    let damageReceived: Float = 0.1378

    
    func resetMaxValues(){
        
        currentMaxRotX = 0.0
        currentMaxRotY = 0.0
        currentMaxRotZ = 0.0
        
        currentMaxAccelX = 0.0
        currentMaxAccelY = 0.0
        currentMaxAccelZ = 0.0
        
    }
    
    func didLoadFromCCB () {
       
       // println(motionManager.accelerometerData)
        
      //  let lvl = CCBReader.load("Levels/Level1") as! Level1
        
      //  currentLevel.addChild(lvl)
        
//        gamePhysicsNode.debugDraw = true
        
//        for var i = 0; i<9; i++ {
//            spawnGoblin()
//        }
        //schedule functions
//
//        for i in 0...100 {
//            spawnGoblin()
//        }
        
        gamePhysicsNode.collisionDelegate = self
        userInteractionEnabled = true
        
        motionManager.startAccelerometerUpdates()
        
        var storeZ: Double
        
        storeZ = motionBegan()
    }

//    override func onEnter() {
//        super.onEnter()
//     //   self.resetMaxValues()
//    }
    
    override func update(delta: CCTime) {
        
        if arc4random_uniform(100) < 3 {
            spawnGoblin()
        }
        
        
    }
    
    func restart() {
        let scene = CCBReader.loadAsScene("Gameplay")
        CCDirector.sharedDirector().presentScene(scene)
    }
    
    func motionBegan() -> Double {
        if motionManager.accelerometerActive {
        var zScope = self.motionManager.accelerometerData.acceleration.z
        println(zScope)
        return zScope
        }
        else {return 0.0}
    }
    
    
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, enemy: WalkerGoblin!, hero: CCSprite!) -> Bool{
        
//        let damage = enemy.healthBar.scaleX / 2
        
        
        enemy.healthBar.scaleX -= damageDone
        
        if enemy.healthBar.scaleX < 0 {
            
            enemy.removeFromParent()
            experience.visible = true
            experience.scaleX += Float(0.2)
            
        }
        
        return true
        
    }
    
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, enemy: WalkerGoblin!, boundary: CCNode!) -> Bool {
        enemy.removeFromParent()
        
        health.scaleX = clampf(health.scaleX - damageReceived, 0, 1)
        
        if health.scaleX == 0 {
            gameOver()
        }
        
        return true
    }
    
    func gameOver(){
        restartButton.visible = true
    }
    
    override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!){
        animationManager.runAnimationsForSequenceNamed("Tap")
    }
    
    func spawnGoblin(){
        var aGoblin = CCBReader.load("WalkerGoblin") as! WalkerGoblin
        
        gamePhysicsNode.addChild(aGoblin)
        
        let randNumberX = CGFloat(arc4random_uniform(100)) + CGFloat(100)
        let randNumberY = CGFloat(arc4random_uniform(200)) + CGFloat(600)
        
        aGoblin.position = ccp(randNumberX, randNumberY)
        
    }
}

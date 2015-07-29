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
    weak var playerLevel: CCLabelTTF!
    weak var numCoins: CCLabelTTF!
    
    var currentMaxAccelX: Double = 0.0
    var currentMaxAccelY: Double = 0.0
    var currentMaxAccelZ: Double = 0.0
    var currentMaxRotX: Double = 0.0
    var currentMaxRotY: Double = 0.0
    var currentMaxRotZ: Double = 0.0
    
    var motionManager = CMMotionManager()
    var curLvlPlyr:NSInteger = 1
    var curNumCoins: Int = 0 {
        didSet{
            numCoins.string = "\(curNumCoins)"
        }
    }
    
    let damageReceived: Float = 0.1378
    
    func damageDone() -> Double {
        
        return 0.054 + ((Double(curLvlPlyr) * 0.054)/4)
        
    }
    
    func expGain() -> Double{
        
        return 0.1146/Double(curLvlPlyr)
        
    }
    
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
//        motionManager.startAccelerometerUpdates()
        
//        var storeZ: Double
//        
//        storeZ = motionBegan()
        
        
        gamePhysicsNode.collisionDelegate = self
        userInteractionEnabled = true
        
        experience.scaleX = 0.0
        
        var level = CCBReader.load("Levels/Level1") as! Level1
        level.delegate = self
        currentLevel.addChild(level)
        
        var audio = OALSimpleAudio.sharedInstance()
        
        audio.playBg("GameScene.mp3", loop:true)
        
    }

//    override func onEnter() {
//        super.onEnter()
//     //   self.resetMaxValues()
//    }
    
    override func update(delta: CCTime) {
//        
//        if arc4random_uniform(100) < 5 {
//            spawnGoblin()
//        }
//        
//        
//        if arc4random_uniform(100) < 1 {
//            spawnQuickie()
//        }
//        numCoins.string = String(GameState.sharedInstance.score)

    }
    
    func restart() {
        let scene = CCBReader.loadAsScene("Gameplay")
        CCDirector.sharedDirector().presentScene(scene)
    }
    
    func special() {
        animationManager.runAnimationsForSequenceNamed("Special Attack")
    }
    
//    func motionBegan() -> Double {
//        if motionManager.accelerometerActive {
//        var zScope = self.motionManager.accelerometerData.acceleration.z
//        println(zScope)
//        return zScope
//        }
//        else {return 0.0}
//    }
    
    
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, enemy: WalkerGoblin!, hero: CCSprite!) -> ObjCBool{
        
        var enemyPositionX: CGFloat
        var enemyPositionY: CGFloat
        
        
        enemy.healthBar.scaleX -= Float(damageDone()) ?? 0
        
//        enemy.physicsBody.applyImpulse(ccp(0, 400))

        
        if enemy.healthBar.scaleX < 0 {
            enemyPositionX = enemy.position.x
            enemyPositionY = enemy.position.y
            
            enemy.removeFromParent()
            

            
            spawnCoin(enemyPositionX, Y:enemyPositionY)
            
            experience.visible = true
            experience.scaleX = clampf(experience.scaleX + Float(expGain()), 0, 0.573)
            if experience.scaleX > 0.5 {
                experience.scaleX = 0.0
                curLvlPlyr++
                playerLevel.string = String(curLvlPlyr)
            }
            
            
        }
        
        return true
        
    }
    
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, enemyR: RunnerGoblin!, hero: CCSprite!) -> ObjCBool {
        var enemyPositionX: CGFloat
        var enemyPositionY: CGFloat
        
        
        enemyR.healthBar.scaleX -= Float(damageDone()) * 5
        
        
        if enemyR.healthBar.scaleX < 0 {
            
            enemyPositionX = enemyR.position.x
            enemyPositionY = enemyR.position.y
            
            enemyR.removeFromParent()
            
            
            
            spawnCoin(enemyPositionX, Y:enemyPositionY)
            
            experience.visible = true
            experience.scaleX = clampf(experience.scaleX + Float(expGain()/5), 0, 0.573)
            
            if experience.scaleX > 0.5 {
                experience.scaleX = 0.0
                curLvlPlyr++
                playerLevel.string = String(curLvlPlyr)
            }
            
            
        }

        return true
    
    }
    
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, enemy: WalkerGoblin!, boundary: CCNode!) -> ObjCBool {
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
    
    
}

extension Gameplay: CoinDelegate{
    
    func coinUp(coinValue: Int) {
        
        curNumCoins += coinValue
        
    }
    
}

extension Gameplay: SpawnProtocol{
    
    func spawnGoblin(){
        var aGoblin = CCBReader.load("WalkerGoblin") as! WalkerGoblin
        
        gamePhysicsNode.addChild(aGoblin)
        
        let randNumberX = CGFloat(arc4random_uniform(100)) + CGFloat(100)
        let randNumberY = CGFloat(arc4random_uniform(200)) + CGFloat(600)
        
        aGoblin.position = ccp(randNumberX, randNumberY)
        
    }
    
    func spawnQuickie(){
        var aQuickie = CCBReader.load("RunnerGoblin") as! RunnerGoblin
        
        gamePhysicsNode.addChild(aQuickie)
        
        let randNumberX = CGFloat(arc4random_uniform(100)) + CGFloat(100)
        let randNumberY = CGFloat(arc4random_uniform(200)) + CGFloat(600)
        
        aQuickie.position = ccp(randNumberX, randNumberY)
    }
    
    func spawnCoin(var X: CGFloat, var Y:CGFloat){
        var coinImage = CCBReader.load("Coin") as! Coin
        
        coinImage.scaleX = 0.183
        coinImage.scaleY = 0.156
        
        self.addChild(coinImage)
        
        coinImage.position.x = X
        coinImage.position.y = Y
        
        coinImage.delegate = self
        
        coinImage.color.UIColor
    }
    
}




protocol SpawnProtocol {
    
    func spawnGoblin()
    func spawnQuickie()
    func spawnCoin(var X: CGFloat, var Y:CGFloat)
    
}


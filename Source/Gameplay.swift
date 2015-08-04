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
   
    //physicsBody.sensor = true - collection
    
    
    /*Load in enemies between 60% and 100%*/
    
    weak var currentLevel: CCNode!
    weak var player: Player!
    weak var gamePhysicsNode: CCPhysicsNode!
    weak var restartButton: CCButton!
    weak var experience: CCNode!
    weak var health: CCNode!
    weak var playerLevel: CCLabelTTF!
    weak var numCoins: CCLabelTTF!
    
    var motionManager = CMMotionManager()
    var curLvlPlyr:NSInteger = 1
    var curNumCoins: Int = 0 {
        didSet{
            numCoins.string = "\(curNumCoins)"
        }
    }
    
    let damageReceived: Float = 0.1378
    
    func damageDone() -> Double {
        
        return 0.25 + ((Double(curLvlPlyr) * 0.25)/4)
        
    }
    
    func expGain() -> Double{
        
        return 0.1146/Double(curLvlPlyr)
        
    }
    
    
    func didLoadFromCCB () {
       
       // println(motionManager.accelerometerData)
//        gamePhysicsNode.debugDraw = true

//        motionManager.startAccelerometerUpdates()
        
        let motionKit = MotionKit()
        
        motionKit.getAccelerometerValues (interval: 0.05){
            (x, y, z) in

//            println("X: \(x) Y: \(y) Z: \(z)")
            
//            self.xValLabel.string = "X: \(x)"
//            self.yValLabel.string = "Y: \(y)"
//            self.zValLabel.string = "Z: \(z)"

            self.player.position.x = CGFloat(236.7 + (x*125))
            
        }
        
        gamePhysicsNode.collisionDelegate = self
        userInteractionEnabled = true
        
        experience.scaleX = 0.0
        
//        var level = CCBReader.load("Levels/Level") as! Level
        var level = CCBReader.load("Levels/Level1") as! Level
        level.delegate = self
        currentLevel.addChild(level)
        
        var audio = OALSimpleAudio.sharedInstance()
        
        audio.playBg("GameScene.mp3", loop:true)
        
    }
    
    func restart() {
        let scene = CCBReader.loadAsScene("Gameplay")
        CCDirector.sharedDirector().presentScene(scene)
    }
    
    func special() {
        animationManager.runAnimationsForSequenceNamed("Special Attack")
    }
    
    
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, enemy: WalkerGoblin!, hero: CCSprite!) -> ObjCBool{
        
        var enemyPositionX: CGFloat
        var enemyPositionY: CGFloat
        var knockBack = CCActionMoveBy(duration: 0.15, position: CGPoint(x: 0, y: 60))
        
        enemy.runAction(knockBack) ?? 0
        
        enemy.healthBar.scaleX -= Float(damageDone()) ?? 0
        
        
        
//        enemy.physicsBody.applyImpulse(ccp(0, 400))

        
        if enemy.healthBar.scaleX < 0 {
            
            enemyPositionX = enemy.position.x
            enemyPositionY = enemy.position.y
            
            enemy.removeFromParent()
            
            if arc4random_uniform(10) == 1 {
                
                spawnCoin(enemyPositionX, Y:enemyPositionY)
                
            }
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
        
        
        enemyR.healthBar.scaleX -= Float(damageDone()) * 5 ?? 0
        
        
        if enemyR.healthBar.scaleX < 0 {
            
            enemyPositionX = enemyR.position.x
            enemyPositionY = enemyR.position.y
            
            enemyR.removeFromParent()
            
            
            if arc4random_uniform(10) < 5 {
                
            spawnCoin(enemyPositionX, Y:enemyPositionY)
                
            }
            
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
        
        enemy.removeFromParent() ?? donothing()
        
        health.scaleX = clampf(health.scaleX - damageReceived, 0, 1)
        
        if health.scaleX == 0 {
            gameOver()
        }
        
        return true
    }
    
    func ccPhysicsCollisionBegin(pair: CCPhysicsCollisionPair!, enemyR: WalkerGoblin!, boundary: CCNode!) -> ObjCBool {
        
        enemyR.removeFromParent()
        
        health.scaleX = clampf(health.scaleX - damageReceived, 0, 1)
        
        if health.scaleX == 0 {
            gameOver()
        }
        
        return true
    }
    
    
    func gameOver(){
        restartButton.visible = true
    }
    
    func donothing(){
        var x = 0
    }

    override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!){
        
        player.tap()
//        animationManager.runAnimationsForSequenceNamed("Tap")
    
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
        
        aGoblin.scaleX = 0.25
        aGoblin.scaleY = 0.25
        aGoblin.position = ccp(randNumberX, randNumberY)
        
    }
    
    func spawnQuickie(){
        var aQuickie = CCBReader.load("RunnerGoblin") as! RunnerGoblin
        
        gamePhysicsNode.addChild(aQuickie)
        
        let randNumberX = CGFloat(arc4random_uniform(100)) + CGFloat(100)
        let randNumberY = CGFloat(arc4random_uniform(200)) + CGFloat(600)

        aQuickie.scaleX = 0.25
        aQuickie.scaleY = 0.25
        
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


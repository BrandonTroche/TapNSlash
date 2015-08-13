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
    weak var experience: CCNode!
    weak var health: CCNode!
    weak var playerLevel: CCLabelTTF!
    weak var numCoins: CCLabelTTF!
    weak var coinCollectNode: CCNode!
    
    
    
//    var lvlEndUI = CCBReader.load("LevelEndUI") as! LevelEndUI
    
    
    var level = CCBReader.load("Levels/Level") as! Level

    var lvlDictionary = LEVELDICTIONARY
    
    var motionManager = CMMotionManager()
    var curLvlPlyr:NSInteger = 1
    
    var curLevelNumber:NSInteger = 0
    
    var curNumCoins: Int = 0 {
        didSet{
            numCoins.string = "\(curNumCoins)"
        }
    }
    
    var isDone: Bool = false
    
    let damageReceived: Float = 0.1378
    
    func damageDone() -> Double {
        
        return 0.25 + ((Double(curLvlPlyr) * 0.25)/4)
        
    }
    
    func expGain() -> Double{
        
        return 0.1146/Double(curLvlPlyr)
        
    }
    
    
    func didLoadFromCCB () {
        
        gamePhysicsNode.debugDraw = true
        
        let motionKit = MotionKit()
        
        motionKit.getAccelerometerValues (interval: 0.05){
            (x, y, z) in

//            println("X: \(x) Y: \(y) Z: \(z)")
            
//            self.xValLabel.string = "X: \(x)"
//            self.yValLabel.string = "Y: \(y)"
//            self.zValLabel.string = "Z: \(z)"

            self.player.position.x = CGFloat(236.7 + (x*250))
            
        }
        
        gamePhysicsNode.collisionDelegate = self
        userInteractionEnabled = true
        
        experience.scaleX = 0.0
        
        println(lvlDictionary)
        
        level.setVariables(lvlDictionary["LEVEL1"]!["goblinMax"]!,
            backG:  lvlDictionary["LEVEL1"]!["backParameterGoblin"]!,
            frontG: lvlDictionary["LEVEL1"]!["frontParameterGoblin"]!,
            maxV:   lvlDictionary["LEVEL1"]!["vampMax"]!,
            backV:  lvlDictionary["LEVEL1"]!["backParameterVamp"]!,
            frontV: lvlDictionary["LEVEL1"]!["frontParameterVamp"]!,
            maxO:   lvlDictionary["LEVEL1"]!["ogreMax"]!,
            backO:  lvlDictionary["LEVEL1"]!["backParameterOgre"]!,
            frontO: lvlDictionary["LEVEL1"]!["frontParameterOgre"]!)
        
//        var stringLevel = "LEVEL" + String(curLevelNumber)
//        
//        level.setVariables(lvlDictionary[stringLevel]!["goblinMax"]!,
//            backG:  lvlDictionary["LEVEL1"]!["backParameterGoblin"]!,
//            frontG: lvlDictionary["LEVEL1"]!["frontParameterGoblin"]!,
//            maxV:   lvlDictionary["LEVEL1"]!["vampMax"]!,
//            backV:  lvlDictionary["LEVEL1"]!["backParameterVamp"]!,
//            frontV: lvlDictionary["LEVEL1"]!["frontParameterVamp"]!,
//            maxO:   lvlDictionary["LEVEL1"]!["ogreMax"]!,
//            backO:  lvlDictionary["LEVEL1"]!["backParameterOgre"]!,
//            frontO: lvlDictionary["LEVEL1"]!["frontParameterOgre"]!)
//
        
        level.delegate = self
        currentLevel.addChild(level)
        
        var audio = OALSimpleAudio.sharedInstance()
        
        audio.playBg("GameScene.mp3", loop:true)
        
    }
    
    override func update(delta: CCTime) {
        if level.checkLevelOver() && !isDone {
            level.lvlEndUI.visible = true
            isDone = true
        }
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
        level.lvlEndUI.visible = true
    }
    
    func donothing(){
        var x = 0
    }

    override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!){
        
        player.tap()
    
    }
    
}

extension Gameplay: CoinDelegate{
    
    func coinUp(coinValue: Int) {
        
        curNumCoins += coinValue
        
    }
    
}

extension Gameplay: CurrentLevel{
    
    func getLevel(var ourCurrentLevel: Int) {
        
        curLevelNumber = ourCurrentLevel
        
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
    
    func spawnOgre() {
        var anOgre = CCBReader.load("OgreEnemy") as! OgreEnemy
        
        gamePhysicsNode.addChild(anOgre)
        
        let randNumberY = CGFloat(arc4random_uniform(200)) + CGFloat(600)
        
        anOgre.scaleX = 0.65
        anOgre.scaleY = 0.65
        anOgre.position = ccp(112, randNumberY)
    }
    
}


//protocol CurrentLevel{
//    func getLevel(var ourCurrentLevel: Int)
//}

protocol SpawnProtocol {
    
    func spawnGoblin()
    func spawnQuickie()
    func spawnOgre()
    func spawnCoin(var X: CGFloat, var Y:CGFloat)
    
}


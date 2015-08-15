//
//  LevelEndUI.swift
//  TapNSlash
//
//  Created by Brandon Troche on 8/12/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class LevelEndUI: CCNode {
    
    weak var curScore:CCLabelTTF!
    var didShow: Bool = false
    
    override func update(delta: CCTime) {
        if self.visible == true{
            
            
        curScore.string = String(GameStateSingleton.sharedInstance.score)
        
            if !didShow{
                summonAds()
                didShow = true
            }
            
        }
        
        }
    
    func didLoadFromCCB(){
        didShow = false
    }
    
    func restart(){
        let scene = CCBReader.loadAsScene("Gameplay")
        CCDirector.sharedDirector().presentScene(scene)
    }
    
    func summonAds(){
        iAdHandler.sharedInstance.displayInterstitialAd()
    }
    
    override func onExit() {
        
//        iAdHandler.sharedInstance.setBannerPosition(bannerPosition: .Top)
//        iAdHandler.sharedInstance.displayBannerAd()
        
        
       
    }
    
    
//    func next(){
//        if LEVEL < 19{
//        LEVEL++
//        let scene = CCBReader.loadAsScene("Gameplay")
//        CCDirector.sharedDirector().presentScene(scene)
//        } else{
//            let scene = CCBReader.loadAsScene("LevelSelect")
//            CCDirector.sharedDirector().presentScene(scene)
//        }
//    }
//    
//    func last(){
//        if LEVEL > 1{
//            LEVEL--
//            let scene = CCBReader.loadAsScene("Gameplay")
//            CCDirector.sharedDirector().presentScene(scene)
//            
//        } else{
//            let scene = CCBReader.loadAsScene("LevelSelect")
//            CCDirector.sharedDirector().presentScene(scene)
//        }
//    }
//    
//    func menu(){
//        let scene = CCBReader.loadAsScene("LevelSelect")
//        CCDirector.sharedDirector().presentScene(scene)
//    }
}

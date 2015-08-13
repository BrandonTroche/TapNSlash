//
//  Shelf.swift
//  TapNSlash
//
//  Created by Brandon Troche on 7/29/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class Shelf: CCSprite{
    
    var delegate: CurrentLevel!
    
    func level1(){
        
        let scene = CCBReader.loadAsScene("Gameplay")
        CCDirector.sharedDirector().presentScene(scene)
//        delegate.getLevel(1)
    }
    
    func level2(){
        
    }
    
    func level3(){
        
    }
    
    func level4(){
        
    }
    
    func level5(){
        
    }
    
    func level6(){
        
    }
    
    func level7(){
        
    }
    
    func level8(){
        
    }
    
    func level9(){
        
    }
    
    func level10(){
        
    }
    
    func level11(){
        
    }
    
    func level12(){
        
    }
    
    func level13(){
        
    }
    
    func level14(){
        
    }
    
    func level15(){
        
    }
    
    func level16(){
        
    }
    
    func level17(){
        
    }
    
    func level18(){
        
    }
    
    func level19(){
        
    }
}

protocol CurrentLevel{
    func getLevel(var ourCurrentLevel: Int)
}
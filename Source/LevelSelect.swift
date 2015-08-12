//
//  LevelSelect.swift
//  TapNSlash
//
//  Created by Brandon Troche on 7/28/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class LevelSelect: CCNode {
    
    func didLoadFromCCB(){
    self.animationManager.runAnimationsForSequenceNamed("Default Timeline")
    }
}

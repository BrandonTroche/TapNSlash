//
//  Coin.swift
//  TapNSlash
//
//  Created by Brandon Troche on 7/22/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import UIKit

class Coin: CCSprite {
    
    var delegate: CoinDelegate?
    var coinValue: Int = 1
//    var collect = CCActionMoveTo(duration: 0.15, position)

   
    func didLoadFromCCB() {
        userInteractionEnabled = true
    }
    
    override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        delegate?.coinUp(self.coinValue)
//        self.runAction(collect)
        self.removeFromParent()

    }
    
}


protocol CoinDelegate{
    func coinUp(coinValue: Int)
}
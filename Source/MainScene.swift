import Foundation

class MainScene: CCNode {

  //  var audio = OALSimpleAudio.sharedInstance()
    
    //audio.playEffect("")
    
    func play() {
        
    let gameplayScene = CCBReader.loadAsScene("Gameplay")
    CCDirector.sharedDirector().presentScene(gameplayScene)
    
    }
    
}

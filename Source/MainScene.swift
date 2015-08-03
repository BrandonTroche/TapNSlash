import Foundation


class MainScene: CCNode {

  //  var audio = OALSimpleAudio.sharedInstance()
    
    //audio.playEffect("")
    
    func play() {
        
    let scene = CCBReader.loadAsScene("LevelSelect")
    CCDirector.sharedDirector().presentScene(scene)
    
    }
    
}

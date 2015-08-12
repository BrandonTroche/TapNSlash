import Foundation


class MainScene: CCNode {

  //  var audio = OALSimpleAudio.sharedInstance()
    
    //audio.playEffect("")
    
    var audio = OALSimpleAudio.sharedInstance()
    
    
    func didLoadFromCCB(){
        var audio = OALSimpleAudio.sharedInstance()
        
        audio.playBg("MainSceneAudio.mp3", loop:true)
        
        self.animationManager.runAnimationsForSequenceNamed("Default Timeline")

    }
    
    
    func play() {
        
    let scene = CCBReader.loadAsScene("LevelSelect")
    CCDirector.sharedDirector().presentScene(scene)

    audio.stopBg()
        
    }
    
}

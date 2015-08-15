import Foundation


class MainScene: CCNode {

  //  var audio = OALSimpleAudio.sharedInstance()
    
    //audio.playEffect("")
    
    var audio = OALSimpleAudio.sharedInstance()
    
    
    func didLoadFromCCB(){
        var audio = OALSimpleAudio.sharedInstance()
        
        audio.playBg("MainSceneAudio2.mp3", loop:true)
        
    }
    
    
    func play() {
        
    let scene = CCBReader.loadAsScene("Tutorial")
    CCDirector.sharedDirector().presentScene(scene)

//    audio.stopBg()
        
    }
    
}

// Soccerのボタン

import SpriteKit

class SoccerButton : BasicButtonParts {
    
    static let mStretch1 : String = "SoccerStretch1"
    static let mStretch2 : String = "SoccerStretch2"
    static let mBack     : String = "SoccerBack"
    
    override init(aSKScene : SKScene, aXPosition : SXPosition, aYPosition : SYPosition) {
        super.init(aSKScene: aSKScene, aXPosition: aXPosition, aYPosition: aYPosition)
        
        var sBasicButton = SBasicButton()
        

        sBasicButton.name = SoccerButton.mStretch1
        sBasicButton.text = eText.STRETCH1.string()
        sBasicButton.baseImg = "540x136_ButtonBase"
        sBasicButton.touchImg = "540x136_ButtonTouch"
        sBasicButton.xyPosition = CGPoint(x: aXPosition.parts[4][2], y: aYPosition.parts[14][6])
        make(aBasicButton: sBasicButton)

        sBasicButton.name = SoccerButton.mStretch2
        sBasicButton.text = eText.STRETCH2.string()
        sBasicButton.xyPosition = CGPoint(x: aXPosition.parts[4][2], y: aYPosition.parts[14][4])
        make(aBasicButton: sBasicButton)

        sBasicButton.name = SoccerButton.mBack
        sBasicButton.text = eText.BACK.string()
        sBasicButton.xyPosition = CGPoint(x: aXPosition.parts[4][2], y: aYPosition.parts[14][2])
        make(aBasicButton: sBasicButton)
    }
}

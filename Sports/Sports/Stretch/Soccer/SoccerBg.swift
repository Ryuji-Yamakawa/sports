// Soccerのボタン

import SpriteKit

class SoccerButton : BasicButtonParts {
    
    override init(aSKScene : SKScene, aXPosition : SXPosition, aYPosition : SYPosition) {
        super.init(aSKScene: aSKScene, aXPosition: aXPosition, aYPosition: aYPosition)
        
        var sBasicButton = SBasicButton()
        

        sBasicButton.name = "Soccer"
        sBasicButton.text = "Soccer"
        sBasicButton.baseImg = "540x136_ButtonBase"
        sBasicButton.touchImg = "540x136_ButtonTouch"
        sBasicButton.xyPosition = CGPoint(x: aXPosition.parts[4][2], y: aYPosition.parts[14][2])
        make(aBasicButton: sBasicButton)

        sBasicButton.name = "Soccer2"
        sBasicButton.text = "Soccer2"
        sBasicButton.xyPosition = CGPoint(x: aXPosition.parts[4][2], y: aYPosition.parts[14][4])
        make(aBasicButton: sBasicButton)
    }
}

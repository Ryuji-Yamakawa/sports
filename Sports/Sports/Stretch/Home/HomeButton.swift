// Homeのボタン

import SpriteKit

class HomeButton : BasicButtonParts {
    
    override init(aSKScene : SKScene, aXPosition : SXPosition, aYPosition : SYPosition) {
        super.init(aSKScene: aSKScene, aXPosition: aXPosition, aYPosition: aYPosition)
        
        var sBasicButton = SBasicButton()
        

        sBasicButton.name = "Home"
        sBasicButton.text = "テキスト"
        sBasicButton.baseImg = "540x136_ButtonBase"
        sBasicButton.touchImg = "540x136_ButtonTouch"
        sBasicButton.xyPosition = CGPoint(x: aXPosition.parts[4][2], y: aYPosition.parts[14][2])
        make(aBasicButton: sBasicButton)
    }
}

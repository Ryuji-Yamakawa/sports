// Basketのボタン

import SpriteKit

class BasketButton : BasicButtonParts {
    
    static let mStretch3 : String = "BasketStretch3"
    static let mStretch4 : String = "BasketStretch4"
    static let mBack     : String = "BasketBack"
    
    override init(aSKScene : SKScene, aXPosition : SXPosition, aYPosition : SYPosition) {
        super.init(aSKScene: aSKScene, aXPosition: aXPosition, aYPosition: aYPosition)
        
        var sBasicButton = SBasicButton()
        

        sBasicButton.name = BasketButton.mStretch3
        sBasicButton.text = eText.STRETCH3.string()
        sBasicButton.baseImg = "540x136_ButtonBase"
        sBasicButton.touchImg = "540x136_ButtonTouch"
        sBasicButton.xyPosition = CGPoint(x: aXPosition.parts[4][2], y: aYPosition.parts[14][6])
        make(aBasicButton: sBasicButton)

        sBasicButton.name = BasketButton.mStretch4
        sBasicButton.text = eText.STRETCH4.string()
        sBasicButton.xyPosition = CGPoint(x: aXPosition.parts[4][2], y: aYPosition.parts[14][4])
        make(aBasicButton: sBasicButton)

        sBasicButton.name = BasketButton.mBack
        sBasicButton.text = eText.BACK.string()
        sBasicButton.xyPosition = CGPoint(x: aXPosition.parts[4][2], y: aYPosition.parts[14][2])
        make(aBasicButton: sBasicButton)
    }
}

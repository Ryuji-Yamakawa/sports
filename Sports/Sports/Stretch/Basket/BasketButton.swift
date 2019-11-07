// Basketのボタン

import SpriteKit

class BasketButton : BasicButtonParts {
    
    static let mStretch3 : String = "Basket" + "Stretch3"
    static let mStretch4 : String = "Basket" + "Stretch4"
    static let mBack     : String = "Basket" + "Back"
    
    override init(aSKScene : SKScene, aXPosition : SXPosition, aYPosition : SYPosition) {
        super.init(aSKScene: aSKScene, aXPosition: aXPosition, aYPosition: aYPosition)
        
        var sBasicButton = SBasicButton()
        
        sBasicButton.name = BasketButton.mStretch3
        sBasicButton.text = eText.STRETCH3.string()
        sBasicButton.baseImg = "540x136_ButtonBase"
        sBasicButton.touchImg = "540x136_ButtonTouch"
        sBasicButton.xyPosition = CGPoint(x: aXPosition.parts[1][1], y: aYPosition.parts[14][8])
        make(aBasicButton: sBasicButton)

        sBasicButton.name = BasketButton.mStretch4
        sBasicButton.text = eText.STRETCH4.string()
        sBasicButton.xyPosition = CGPoint(x: aXPosition.parts[1][1], y: aYPosition.parts[14][6])
        make(aBasicButton: sBasicButton)

        sBasicButton.name = BasketButton.mBack
        sBasicButton.text = eText.BACK.string()
        sBasicButton.xyPosition = CGPoint(x: aXPosition.parts[1][1], y: aYPosition.parts[14][4])
        make(aBasicButton: sBasicButton)
    }
}

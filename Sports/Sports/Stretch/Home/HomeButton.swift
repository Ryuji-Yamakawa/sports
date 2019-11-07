// Homeのボタン

import SpriteKit

class HomeButton : BasicButtonParts {
    
    static let mSoccer : String = "HomeSoccer"
    static let mBasket : String = "HomeBasket"
    
    override init(aSKScene : SKScene, aXPosition : SXPosition, aYPosition : SYPosition) {
        super.init(aSKScene: aSKScene, aXPosition: aXPosition, aYPosition: aYPosition)
        
        var sBasicButton = SBasicButton()
        
        sBasicButton.name = HomeButton.mSoccer
        sBasicButton.text = eText.SOCCER.string()
        sBasicButton.baseImg = "540x136_ButtonBase"
        sBasicButton.touchImg = "540x136_ButtonTouch"
        sBasicButton.xyPosition = CGPoint(x: aXPosition.parts[1][1], y: aYPosition.parts[14][8])
        make(aBasicButton: sBasicButton)

        sBasicButton.name = HomeButton.mBasket
        sBasicButton.text = eText.BASKET.string()
        sBasicButton.xyPosition = CGPoint(x: aXPosition.parts[1][1], y: aYPosition.parts[14][6])
        make(aBasicButton: sBasicButton)
    }
}

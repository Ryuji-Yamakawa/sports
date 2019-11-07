// Menuのボタン

import SpriteKit

class MenuButton : BasicButtonParts {
    
    static let mHome        : String = "MenuHome"
    static let mSoccer      : String = "MenuSoccer"
    static let mBasket      : String = "MenuBasket"
    static let mTimeCount   : String = "MenuTimeCount"
    
    override init(aSKScene : SKScene, aXPosition : SXPosition, aYPosition : SYPosition) {
        super.init(aSKScene: aSKScene, aXPosition: aXPosition, aYPosition: aYPosition)
        
        var sBasicButton = SBasicButton()
        
        sBasicButton.name = MenuButton.mHome
        sBasicButton.text = eText.HOME.string()
        sBasicButton.baseImg = "360x136"
        sBasicButton.touchImg = "360x136"
        sBasicButton.color = eFont.MENU.color()
        sBasicButton.size = eFont.MENU.size()
        sBasicButton.xyPosition = CGPoint(x: aXPosition.parts[1][1], y: aYPosition.menuHeight)
        make(aBasicButton: sBasicButton)

        sBasicButton.name = MenuButton.mSoccer
        sBasicButton.text = eText.SOCCER.string()
        sBasicButton.xyPosition = CGPoint(x: aXPosition.menuRightOut, y: aYPosition.menuHeight)
        make(aBasicButton: sBasicButton)

        sBasicButton.name = MenuButton.mBasket
        sBasicButton.text = eText.BASKET.string()
        sBasicButton.xyPosition = CGPoint(x: aXPosition.menuRightOut, y: aYPosition.menuHeight)
        make(aBasicButton: sBasicButton)

        sBasicButton.name = MenuButton.mTimeCount
        sBasicButton.text = eText.TIMECOUNT.string()
        sBasicButton.xyPosition = CGPoint(x: aXPosition.menuRightOut, y: aYPosition.menuHeight)
        make(aBasicButton: sBasicButton)
    }
}

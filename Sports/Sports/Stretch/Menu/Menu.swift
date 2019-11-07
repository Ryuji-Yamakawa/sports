// 上部のメニュー

import SpriteKit

class Menu {
    
    var menuButton : MenuButton!
    
    init( aSKScene: SKScene, aXPosition : SXPosition, aYPosition : SYPosition ) {
        menuButton = MenuButton(aSKScene: aSKScene, aXPosition: aXPosition, aYPosition: aYPosition)
    }
    
    func menuChange(aStretchControl : SStretchControl) {
        menuButton.menuChange(aStretchControl: aStretchControl)
    }
}

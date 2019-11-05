// アプリのホーム画面

import SpriteKit

class Home : Page {
    
    var shomeControl = SHomeControl()
    var homeButton : HomeButton!
    
    override init (aSKScene : SKScene, aXPosition : SXPosition, aYPosition : SYPosition) {
        super.init(aSKScene: aSKScene, aXPosition: aXPosition, aYPosition: aYPosition)
        
        pageParts.append(HomeButton(aSKScene: skScene, aXPosition: sXPosition, aYPosition: sYPosition))
    }
    
}

// TimeCountのボタン

import SpriteKit

class TimeCountButton : BasicButtonParts {
    
    static let mStart : String = "TimeCount" + "Start"
    static let mBack  : String = "TimeCount" + "Back"
    
    override init(aSKScene : SKScene, aXPosition : SXPosition, aYPosition : SYPosition) {
        super.init(aSKScene: aSKScene, aXPosition: aXPosition, aYPosition: aYPosition)
        
        var sBasicButton = SBasicButton()
        
        sBasicButton.name = TimeCountButton.mStart
        sBasicButton.text = eText.UNDERMAKING.string()
        sBasicButton.baseImg = "540x136_ButtonBase"
        sBasicButton.touchImg = "540x136_ButtonTouch"
        sBasicButton.xyPosition = CGPoint(x: aXPosition.parts[1][1], y: aYPosition.parts[14][6])
        make(aBasicButton: sBasicButton)

        sBasicButton.name = TimeCountButton.mBack
        sBasicButton.text = eText.BACK.string()
        sBasicButton.xyPosition = CGPoint(x: aXPosition.parts[1][1], y: aYPosition.parts[14][4])
        make(aBasicButton: sBasicButton)
    }
}

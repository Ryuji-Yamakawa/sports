// TimeCountのボタン

import SpriteKit

class TimeCountButton : BasicButtonParts {
    
    static let mStretch1 : String = "TimeCountStretch1"
    static let mStretch2 : String = "TimeCountStretch2"
    static let mBack     : String = "TimeCountBack"
    
    override init(aSKScene : SKScene, aXPosition : SXPosition, aYPosition : SYPosition) {
        super.init(aSKScene: aSKScene, aXPosition: aXPosition, aYPosition: aYPosition)
        
        var sBasicButton = SBasicButton()
        

        sBasicButton.name = TimeCountButton.mStretch1
        sBasicButton.text = eText.STRETCH1.string()
        sBasicButton.baseImg = "540x136_ButtonBase"
        sBasicButton.touchImg = "540x136_ButtonTouch"
        sBasicButton.xyPosition = CGPoint(x: aXPosition.parts[4][2], y: aYPosition.parts[14][6])
        make(aBasicButton: sBasicButton)

        sBasicButton.name = TimeCountButton.mStretch2
        sBasicButton.text = "ストレッチ（作成中）"
        sBasicButton.xyPosition = CGPoint(x: aXPosition.parts[4][2], y: aYPosition.parts[14][4])
        make(aBasicButton: sBasicButton)

        sBasicButton.name = TimeCountButton.mBack
        sBasicButton.text = eText.BACK.string()
        sBasicButton.xyPosition = CGPoint(x: aXPosition.parts[4][2], y: aYPosition.parts[14][2])
        make(aBasicButton: sBasicButton)
    }
}

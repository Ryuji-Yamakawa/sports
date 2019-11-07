// TimeCountの背景

import SpriteKit

class TimeCountBg : BasicButtonParts {
    
    static let mStretch1 : String = "TimeCount" + "Stretch1"
    static let mStretch2 : String = "TimeCount" + "Stretch2"
    static let mBack     : String = "TimeCount" + "Back"
    
    override init(aSKScene : SKScene, aXPosition : SXPosition, aYPosition : SYPosition) {
        super.init(aSKScene: aSKScene, aXPosition: aXPosition, aYPosition: aYPosition)
    }
    
    // 画像を作成する
    func setStretchMan(aName : String) {
        
        deleteAll()
        
        var baseImg : String = ""
        
        switch aName {
            case SoccerButton.mStretch1:
                baseImg = "stretchMan01"
            case SoccerButton.mStretch2:
                baseImg = "stretchMan02"
            case BasketButton.mStretch3:
                baseImg = "stretchMan03"
            case BasketButton.mStretch4:
                baseImg = "stretchMan04"
        default:
            print("TimeCountBg setStretchManエラー")
        }
        
        var sBasicButton = SBasicButton()
        
        sBasicButton.name = TimeCountBg.mStretch1
        sBasicButton.text = ""
        sBasicButton.baseImg = baseImg
        sBasicButton.touchImg = ""
        sBasicButton.xyPosition = CGPoint(x: sXPosition.parts[1][1], y: sYPosition.parts[14][9])
        sBasicButton.zPosition = eZPosition.BG
        make(aBasicButton: sBasicButton)
    }
}

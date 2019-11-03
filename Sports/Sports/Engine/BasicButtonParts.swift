// ボタン管理クラス

import SpriteKit

class BasicButtonParts: PageParts {
    
    func make(aBasicButton : SBasicButton) {
        
        var sNode = SNode()
        var sSprite = SSprite()
        var sLabel = SLabel()
        
        sSprite.name        = aBasicButton.name
        sSprite.imgName     = aBasicButton.baseImg
        sSprite.xyPosition  = aBasicButton.xyPosition
        sSprite.zPosition   = aBasicButton.zPosition
        
        if aBasicButton.text != "" {
            sLabel.name = aBasicButton.name
            sLabel.family = aBasicButton.family
            sLabel.color = aBasicButton.color
            sLabel.size = aBasicButton.size
            sLabel.zPosition = aBasicButton.zPosition
        }
        
        
        
    }
}

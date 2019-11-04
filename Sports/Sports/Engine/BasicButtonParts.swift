// ボタン管理クラス

import SpriteKit

class BasicButtonParts: PageParts {
    
    func make(aBasicButton : SBasicButton) {
        
        var sNode = SNode()
        var sSprite = SSprite()
        var sLabel = SLabel()
        
        sNode.name = aBasicButton.name
        
        // ベース画像
        sSprite.name        = aBasicButton.name
        sSprite.imgName     = aBasicButton.baseImg
        sSprite.xyPosition  = aBasicButton.xyPosition
        sSprite.zPosition   = aBasicButton.zPosition
        sNode.nodes.append(sSprite.node())
        
        // テキスト
        if aBasicButton.text != "" {
            sLabel.name = aBasicButton.name
            sLabel.family = aBasicButton.family
            sLabel.color = aBasicButton.color
            sLabel.size = aBasicButton.size
            sLabel.zPosition = aBasicButton.zPosition
            sNode.nodes.append(sLabel.node())
        }
        
        // タッチ画像
        if aBasicButton.touchImg != "" {
            sNode.touchImgExist = true
            sSprite.imgName     = aBasicButton.touchImg
            sNode.nodes.append(sSprite.node())
        }
        
        
        
    }
}

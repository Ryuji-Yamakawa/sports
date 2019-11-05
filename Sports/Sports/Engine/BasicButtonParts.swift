// ボタン管理クラス

import SpriteKit

class BasicButtonParts: PageParts {
    
    func make(aBasicButton : SBasicButton) {
        
        var sNode = SNode()
        var sSprite = SSprite()
        var sLabel = SLabel()
        
        sNode.name          = aBasicButton.name
        
        // ベース画像 クリックのため必須
        sSprite.name        = aBasicButton.name
        sSprite.imgName     = aBasicButton.baseImg
        sSprite.xyPosition  = aBasicButton.xyPosition
        sSprite.zPosition   = aBasicButton.zPosition
        sNode.nodes.append(sSprite.node())
        sNode.initPosition.append(aBasicButton.xyPosition)
        sNode.nowPosition.append(aBasicButton.xyPosition)
        
        if aBasicButton.baseImg == "" { print("BasicButtonPartsエラー baseImgなし")}
        
        // テキスト
        if aBasicButton.text != "" {
            sLabel.name     = aBasicButton.name
            sLabel.family   = aBasicButton.family
            sLabel.color    = aBasicButton.color
            sLabel.size     = aBasicButton.size
            sLabel.text     = aBasicButton.text
            sLabel.xyPosition  = aBasicButton.xyPosition
            sLabel.zPosition = aBasicButton.zPosition
            print("BBP確認　テキスト")
            sNode.nodes.append(sLabel.node())
            sNode.initPosition.append(aBasicButton.xyPosition)
            sNode.nowPosition.append(aBasicButton.xyPosition)
        }
        
        // タッチ画像
        if aBasicButton.touchImg != "" {
            sNode.touchImgExist = true
            sSprite.imgName     = aBasicButton.touchImg
            print("BBP確認　タッチ画像")
            sNode.nodes.append(sSprite.node())
            sNode.initPosition.append(aBasicButton.xyPosition)
            sNode.nowPosition.append(aBasicButton.xyPosition)
        }
        
        sNodes.append(sNode)
        
        addChild(a : sNodes.count - 1)
        
    }
}

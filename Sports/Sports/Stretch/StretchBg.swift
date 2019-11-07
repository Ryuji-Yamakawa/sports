// ストレッチゲーム

import SpriteKit

class StretchBg : PageParts {
    
    override init(aSKScene : SKScene, aXPosition : SXPosition, aYPosition : SYPosition) {
        super.init(aSKScene: aSKScene, aXPosition: aXPosition, aYPosition: aYPosition)
        
        // 背景の白
        var sSprite = SSprite()
        sSprite.name = "Debug"
        sSprite.imgName = "Bg"
        sSprite.xyPosition = CGPoint(x : aXPosition.center, y : aYPosition.center)
        sSprite.zPosition = eZPosition.BG
        sSprite.hidden = false
        aSKScene.addChild(sSprite.node())
        
        // 広告の部分を塗りつぶす
        let square = SKSpriteNode(color: UIColor.gray,
                                  size: CGSize(width: sXPosition.gameWidth,
                                               height: sYPosition.upperAdSpace))
        square.position = CGPoint(x:0, y: sYPosition.gameHeight - sYPosition.upperAdSpace)
        square.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        square.zPosition = eZPosition.BG
        square.name = "AdSpace"
        aSKScene.addChild(square)
    }
}

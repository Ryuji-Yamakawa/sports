// デバッグを画面に表示する

import Foundation
import SpriteKit

class Debug {
    
    var skScene : SKScene!
    var sSprite = SSprite()
    var sLabel = SLabel()
    var nodes : [SKNode] = []
    var labels : [SKLabelNode] = []
    
    init(aScene: SKScene, aXPosition : SXPosition, aYPosition : SYPosition ) {
        skScene = aScene
        
        // タッチの円の上
        sSprite.name = "Debug"
        sSprite.imgName = "360x162_Upper"
        sSprite.xyPosition = CGPoint(x : aXPosition.center, y : aYPosition.center + 50)
        sSprite.zPosition = eZPosition.DEBUG
        sSprite.hidden = true
        nodes.append(sSprite.node())
        
        // タッチの円の下
        sSprite.imgName = "360x162_Under"
        sSprite.xyPosition = CGPoint(x : aXPosition.center, y : aYPosition.center - 50)
        nodes.append(sSprite.node())
        
        // タッチしているボタン名を表示
        sLabel.name = "DebugNode"
        sLabel.color = eFont.BUTTON.color()
        sLabel.size = eFont.BUTTON.size()
        sLabel.xyPosition = CGPoint(x: aXPosition.parts[2][1], y: aYPosition.parts[14][10])
        sLabel.zPosition = eZPosition.DEBUG
        sLabel.text = "デバッグ"
        labels.append(sLabel.node())
        
        for i in 0 ... nodes.count - 1 {
            skScene.addChild(nodes[i])
        }
        for i in 0 ... labels.count - 1 {
            skScene.addChild(labels[i])
        }
    }
    
    func setTouch( aTouch : STouch) {
        if aTouch.stat == .NONE || aTouch.stat == .END {
            nodes[0].isHidden = true
            nodes[1].isHidden = true
        }
        // ポインタを表示する設定なら
        else {
            nodes[0].isHidden = false
            nodes[1].isHidden = false
            nodes[0].position = CGPoint(x: CGFloat(aTouch.nowX), y: CGFloat(aTouch.nowY) + 50)
            nodes[1].position = CGPoint(x: CGFloat(aTouch.nowX), y: CGFloat(aTouch.nowY) - 50)
        }
        // タッチしているボタン名を表示
        labels[0].text = aTouch.nowN + " x:" + String(aTouch.nowX) + " y:" + String(aTouch.nowY)
    }
    
    func delete() {
        skScene.removeChildren(in: nodes)
        skScene.removeChildren(in: labels)
    }
}

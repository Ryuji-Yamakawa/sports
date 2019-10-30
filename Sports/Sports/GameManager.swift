// ゲームの切り替えを行う

import Foundation
import SpriteKit

class GameManager : SKScene {
    
    var xPosition : sXPosition!
    var yPosition : sYPosition!
    var touchManager : TouchManager!
    
    // GameManagerを表示する
    override func didMove(to view: SKView) {
        self.backgroundColor = UIColor.white
        // タッチマネージャを登録
        touchManager = TouchManager()
    }
    
    // ポジションをセットする
    func setPosition(aXPosition : sXPosition, aYPosition : sYPosition) {
        
        xPosition = aXPosition
        yPosition = aYPosition
        
        // 広告の部分を塗りつぶす
        let square = SKSpriteNode(color: UIColor.gray,
                                  size: CGSize(width: xPosition.gameWidth,
                                               height: yPosition.upperAdSpace))
        square.position = CGPoint(x:0, y:yPosition.gameHeight - yPosition.upperAdSpace)
        square.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        self.addChild(square)
    }
    
    // ゲームを始める
    func startGame(aGame : eGame) {
        print("GameManager startGame", aGame, xPosition.gameWidth, yPosition.gameHeight)
    }
}

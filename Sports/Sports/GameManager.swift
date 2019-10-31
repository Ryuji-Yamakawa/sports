// ゲームの切り替えを行う

import Foundation
import SpriteKit

class GameManager : SKScene {
    
    var xPosition : sXPosition!
    var yPosition : sYPosition!
    var touchLockON : Bool = false
    var touchManager : TouchManager!
    
    // GameManagerを起動する
    override func didMove(to view: SKView) {
        self.backgroundColor = UIColor.white
        // タッチマネージャを初期化する
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
    
    // タッチイベント
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent? ) {
        makeStructTouch(touches: touches, aTouchStatus: .BEGIN)
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent? ) {
        makeStructTouch(touches: touches, aTouchStatus: .DRAG)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent? ) {
        makeStructTouch(touches: touches, aTouchStatus: .END)
    }
    
    // タッチの構造体を更新する
    func makeStructTouch(touches: Set<UITouch>, aTouchStatus : eTouchStatus) {
        
        // ロックされていたら処理しない
        if touchLockON { return }
        
        for touch: AnyObject in touches {

            var x : Int = 0
            var y : Int = 0
            var node : String = ""
            var outGameSizeFlag : Bool = false
            
            // ゲームサイズを超えた場合の処理 X
            if Int(touch.location(in: self).x - 1) < 0 {
                outGameSizeFlag = true
            }
            else if Int(touch.location(in: self).x + 1) > eGameSize.WIDTH {
                x = eGameSize.WIDTH
                outGameSizeFlag = true
            }
            else {
                x = Int(touch.location(in: self).x )
            }
            
            // ゲームサイズを超えた場合の処理 Y
            if Int(touch.location(in: self).y - 1) < 0 {
                outGameSizeFlag = true
            }
            else if Int(touch.location(in: self).y + 1) > eGameSize.HEIGHT {
                y = eGameSize.HEIGHT
                outGameSizeFlag = true
            }
            else {
                y = Int(touch.location(in: self).y)
            }
            
            // タッチされたノードの名前を取得する
            if outGameSizeFlag == false {
                node = self.atPoint(touch.location(in: self)).name!
            }
            
            // TouchManagerを更新する
            switch aTouchStatus {
            case .NONE:
                break
            case .BEGIN:
                touchManager.begin(x: x, y: y, node: node)
            case .DRAG:
                touchManager.drag(x: x, y: y, node: node)
            case .END:
                touchManager.end(x: x, y: y, node: node)
            }
            
            // タッチの結果を取得して動作させる
            touchAction(aTouch: touchManager.getTouch())
        }
    }
    
    // タッチの結果で動作する
    func touchAction(aTouch : sTouch) {
        
    }
    
}

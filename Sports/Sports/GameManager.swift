// ゲームの切り替えを行う

import Foundation
import SpriteKit

class GameManager : SKScene {
    
    var sGameControl : SGameControl = SGameControl()
    var sXPosition : SXPosition!
    var sYPosition : SYPosition!
    var touchLockON : Bool = false
    var touchManager : TouchManager!
    var debug : Debug!
    var stretch : Stretch!
    
    // GameManagerを起動する
    override func didMove(to view: SKView) {
        self.backgroundColor = UIColor.white
        
        touchManager = TouchManager()
    }
    
    // ポジションをセットする
    func setPosition(aXPosition : SXPosition, aYPosition : SYPosition) {
        
        sXPosition = aXPosition
        sYPosition = aYPosition
        
        debug = Debug( aScene: self, aXPosition: sXPosition, aYPosition: sYPosition )
    }
    
    // ゲームを始める
    func startGame(aGame : eGame) {
        print("GameManager startGame", aGame, sXPosition.gameWidth, sYPosition.gameHeight)
        
        sGameControl.nowPlay = aGame
        
        switch sGameControl.nowPlay {
        case .STRETCH:
            stretch = Stretch(aSKScene: self, aXPosition: sXPosition, aYPosition: sYPosition)
        case .SETTING:
            print("GameManager startGame 作成中")
        }
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
        // タッチを初期化する
        touchManager = TouchManager()
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
            else if Int(touch.location(in: self).x + 1) > sXPosition.gameWidth {
                x = sXPosition.gameWidth
                outGameSizeFlag = true
            }
            else {
                x = Int(touch.location(in: self).x )
            }
            
            // ゲームサイズを超えた場合の処理 Y
            if Int(touch.location(in: self).y - 1) < 0 {
                outGameSizeFlag = true
            }
            else if Int(touch.location(in: self).y + 1) > sYPosition.gameHeight {
                y = sYPosition.gameHeight
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
    func touchAction(aTouch : STouch) {
        
        debug.setTouch(aTouch: aTouch)
        
        switch sGameControl.nowPlay {
        case .STRETCH : sGameControl = stretch.setTouch(aTouch: aTouch, aGameControl: sGameControl)
        case .SETTING : print("GameManager touchAction 作成中")
        }
        
        if sGameControl.nowPlay != sGameControl.nextGame {
        }
        
        // タッチロックの時間をセット。
        if sGameControl.touchLockTime != 0.0 {
           touchLockON = true
            //アニメーション後の処理
            DispatchQueue.main.asyncAfter(deadline: .now() + sGameControl.touchLockTime) {
                // タッチロック解除
                self.touchLockON = false
            }
            sGameControl.touchLockTime = 0.0
        }
    }
    
}

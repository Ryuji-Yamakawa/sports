// タッチの値を管理する

import Foundation

class TouchManager {
    var touch : sTouch!  // タッチ変数
    let play : Int = 80 // ドラッグ開始までの遊び　あそび
    
    init() { touch = sTouch() }
    
    // タッチビギン
    func begin( x : Int, y : Int , node : String) {
        
        //print("TouchManager：ビギン：", x , y , node)
        touch.stat = .BEGIN
        touch.nowX = x
        touch.nowY = y
        touch.nowN = node
        touch.beginX = x
        touch.beginY = y
        touch.beginN = node
        
        touch.beforeY = y   // ver.2.2スクロールに変更。
    }
    
    // タッチドラッグ
    func drag( x : Int, y : Int , node : String) {
        //print("TouchManager：ドラッグ：", x , y , node)
        // もしタッチ無効時にドラッグが始まっていたら、beginX,Yが0,0になっているので修正
        if touch.beginX == 0 && touch.beginY == 0 { touch.beginX = x; touch.beginY = y }
        
        touch.stat = .DRAG
        touch.nowX = x
        touch.nowY = y
        touch.nowN = node
        
        // ver.2.2スクロールに変更。
        touch.accelerationY = touch.nowY - touch.beforeY
        touch.beforeY = touch.nowY
        
        // 遊びを超えているか確認。
        if touch.dragDirec == .NONE {
            // 遊びを超えていないなら。
            if touch.nowX - touch.beginX > play { touch.dragDirec = .HORIZONTAL}
            else if touch.nowX - touch.beginX < -1 * play { touch.dragDirec = .HORIZONTAL}
            else if touch.nowY - touch.beginY > play { touch.dragDirec = .VERTICAL}
            else if touch.nowY - touch.beginY < -1 * play { touch.dragDirec = .VERTICAL}
            // 遊びを超えていたら。遊びを超えた時点がタッチ開始座標になる。
            if touch.dragDirec != .NONE {
                //print("TouchManager：遊び ",play," を超えてドラッグ開始")
                touch.beginX = touch.nowX
                touch.beginY = touch.nowY
            }
        }
        else {
            // 遊びを超えているなら。
            touch.moveX = touch.nowX - touch.beginX
            touch.moveY = touch.nowY - touch.beginY
            //print("TouchManager：ドラッグ量は x: ",touch.moveX ," y: " , touch.moveY)
        }
    }
    
    // タッチエンド
    func end( x : Int, y : Int , node : String) {
        //print("TouchManager：エンド：", x , y , node)
        touch.stat = .END
        touch.nowX = x
        touch.nowY = y
        touch.nowN = node
        touch.endX = x
        touch.endY = y
        touch.endN = node
        
        // 遊びを超えていたら。
        if touch.dragDirec != .NONE {
            // 遊びを超えているなら。
            touch.moveX = touch.nowX - touch.beginX
            touch.moveY = touch.nowY - touch.beginY
        }
        // もしスワイプでページ変更までの量なら
        if touch.dragDirec == .HORIZONTAL && touch.moveX >= eGameSize.WIDTH / 10 { touch.dragDirec = .RIGHT }
        if touch.dragDirec == .HORIZONTAL && touch.moveX <= eGameSize.WIDTH / 10 * ( -1 ) { touch.dragDirec = .LEFT }
        if touch.dragDirec == .VERTICAL && touch.moveY >= eGameSize.HEIGHT / 10 { touch.dragDirec = .UPPER }
        if touch.dragDirec == .VERTICAL && touch.moveY <= eGameSize.HEIGHT / 10  * ( -1 ) { touch.dragDirec = .UNDER }
        
    }
    
    // タッチステータスを返す
    func getTouch() -> sTouch {
        return touch
    }
    
    
}

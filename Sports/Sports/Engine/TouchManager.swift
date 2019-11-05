// タッチの値を管理する

import Foundation

class TouchManager {
    var sTouch : STouch!  // タッチ変数
    let play : Int = 80 // ドラッグ開始までの遊び　あそび
    
    init() { sTouch = STouch() }
    
    // タッチビギン
    func begin( x : Int, y : Int , node : String) {
        
        //print("TouchManager：ビギン：", x , y , node)
        sTouch.stat = .BEGIN
        sTouch.nowX = x
        sTouch.nowY = y
        sTouch.nowN = node
        sTouch.beginX = x
        sTouch.beginY = y
        sTouch.beginN = node
        sTouch.dragDirec = .NONE
        
        sTouch.beforeY = y   // ver.2.2スクロールに変更。
    }
    
    // タッチドラッグ
    func drag( x : Int, y : Int , node : String) {
        //print("TouchManager：ドラッグ：", x , y , node)
        // もしタッチ無効時にドラッグが始まっていたら、beginX,Yが0,0になっているので修正
        if sTouch.beginX == 0 && sTouch.beginY == 0 { sTouch.beginX = x; sTouch.beginY = y }
        
        sTouch.stat = .DRAG
        sTouch.nowX = x
        sTouch.nowY = y
        sTouch.nowN = node
        
        sTouch.accelerationY = sTouch.nowY - sTouch.beforeY
        sTouch.beforeY = sTouch.nowY
        
        // 遊びを超えているか確認。
        if sTouch.dragDirec == .NONE {
            // 遊びを超えていないなら。
            if sTouch.nowX - sTouch.beginX > play { sTouch.dragDirec = .HORIZONTAL}
            else if sTouch.nowX - sTouch.beginX < -1 * play { sTouch.dragDirec = .HORIZONTAL}
            else if sTouch.nowY - sTouch.beginY > play { sTouch.dragDirec = .VERTICAL}
            else if sTouch.nowY - sTouch.beginY < -1 * play { sTouch.dragDirec = .VERTICAL}
            // 遊びを超えていたら。遊びを超えた時点がタッチ開始座標になる。
            if sTouch.dragDirec != .NONE {
                //print("TouchManager：遊び ",play," を超えてドラッグ開始")
                sTouch.beginX = sTouch.nowX
                sTouch.beginY = sTouch.nowY
            }
        }
        else {
            // 遊びを超えているなら。
            sTouch.moveX = sTouch.nowX - sTouch.beginX
            sTouch.moveY = sTouch.nowY - sTouch.beginY
            //print("TouchManager：ドラッグ量は x: ",sTouch.moveX ," y: " , sTouch.moveY)
        }
    }
    
    // タッチエンド
    func end( x : Int, y : Int , node : String) {
        //print("TouchManager：エンド：", x , y , node)
        sTouch.stat = .END
        sTouch.nowX = x
        sTouch.nowY = y
        sTouch.nowN = node
        sTouch.endX = x
        sTouch.endY = y
        sTouch.endN = node
        
        // 遊びを超えていたら。
        if sTouch.dragDirec != .NONE {
            // 遊びを超えているなら。
            sTouch.moveX = sTouch.nowX - sTouch.beginX
            sTouch.moveY = sTouch.nowY - sTouch.beginY
        }
        // もしスワイプでページ変更までの量なら
        if sTouch.dragDirec == .HORIZONTAL && sTouch.moveX >= eGameSize.WIDTH / 10 { sTouch.dragDirec = .RIGHT }
        if sTouch.dragDirec == .HORIZONTAL && sTouch.moveX <= eGameSize.WIDTH / 10 * ( -1 ) { sTouch.dragDirec = .LEFT }
        if sTouch.dragDirec == .VERTICAL && sTouch.moveY >= eGameSize.HEIGHT / 10 { sTouch.dragDirec = .UPPER }
        if sTouch.dragDirec == .VERTICAL && sTouch.moveY <= eGameSize.HEIGHT / 10  * ( -1 ) { sTouch.dragDirec = .UNDER }
        
    }
    
    // タッチステータスを返す
    func getTouch() -> STouch {
        return sTouch
    }
    
    
}

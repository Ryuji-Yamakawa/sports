// ページ本体

import SpriteKit

class Page {
    
    var skScene : SKScene!
    var sXPosition : SXPosition!
    var sYPosition : SYPosition!
    var pageParts : [PageParts] = []
    var pagePosition : ePagePosition = .CENTER
    
    init (aSKScene : SKScene, aXPosition : SXPosition, aYPosition : SYPosition) {
        
        skScene = aSKScene
        sXPosition = aXPosition
        sYPosition = aYPosition
    }
    
    func swipe(aTouch : STouch ){
        if pageParts.count == 0 { return }
        // 上下左右にスワイプしているとき
        if aTouch.dragDirec != .NONE{
            // 追従する
            for i in 0 ... pageParts.count - 1 {
                pageParts[i].swipe(aTouch: aTouch)
            }
        }
    }
    
    func swipeCancel(aTouch : STouch) {
        if pageParts.count == 0 { return }
        for i in 0 ... pageParts.count - 1 {
            pageParts[i].swipeCancel(aTouch: aTouch)
        }
    }
    
    func pageChange(aDestination : ePagePosition, aXFlag : Bool, aInitFlag : Bool) {
        if pageParts.count == 0 { return }
        for i in 0 ... pageParts.count - 1 {
            pageParts[i].pageChange(aDestination: aDestination, aXFlag: aXFlag, aInitFlag: aInitFlag)
        }
    }
    
    func delete() {
        if pageParts.count == 0 { return }
        for i in 0 ... pageParts.count - 1 {
            pageParts[i].deleteAll()
        }
        // これがないとページが残っている。
        pageParts = []
    }
    
    func touchImgHidden(aTouch: STouch) {
        if pageParts.count == 0 { return }
        for i in 0 ... pageParts.count - 1 {
            pageParts[i].touchImgHidden(aTouch: aTouch)
        }
    }
    
    // ENDでタッチされているノードがあるか判断
    func checkTouchEnd( aTouch : STouch ) -> Bool {
        // ページの要素がないなら終了
        if pageParts.count == 0 { return false }
        // もしタッチ終了、または遊びが終了してスワイプしているなら、以降の処理はしない
        if aTouch.stat != .END || aTouch.dragDirec != .NONE { return false }
        
        // もしボタンクラスの中に、にタッチエンドのボタンがあったら true になる
        for i in 0 ... pageParts.count - 1 {
            if pageParts[i].getNodeExist(aName: aTouch.endN) == true {
                return true
            }
        }
        return false
    }
    
}

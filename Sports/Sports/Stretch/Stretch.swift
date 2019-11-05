// ストレッチゲーム

import SpriteKit

class Stretch {
    
    var stretchBg : StretchBg!
    var home : Home!
    var sStretchControl : SStretchControl = SStretchControl()
    
    init(aSKScene : SKScene, aXPosition : SXPosition, aYPosition : SYPosition) {
        stretchBg   = StretchBg(aSKScene: aSKScene, aXPosition : aXPosition, aYPosition : aYPosition)
        home        = Home(aSKScene: aSKScene, aXPosition : aXPosition, aYPosition : aYPosition)
    }
    
    func setTouch(aTouch : STouch, aGameControl : SGameControl) -> SGameControl {
        var sGameControl = aGameControl
        
        switch sStretchControl.pageNow {
        case .NONE      : print("Stretchエラー setTouch")
        case .HOME      : (sGameControl, sStretchControl) = home.setTouch(aTouch: aTouch, aGameControl: sGameControl, aStretchControl: sStretchControl)
        case .SOCCER    : print("Stretchエラー 作成中")
        case .BASKET    : print("Stretchエラー 作成中")
        case .TIMECOUNT : print("Stretchエラー 作成中")
        }
        
        // 以降　あそびを超えていた場合の処理
        if aTouch.dragDirec == .NONE { return sGameControl }
        
        for i in [sStretchControl.pageLeft, sStretchControl.pageNow, sStretchControl.pageRight] {
            switch i {
                case .NONE      : break
                case .HOME      : home.swipe(aTouch: aTouch)
                case .SOCCER    : print("Stretchエラー 作成中")
                case .BASKET    : print("Stretchエラー 作成中")
                case .TIMECOUNT : print("Stretchエラー 作成中")
            }
        }

        // 以降　タッチエンドの処理
        if aTouch.stat != .END { return sGameControl }

        // スワイプでページ変更
        if aTouch.dragDirec == .LEFT && sStretchControl.pageRight != .NONE {
            // 右に動いた
            sStretchControl.pageNext = sStretchControl.pageRight
            sStretchControl.pageRight = .NONE
            sStretchControl.pageLeft = sStretchControl.pageNow
            //return modeChange(touch : touch, getGamePara: gamePara)
        }
        else if aTouch.dragDirec == .RIGHT && sStretchControl.pageLeft != .NONE {
            // 左に動いているなら
            sStretchControl.pageNext = sStretchControl.pageLeft
            sStretchControl.pageRight = sStretchControl.pageNow
            sStretchControl.pageLeft = .NONE
            //return modeChange(touch : touch, getGamePara: gamePara)
        }
        // スワイプキャンセル
        for i in [sStretchControl.pageLeft, sStretchControl.pageNow, sStretchControl.pageRight] {
            switch i {
                case .NONE      : break
                case .HOME      : home.swipeCancel(aTouch: aTouch)
                case .SOCCER    : print("Stretchエラー 作成中")
                case .BASKET    : print("Stretchエラー 作成中")
                case .TIMECOUNT : print("Stretchエラー 作成中")
            }
        }
        sGameControl.touchLockTime = STime().basicLock
        
        
        return aGameControl
    }
    
    // スワイプで動くページかをチェック
    func checkSwipe(aStretchControl : SStretchControl, aPage : ePage) -> Bool {
        if aStretchControl.pageNow == aPage ||
            aStretchControl.pageLeft == aPage ||
            aStretchControl.pageRight == aPage {
            return true
        }
        else {
            return false
        }
    }
}

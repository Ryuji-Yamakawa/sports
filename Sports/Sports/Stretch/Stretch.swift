// ストレッチゲーム

import SpriteKit

class Stretch {
    
    var stretchBg : StretchBg!
    var home : Home!
    var soccer : Soccer!
    var basket : Basket!
    var sStretchControl : SStretchControl = SStretchControl()
    
    init(aSKScene : SKScene, aXPosition : SXPosition, aYPosition : SYPosition) {
        stretchBg   = StretchBg(aSKScene: aSKScene, aXPosition : aXPosition, aYPosition : aYPosition)
        home        = Home(aSKScene: aSKScene, aXPosition : aXPosition, aYPosition : aYPosition)
        soccer      = Soccer(aSKScene: aSKScene, aXPosition : aXPosition, aYPosition : aYPosition)
        basket      = Basket(aSKScene: aSKScene, aXPosition : aXPosition, aYPosition : aYPosition)
    }
    
    func setTouch(aTouch : STouch, aGameControl : SGameControl) -> SGameControl {
        var sGameControl = aGameControl
        
        // あそびの範囲内
        switch sStretchControl.pageNow {
        case .NONE      : print("Stretchエラー setTouch")
        case .HOME      : (sGameControl, sStretchControl) = home.setTouch(aTouch: aTouch, aGameControl: sGameControl, aStretchControl: sStretchControl)
        case .SOCCER    : (sGameControl, sStretchControl) = soccer.setTouch(aTouch: aTouch, aGameControl: sGameControl, aStretchControl: sStretchControl)
        case .BASKET    : (sGameControl, sStretchControl) = basket.setTouch(aTouch: aTouch, aGameControl: sGameControl, aStretchControl: sStretchControl)
        case .TIMECOUNT : print("Stretchエラー 作成中")
        }
        
        // あそびの外
        if aTouch.dragDirec != .NONE {
            // スワイプ追従アニメ
            for i in [sStretchControl.pageLeft, sStretchControl.pageNow, sStretchControl.pageRight] {
                switch i {
                    case .NONE      : break
                    case .HOME      : home.swipe(aTouch: aTouch)
                    case .SOCCER    : soccer.swipe(aTouch: aTouch)
                    case .BASKET    : basket.swipe(aTouch: aTouch)
                    case .TIMECOUNT : print("Stretchエラー 作成中")
                }
            }
            
            // スワイプのタッチエンド
            if aTouch.stat == .END {
                
                if aTouch.dragDirec == .LEFT && sStretchControl.pageRight != .NONE {
                    // 右に動いた
                    sStretchControl.pageNext = sStretchControl.pageRight
                    sStretchControl.pageRight = .NONE
                    sStretchControl.pageLeft = sStretchControl.pageNow
                }
                else if aTouch.dragDirec == .RIGHT && sStretchControl.pageLeft != .NONE {
                    // 左に動いた
                    sStretchControl.pageNext = sStretchControl.pageLeft
                    sStretchControl.pageRight = sStretchControl.pageNow
                    sStretchControl.pageLeft = .NONE
                }
                else if sStretchControl.pageNow == sStretchControl.pageNext {
                    // スワイプキャンセル
                    for i in [sStretchControl.pageLeft, sStretchControl.pageNow, sStretchControl.pageRight] {
                        switch i {
                            case .NONE      : break
                            case .HOME      : home.swipeCancel(aTouch: aTouch)
                            case .SOCCER    : soccer.swipeCancel(aTouch: aTouch)
                            case .BASKET    : basket.swipeCancel(aTouch: aTouch)
                            case .TIMECOUNT : print("Stretchエラー 作成中")
                        }
                    }
                    sGameControl.touchLockTime = STime().basicLock
                }
            }
        }
        
        if sStretchControl.pageNow != sStretchControl.pageNext {
            pageChange()
        }
        
        sStretchControl.pageNow = sStretchControl.pageNext
        
        return aGameControl
    }
    
    func pageChange() {
        if sStretchControl.pageNow == .HOME && sStretchControl.pageNext == .SOCCER {
            sStretchControl.pageLeft = .HOME
            sStretchControl.pageRight = .NONE
            
            home.pageChange(aDestination: .LEFT, aXFlag: true, aInitFlag: false)
            soccer.pageChange(aDestination: .CENTER, aXFlag: true, aInitFlag: false)
        }
        else if sStretchControl.pageNow == .SOCCER && sStretchControl.pageNext == .HOME {
            sStretchControl.pageLeft = .NONE
            sStretchControl.pageRight = .SOCCER
            
            home.pageChange(aDestination: .CENTER, aXFlag: true, aInitFlag: false)
            soccer.pageChange(aDestination: .RIGHT, aXFlag: true, aInitFlag: false)
        }
        else if sStretchControl.pageNow == .HOME && sStretchControl.pageNext == .BASKET {
            sStretchControl.pageLeft = .HOME
            sStretchControl.pageRight = .NONE
            
            home.pageChange(aDestination: .LEFT, aXFlag: true, aInitFlag: false)
            basket.pageChange(aDestination: .CENTER, aXFlag: true, aInitFlag: false)
        }
        else if sStretchControl.pageNow == .BASKET && sStretchControl.pageNext == .HOME {
            sStretchControl.pageLeft = .NONE
            sStretchControl.pageRight = .BASKET
            
            home.pageChange(aDestination: .CENTER, aXFlag: true, aInitFlag: false)
            basket.pageChange(aDestination: .RIGHT, aXFlag: true, aInitFlag: false)
        }
    }
}

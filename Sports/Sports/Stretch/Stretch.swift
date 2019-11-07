// ストレッチゲーム

import SpriteKit

class Stretch {
    
    var stretchBg : StretchBg!
    var home : Home!
    var soccer : Soccer!
    var basket : Basket!
    var timeCount : TimeCount!
    var sStretchControl : SStretchControl = SStretchControl()
    
    init(aSKScene : SKScene, aXPosition : SXPosition, aYPosition : SYPosition) {
        stretchBg   = StretchBg(aSKScene: aSKScene, aXPosition : aXPosition, aYPosition : aYPosition)
        home        = Home(aSKScene: aSKScene, aXPosition : aXPosition, aYPosition : aYPosition)
        soccer      = Soccer(aSKScene: aSKScene, aXPosition : aXPosition, aYPosition : aYPosition)
        basket      = Basket(aSKScene: aSKScene, aXPosition : aXPosition, aYPosition : aYPosition)
        timeCount   = TimeCount(aSKScene: aSKScene, aXPosition : aXPosition, aYPosition : aYPosition)
    }
    
    func setTouch(aTouch : STouch, aGameControl : SGameControl) -> SGameControl {
        var sGameControl = aGameControl
        
        // あそびの範囲内
        switch sStretchControl.pageNow {
        case .NONE      : print("Stretchエラー setTouch")
        case .HOME      : (sGameControl, sStretchControl) = home.setTouch(aTouch: aTouch, aGameControl: sGameControl, aStretchControl: sStretchControl)
        case .SOCCER    : (sGameControl, sStretchControl) = soccer.setTouch(aTouch: aTouch, aGameControl: sGameControl, aStretchControl: sStretchControl)
        case .BASKET    : (sGameControl, sStretchControl) = basket.setTouch(aTouch: aTouch, aGameControl: sGameControl, aStretchControl: sStretchControl)
        case .TIMECOUNT : (sGameControl, sStretchControl) = timeCount.setTouch(aTouch: aTouch, aGameControl: sGameControl, aStretchControl: sStretchControl)
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
                    case .TIMECOUNT : timeCount.swipe(aTouch: aTouch)
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
                            case .TIMECOUNT : timeCount.swipeCancel(aTouch: aTouch)
                        }
                    }
                    sGameControl.touchLockTime = STime().basicLock
                }
            }
        }
        
        // ストレッチの画像を変える
        if sStretchControl.buttonAction.contains("Stretch") == true {
            if timeCount.getNoeStretchMan() != sStretchControl.buttonAction {
                timeCount.setStretchMan(aName: sStretchControl.buttonAction)
            }
        }
        if sStretchControl.pageNow != sStretchControl.pageNext {
            pageChange()
        }
        
        // sStretchControlの一部をリセット
        sStretchControl.pageNow = sStretchControl.pageNext
        sStretchControl.buttonAction = ""
        
        if aTouch.stat == .END {
            print("Stretch確認",sStretchControl.pageLeft, sStretchControl.pageNow, sStretchControl.pageRight)
        }
        
        return aGameControl
    }
    
    func pageChange() {
        if sStretchControl.pageNow.xPosition() < sStretchControl.pageNext.xPosition() {
            // 右のページに移動
            sStretchControl.pageLeftOut  = sStretchControl.pageLeft
            sStretchControl.pageLeft     = sStretchControl.pageNow
            sStretchControl.pageRight    = sStretchControl.pageRightOut
            sStretchControl.pageRightOut = .NONE
            
            switch sStretchControl.pageNow {
            case .NONE      : print("Stretch pageChangeエラー <")
            case .HOME      : home.pageChange(aDestination: .LEFT, aXFlag: true, aInitFlag: false)
            case .SOCCER    : soccer.pageChange(aDestination: .LEFT, aXFlag: true, aInitFlag: false)
            case .BASKET    : basket.pageChange(aDestination: .LEFT, aXFlag: true, aInitFlag: false)
            case .TIMECOUNT : timeCount.pageChange(aDestination: .LEFT, aXFlag: true, aInitFlag: false)
            }
            
            switch sStretchControl.pageNext {
            case .NONE      : print("Stretch pageChangeエラー <")
            case .HOME      : home.pageChange(aDestination: .CENTER, aXFlag: true, aInitFlag: false)
            case .SOCCER    : soccer.pageChange(aDestination: .CENTER, aXFlag: true, aInitFlag: false)
            case .BASKET    : basket.pageChange(aDestination: .CENTER, aXFlag: true, aInitFlag: false)
            case .TIMECOUNT : timeCount.pageChange(aDestination: .CENTER, aXFlag: true, aInitFlag: false)
            }
        }
        else if sStretchControl.pageNow.xPosition() > sStretchControl.pageNext.xPosition() {
            // 左のページに移動
            sStretchControl.pageRightOut = sStretchControl.pageRight
            sStretchControl.pageRight    = sStretchControl.pageNow
            sStretchControl.pageLeft     = sStretchControl.pageLeftOut
            sStretchControl.pageLeftOut  = .NONE
            
            switch sStretchControl.pageNow {
            case .NONE      : print("Stretch pageChangeエラー >")
            case .HOME      : home.pageChange(aDestination: .RIGHT, aXFlag: true, aInitFlag: false)
            case .SOCCER    : soccer.pageChange(aDestination: .RIGHT, aXFlag: true, aInitFlag: false)
            case .BASKET    : basket.pageChange(aDestination: .RIGHT, aXFlag: true, aInitFlag: false)
            case .TIMECOUNT : timeCount.pageChange(aDestination: .RIGHT, aXFlag: true, aInitFlag: false)
            }
            
            switch sStretchControl.pageNext {
            case .NONE      : print("Stretch pageChangeエラー >")
            case .HOME      : home.pageChange(aDestination: .CENTER, aXFlag: true, aInitFlag: false)
            case .SOCCER    : soccer.pageChange(aDestination: .CENTER, aXFlag: true, aInitFlag: false)
            case .BASKET    : basket.pageChange(aDestination: .CENTER, aXFlag: true, aInitFlag: false)
            case .TIMECOUNT : timeCount.pageChange(aDestination: .CENTER, aXFlag: true, aInitFlag: false)
            }
        }
    }
}

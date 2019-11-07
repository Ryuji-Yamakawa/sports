// ストレッチの時間を計る画面

import SpriteKit

class TimeCount : Page {
    
    var timeCountButton : TimeCountButton!
    var timeCountBg : TimeCountBg!
    
    var nowStretchMan : String = ""
    
    override init (aSKScene : SKScene, aXPosition : SXPosition, aYPosition : SYPosition) {
        super.init(aSKScene: aSKScene, aXPosition: aXPosition, aYPosition: aYPosition)
        
        timeCountButton = TimeCountButton(aSKScene: skScene, aXPosition: sXPosition, aYPosition: sYPosition)
        timeCountBg     = TimeCountBg(aSKScene: skScene, aXPosition: sXPosition, aYPosition: sYPosition)
        
        pageParts.append(timeCountButton)
        pageParts.append(timeCountBg)
        
        pageChange(aDestination: .RIGHT, aXFlag: true, aInitFlag: true)
    }
    
    func setTouch(aTouch : STouch, aGameControl : SGameControl, aStretchControl : SStretchControl) -> (SGameControl , SStretchControl) {
        
        var rGameControl : SGameControl = aGameControl
        var rStretchControl : SStretchControl = aStretchControl
        
        // タッチされたときの画像を表示/非表示
        touchImgHidden(aTouch: aTouch)
        
        // ENDでタッチされているノードがあるなら
        if checkTouchEnd(aTouch: aTouch) == true {
            if aTouch.endN == TimeCountButton.mBack {
                rStretchControl.pageNext = rStretchControl.pageLeft
                rGameControl.touchLockTime = STime().basicLock
            }
        }
        
        return (rGameControl, rStretchControl)
    }
    func setStretchMan(aName : String) {
        print("TimeCount 画像変更")
        nowStretchMan = aName
        timeCountBg.setStretchMan(aName: nowStretchMan)
        
        pageChange(aDestination: .RIGHT, aXFlag: true, aInitFlag: true)
    }
    
    func getNoeStretchMan() -> String {
        return nowStretchMan
    }
}

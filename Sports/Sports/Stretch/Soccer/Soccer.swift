// サッカー選手のストレッチ選択画面

import SpriteKit

class Soccer : Page {
    
    var soccerButton : SoccerButton!
    
    override init (aSKScene : SKScene, aXPosition : SXPosition, aYPosition : SYPosition) {
        super.init(aSKScene: aSKScene, aXPosition: aXPosition, aYPosition: aYPosition)
        
        pageParts.append(SoccerButton(aSKScene: skScene, aXPosition: sXPosition, aYPosition: sYPosition))
        
        pageChange(aDestination: .RIGHT, aXFlag: true, aInitFlag: true)
    }
    
    func setTouch(aTouch : STouch, aGameControl : SGameControl, aStretchControl : SStretchControl) -> (SGameControl , SStretchControl) {
        
        var rGameControl : SGameControl = aGameControl
        var rStretchControl : SStretchControl = aStretchControl
        
        // タッチされたときの画像を表示/非表示
        touchImgHidden(aTouch: aTouch)
        
        // ENDでタッチされているノードがあるなら
        if checkTouchEnd(aTouch: aTouch) == true {
            if aTouch.endN == SoccerButton.mBack {
                rStretchControl.pageNext = .HOME
                rGameControl.touchLockTime = STime().basicLock
            }
            else if aTouch.endN == SoccerButton.mStretch1 || aTouch.endN == SoccerButton.mStretch2 {
                rStretchControl.pageNext = .TIMECOUNT
                rGameControl.touchLockTime = STime().basicLock
                
                rStretchControl.buttonAction = aTouch.endN
            }
        }
        
        
        
        return (rGameControl, rStretchControl)
    }
}

// バスケット選手のストレッチ選択画面

import SpriteKit

class Basket : Page {
    
    var basketButton : BasketButton!
    
    override init (aSKScene : SKScene, aXPosition : SXPosition, aYPosition : SYPosition) {
        super.init(aSKScene: aSKScene, aXPosition: aXPosition, aYPosition: aYPosition)
        
        pageParts.append(BasketButton(aSKScene: skScene, aXPosition: sXPosition, aYPosition: sYPosition))
        
        pageChange(aDestination: .RIGHT, aXFlag: true, aInitFlag: true)
    }
    
    func setTouch(aTouch : STouch, aGameControl : SGameControl, aStretchControl : SStretchControl) -> (SGameControl , SStretchControl) {
        
        var rGameControl : SGameControl = aGameControl
        var rStretchControl : SStretchControl = aStretchControl
        
        // タッチされたときの画像を表示/非表示
        touchImgHidden(aTouch: aTouch)
        
        // ENDでタッチされているノードがあるなら
        if checkTouchEnd(aTouch: aTouch) == true {
            if aTouch.endN == BasketButton.mBack {
                rStretchControl.pageNext = .HOME
                rGameControl.touchLockTime = STime().basicLock
            }
            else if aTouch.endN == BasketButton.mStretch3 || aTouch.endN == BasketButton.mStretch4 {
                rStretchControl.pageNext = .TIMECOUNT
                rGameControl.touchLockTime = STime().basicLock
                
                rStretchControl.buttonAction = aTouch.endN
            }
        }
        
        
        
        return (rGameControl, rStretchControl)
    }
}

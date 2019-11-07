// 競技選択画面

import SpriteKit

class Home : Page {
    
    var homeButton : HomeButton!
    
    override init (aSKScene : SKScene, aXPosition : SXPosition, aYPosition : SYPosition) {
        super.init(aSKScene: aSKScene, aXPosition: aXPosition, aYPosition: aYPosition)
        
        pageParts.append(HomeButton(aSKScene: skScene, aXPosition: sXPosition, aYPosition: sYPosition))
        
        pageChange(aDestination: .CENTER, aXFlag: true, aInitFlag: true)
    }
    
    func setTouch(aTouch : STouch, aGameControl : SGameControl, aStretchControl : SStretchControl) -> (SGameControl , SStretchControl) {
        
        var rGameControl : SGameControl = aGameControl
        var rStretchControl : SStretchControl = aStretchControl
        
        // タッチされたときの画像を表示/非表示
        touchImgHidden(aTouch: aTouch)
        
        // ENDでタッチされているノードがあるなら
        if checkTouchEnd(aTouch: aTouch) == true {
            if aTouch.endN == HomeButton.mSoccer {
                rStretchControl.pageNext = .SOCCER
                rGameControl.touchLockTime = STime().basicLock
                
                rStretchControl.buttonAction = aTouch.endN
            }
            else if aTouch.endN == HomeButton.mBasket {
                rStretchControl.pageNext = .BASKET
                rGameControl.touchLockTime = STime().basicLock
                
                rStretchControl.buttonAction = aTouch.endN
            }
        }
        
        return (rGameControl, rStretchControl)
    }
}

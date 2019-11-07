// 上部のメニュー

import SpriteKit

class Menu : Page {
    
    var menuButton : MenuButton!
    
    override init( aSKScene: SKScene, aXPosition : SXPosition, aYPosition : SYPosition ) {
        super.init(aSKScene: aSKScene, aXPosition: aXPosition, aYPosition: aYPosition)
        
        menuButton = MenuButton(aSKScene: aSKScene, aXPosition: aXPosition, aYPosition: aYPosition)
        
        pageParts.append(menuButton)
    }
    
    func menuChange(aStretchControl : SStretchControl) {
        menuButton.menuChange(aStretchControl: aStretchControl)
    }
    
    func setTouch(aTouch : STouch, aGameControl : SGameControl, aStretchControl : SStretchControl) -> (SGameControl , SStretchControl) {
        
        var rGameControl : SGameControl = aGameControl
        var rStretchControl : SStretchControl = aStretchControl
        
        // ENDでタッチされているノードがあるなら
        if checkTouchEnd(aTouch: aTouch) == true {
            if aTouch.endN == MenuButton.mHome {
                rStretchControl.pageNext = .HOME
                rGameControl.touchLockTime = STime().basicLock
            }
            else if aTouch.endN == MenuButton.mSoccer {
                rStretchControl.pageNext = .SOCCER
                rGameControl.touchLockTime = STime().basicLock
                
                rStretchControl.buttonAction = aTouch.endN
            }
            else if aTouch.endN == MenuButton.mBasket {
                rStretchControl.pageNext = .BASKET
                rGameControl.touchLockTime = STime().basicLock
                
                rStretchControl.buttonAction = aTouch.endN
            }
            else if aTouch.endN == MenuButton.mTimeCount {
                rStretchControl.pageNext = .TIMECOUNT
                rGameControl.touchLockTime = STime().basicLock
            }
        }
        
        return (rGameControl, rStretchControl)
    }
    
}

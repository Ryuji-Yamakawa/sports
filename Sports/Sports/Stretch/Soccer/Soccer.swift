// サッカー選手のストレッチ選択画面

import SpriteKit

class Soccer : Page {
    
    var soccerButton : SoccerButton!
    
    override init (aSKScene : SKScene, aXPosition : SXPosition, aYPosition : SYPosition) {
        super.init(aSKScene: aSKScene, aXPosition: aXPosition, aYPosition: aYPosition)
        
        pageParts.append(SoccerButton(aSKScene: skScene, aXPosition: sXPosition, aYPosition: sYPosition))
        
        pagePosition = .RIGHT
        pageChange(aDestination: pagePosition, aXFlag: true, aInitFlag: true)
    }
    
    func setTouch(aTouch : STouch, aGameControl : SGameControl, aStretchControl : SStretchControl) -> (SGameControl , SStretchControl) {
        
        var rGameControl : SGameControl = aGameControl
        var rStretchControl : SStretchControl = aStretchControl
        
        // タッチされたときの画像を表示/非表示
        touchImgHidden(aTouch: aTouch)
        
        // ENDでタッチされているノードがあるなら
        if checkTouchEnd(aTouch: aTouch) == true {
            if aTouch.endN == "Soccer" {
                rStretchControl.pageNext = .HOME
                rGameControl.touchLockTime = STime().basicLock
            }
        }
        
        
        
        return (rGameControl, rStretchControl)
    }
}

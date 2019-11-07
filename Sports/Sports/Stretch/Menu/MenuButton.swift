// Menuのボタン

import SpriteKit

class MenuButton : BasicButtonParts {
    
    static let mHome        : String = "MenuHome"
    static let mSoccer      : String = "MenuSoccer"
    static let mBasket      : String = "MenuBasket"
    static let mTimeCount   : String = "MenuTimeCount"
    
    override init(aSKScene : SKScene, aXPosition : SXPosition, aYPosition : SYPosition) {
        super.init(aSKScene: aSKScene, aXPosition: aXPosition, aYPosition: aYPosition)
        
        var sBasicButton = SBasicButton()
        
        sBasicButton.name = MenuButton.mHome
        sBasicButton.text = eText.HOME.string()
        sBasicButton.baseImg = "360x136"
        sBasicButton.touchImg = "360x136"
        sBasicButton.color = eFont.MENU.color()
        sBasicButton.size = eFont.MENU.size()
        sBasicButton.xyPosition = CGPoint(x: aXPosition.parts[1][1], y: aYPosition.menuHeight)
        sBasicButton.zPosition = eZPosition.MENU_BUTTON
        make(aBasicButton: sBasicButton)

        sBasicButton.name = MenuButton.mSoccer
        sBasicButton.text = eText.SOCCER.string()
        sBasicButton.xyPosition = CGPoint(x: aXPosition.menuRightOut, y: aYPosition.menuHeight)
        make(aBasicButton: sBasicButton)

        sBasicButton.name = MenuButton.mBasket
        sBasicButton.text = eText.BASKET.string()
        sBasicButton.xyPosition = CGPoint(x: aXPosition.menuRightOut, y: aYPosition.menuHeight)
        make(aBasicButton: sBasicButton)

        sBasicButton.name = MenuButton.mTimeCount
        sBasicButton.text = eText.TIMECOUNT.string()
        sBasicButton.xyPosition = CGPoint(x: aXPosition.menuRightOut, y: aYPosition.menuHeight)
        make(aBasicButton: sBasicButton)
    }
    
    func menuChange(aStretchControl : SStretchControl) {
        
        let position : [(page : ePage, menuPosition : eMenuPosition)] = [
        (aStretchControl.pageLeftOut,   eMenuPosition.LEFTOUT),
        (aStretchControl.pageLeft,      eMenuPosition.LEFT),
        (aStretchControl.pageNow,       eMenuPosition.CENTER),
        (aStretchControl.pageRight,     eMenuPosition.RIGHT),
        (aStretchControl.pageRightOut,  eMenuPosition.RIGHTOUT)
        ]
        
        var soccerHidden : Bool = true
        var basketHidden : Bool = true
        var timecountHidden : Bool = true
        
        for i in position {
            switch i.page {
            case .NONE      : break
            case .HOME      : moveAnim(a: nameToNo(aName: MenuButton.mHome),        aMenuPosition: i.menuPosition)
            case .SOCCER    : moveAnim(a: nameToNo(aName: MenuButton.mSoccer),      aMenuPosition: i.menuPosition); soccerHidden = false
            case .BASKET    : moveAnim(a: nameToNo(aName: MenuButton.mBasket),      aMenuPosition: i.menuPosition); basketHidden = false
            case .TIMECOUNT : moveAnim(a: nameToNo(aName: MenuButton.mTimeCount),   aMenuPosition: i.menuPosition); timecountHidden = false
            }
        }
        
        hiddenAnim(a: nameToNo(aName: MenuButton.mSoccer),     aHidden: soccerHidden)
        hiddenAnim(a: nameToNo(aName: MenuButton.mBasket),     aHidden: basketHidden)
        hiddenAnim(a: nameToNo(aName: MenuButton.mTimeCount),  aHidden: timecountHidden)
        
    }
    
    func moveAnim(a : Int, aMenuPosition : eMenuPosition) {
        
        for k in 0 ... sNodes[a].nodes.count - 1 {
            
            var action = Array<SKAction>()
            var goal : CGFloat = 0.0
            var distance : Double = 0.0
            
            
            goal = aMenuPosition.position(aXposition: sXPosition)
            distance = Double(sNodes[a].nowPosition[k].x - goal)
            sNodes[a].nowPosition[k].x = goal

            // 滑らかにする
            for k in 0 ... STime().cell - 1 {
                action.append(SKAction.moveTo(x: goal + CGFloat(distance / pow(2, Double(k + 1) ) ),
                                              duration: (TimeInterval(STime().frame * (CGFloat(STime().cell) - CGFloat(k) ) ) ) ) )
            }
            action.append(SKAction.moveTo(x: goal, duration: 0.0))
            
            sNodes[a].nodes[k].run(SKAction.sequence(action))
        }
    }
    
    func hiddenAnim(a : Int, aHidden : Bool) {
        for k in 0 ... sNodes[a].nodes.count - 1 {
            if aHidden == false {
                sNodes[a].nodes[k].run(SKAction.fadeAlpha(to: 1.0, duration: STime().basicLock))
            }
            else {
                sNodes[a].nodes[k].run(SKAction.fadeAlpha(to: 0.0, duration: STime().basicLock))
            }
        }
    }
    
    
}

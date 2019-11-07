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
        
        switch aStretchControl.pageLeftOut {
        case .NONE      : break
        case .HOME      : anim(a: nameToNo(aName: MenuButton.mHome), aMenuPosition: .LEFTOUT)
        case .SOCCER    : anim(a: nameToNo(aName: MenuButton.mSoccer), aMenuPosition: .LEFTOUT)
        case .BASKET    : anim(a: nameToNo(aName: MenuButton.mBasket), aMenuPosition: .LEFTOUT)
        case .TIMECOUNT : anim(a: nameToNo(aName: MenuButton.mTimeCount), aMenuPosition: .LEFTOUT)
        }
        
        switch aStretchControl.pageLeft {
        case .NONE      : break
        case .HOME      : anim(a: nameToNo(aName: MenuButton.mHome), aMenuPosition: .LEFT)
        case .SOCCER    : anim(a: nameToNo(aName: MenuButton.mSoccer), aMenuPosition: .LEFT)
        case .BASKET    : anim(a: nameToNo(aName: MenuButton.mBasket), aMenuPosition: .LEFT)
        case .TIMECOUNT : anim(a: nameToNo(aName: MenuButton.mTimeCount), aMenuPosition: .LEFT)
        }
        
        switch aStretchControl.pageNow {
        case .NONE      : break
        case .HOME      : anim(a: nameToNo(aName: MenuButton.mHome), aMenuPosition: .CENTER)
        case .SOCCER    : anim(a: nameToNo(aName: MenuButton.mSoccer), aMenuPosition: .CENTER)
        case .BASKET    : anim(a: nameToNo(aName: MenuButton.mBasket), aMenuPosition: .CENTER)
        case .TIMECOUNT : anim(a: nameToNo(aName: MenuButton.mTimeCount), aMenuPosition: .CENTER)
        }
        
        switch aStretchControl.pageRight {
        case .NONE      : break
        case .HOME      : anim(a: nameToNo(aName: MenuButton.mHome), aMenuPosition: .RIGHT)
        case .SOCCER    : anim(a: nameToNo(aName: MenuButton.mSoccer), aMenuPosition: .RIGHT)
        case .BASKET    : anim(a: nameToNo(aName: MenuButton.mBasket), aMenuPosition: .RIGHT)
        case .TIMECOUNT : anim(a: nameToNo(aName: MenuButton.mTimeCount), aMenuPosition: .RIGHT)
        }
        
        switch aStretchControl.pageRightOut {
        case .NONE      : break
        case .HOME      : anim(a: nameToNo(aName: MenuButton.mHome), aMenuPosition: .RIGHTOUT)
        case .SOCCER    : anim(a: nameToNo(aName: MenuButton.mSoccer), aMenuPosition: .RIGHTOUT)
        case .BASKET    : anim(a: nameToNo(aName: MenuButton.mBasket), aMenuPosition: .RIGHTOUT)
        case .TIMECOUNT : anim(a: nameToNo(aName: MenuButton.mTimeCount), aMenuPosition: .RIGHTOUT)
        }
    }
    
    func anim(a : Int, aMenuPosition : eMenuPosition) {
        for k in 0 ... sNodes[a].nodes.count - 1 {
            
            var action = Array<SKAction>()
            var goal : CGFloat = 0.0
            var distance : Double = 0.0
            
            
            goal = aMenuPosition.position(aXposition: sXPosition)
            distance = Double(sNodes[a].nowPosition[k].x - goal) / 1.5
            sNodes[a].nowPosition[k].x = goal

            // 滑らかになる
            for k in 0 ... STime().cell - 1 {
                action.append(SKAction.moveTo(x: goal + CGFloat(distance / pow(2, Double(k + 1) ) ),
                                              duration: (TimeInterval(STime().frame * (CGFloat(STime().cell) - CGFloat(k) ) ) ) ) )
            }
            action.append(SKAction.moveTo(x: goal, duration: 0.0))
            
            sNodes[a].nodes[k].run(SKAction.sequence(action))
        }
    }
    
    
}

// ホームゲームをコントロールする構造体

import SpriteKit

struct SStretchControl {
    var pageLeftOut : ePage = .NONE
    var pageLeft    : ePage = .NONE
    var pageNow     : ePage = .HOME // 初期値
    var pageRight   : ePage = .NONE
    var pageRightOut: ePage = .NONE
    var pageNext    : ePage = .HOME // 初期値
    var buttonAction: String = ""
}

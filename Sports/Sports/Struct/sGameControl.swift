// ゲームをコントロールする構造体

import SpriteKit

struct SGameControl {
    var nowPlay : eGame = .STRETCH
    var nextGame : eGame = .STRETCH
    var touchLockTime : TimeInterval = 0.0
}

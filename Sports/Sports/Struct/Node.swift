// Node1つの構造体

import SpriteKit

struct SNode {
    var name            : String = ""
    var nodes           : [SKNode]   = []
    var touchImgExist   : Bool = false          // タッチ時の画像があるか
    var initPosition    : [CGPoint] = []        // 本来の位置
    var nowPosition     : [CGPoint] = []        // スワイプで追従しているときなどの位置
}

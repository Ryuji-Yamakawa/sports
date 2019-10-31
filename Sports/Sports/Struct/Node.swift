// Node1つの構造体

import SpriteKit

struct SNode {
    var name            : String = ""
    var nodes           : [SKNode]   = []
    var initPosition    : [CGPoint] = []        // ノードの本来の位置
    var nowPosition     : [CGPoint] = []        // スワイプで追従しているときなどの位置
}

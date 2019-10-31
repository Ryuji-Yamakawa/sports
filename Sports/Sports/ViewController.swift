//

import UIKit
import SpriteKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // デバッグ設定のためskViewを取り出す
        let skView = self.view as! SKView
        
        // デバッグ：FPSを表示するときはtrue
        skView.showsFPS = false
        
        // デバッグ：ノードの数を表示するときはtrue
        skView.showsNodeCount = false
        
        // X座標
        let sXPosition : SXPosition = SXPosition()
        let sYPosition : SYPosition = MakeY().get()
        
        // デバッグ：機種と縦横のサイズを表示
        print("VC ",sXPosition.gameWidth, sYPosition.gameHeight)
        
        // ゲームを定義
        let gameManager = GameManager(size:CGSize(width: sXPosition.gameWidth, height: sYPosition.gameHeight))
        
        // SKSceneScaleMode.aspectFit   縦横比を保つ。隙間ができることがある。
        // SKSceneScaleMode.aspectFil   小さい値に合わせて隙間を無くす。表示されない部分ができる。
        gameManager.scaleMode = SKSceneScaleMode.aspectFit
        
        // スリープしない
        UIApplication.shared.isIdleTimerDisabled = true
        
        // GameManagerを表示する
        skView.presentScene(gameManager)
        
        // ポジションをセットする
        gameManager.setPosition(aXPosition: sXPosition, aYPosition: sYPosition)
        
        // ゲームを始める
        gameManager.startGame(aGame: .STRETCH)
    }
    //ステータスバーを非表示にする
    override var prefersStatusBarHidden : Bool {
        return true
    }
}


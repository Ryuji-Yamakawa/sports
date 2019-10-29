//
//  GameManager.swift
//  Sports
//
//  Created by Ryuji Yamakawa on 2019/10/29.
//  Copyright © 2019 Project'97. All rights reserved.
//
//  ゲームの切り替えを行う
//

import Foundation
import SpriteKit

class GameManager : SKScene {
    
    var xPosition : sXPosition!
    var yPosition : sYPosition!
    
    // GameManagerを表示する
    override func didMove(to view: SKView) {
        // Gameの背景色を白にする
        self.backgroundColor = UIColor.white
    }
    
    // ポジションをセットする
    func setPosition(aXPosition : sXPosition, aYPosition : sYPosition) {
        
        xPosition = aXPosition
        yPosition = aYPosition
        
        // 広告の部分を塗りつぶす
        let square = SKSpriteNode(color: UIColor.gray,
                                  size: CGSize(width: xPosition.gameWidth,
                                               height: yPosition.upperAdSpace))
        // 四角の位置を指定。x、y それぞれフレームの真ん中を指定しています。
        square.position = CGPoint(x:0, y:yPosition.gameHeight - yPosition.upperAdSpace)
        square.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        self.addChild(square)
    }
    
    // ゲームを始める
    func startGame(aGame : eGame) {
        print("GameManager startGame", aGame, xPosition.gameWidth, yPosition.gameHeight)
    }
}

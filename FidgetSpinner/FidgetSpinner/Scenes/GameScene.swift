//
//  GameScene.swift
//  FidgetSpinner
//
//  Created by Sherif Yasser on 02.03.21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var playerNodes:Int = 0
    var touchLocation = CGPoint()
    
    override func didMove(to view: SKView) {
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            touchLocation = touch.location(in: self)
        }
        self.playerNodes += 1
        let playerNode = PlayerNode().CreatePlayerNode(scene: self,name: Configurations().playerNodeName + String(self.playerNodes),atPoint: self.touchLocation)
        addChild(playerNode)
    }
}



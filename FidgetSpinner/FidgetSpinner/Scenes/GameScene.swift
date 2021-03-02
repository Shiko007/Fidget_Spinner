//
//  GameScene.swift
//  FidgetSpinner
//
//  Created by Sherif Yasser on 02.03.21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    override func didMove(to view: SKView) {
        let square = SKSpriteNode(color: .red, size: CGSize(width: self.frame.width/2, height: self.frame.height/2))
        square.physicsBody = SKPhysicsBody(rectangleOf: square.size)
        square.physicsBody?.isDynamic = false
        square.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        self.addChild(square)
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        print(touch?.location(in: self) as Any)
    }
}

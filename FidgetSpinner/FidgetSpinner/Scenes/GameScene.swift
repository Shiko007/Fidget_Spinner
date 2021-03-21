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
        self.name = "GameScene"
        Settings().addSettingsIcon(scene: self)
        updateWorld(scene: self)
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        PlayerNode().createPlayerNodeWithinBoundries(scene: self, name: Configurations().playerNodeName,touches: touches)
    }
    
    func updateWorld(scene: SKScene){
        setupBackground(scene: scene)
    }
    
    func setupBackground(scene: SKScene){
        let backgroundNode = SKShapeNode(rect: CGRect(x: scene.frame.minX, y: scene.frame.minY, width: scene.size.width, height: scene.size.height))
        backgroundNode.strokeColor = .clear
        backgroundNode.fillColor = .red
        backgroundNode.name = Configurations().backgroundImagePrefix
        backgroundNode.zPosition = Configurations().backgroundPosition
        scene.addChild(backgroundNode)
    }
}



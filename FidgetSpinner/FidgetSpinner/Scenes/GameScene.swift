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
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        PlayerNode().createPlayerNodeWithinBoundries(scene: self, name: Configurations().playerNodeName,touches: touches)
    }
}



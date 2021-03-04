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
    let playerNodeTexture = SKTexture(imageNamed: Configurations().playerNodeImageName)
    
    override func didMove(to view: SKView) {
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let nodeRadius = Configurations().playerNodeSizeWidthFactor * self.frame.width / 2
        let leftBoundry =  self.frame.minX + (nodeRadius)
        let rightBoundry = self.frame.maxX - (nodeRadius)
        let upBoundery = self.frame.maxY - (nodeRadius)
        let downBoundry = self.frame.minY + (nodeRadius)
        playerNodeTexture.preload {
            if let touch = touches.first {
                self.touchLocation = touch.location(in: self)
            }
            if((self.touchLocation.x > leftBoundry) && (self.touchLocation.x < rightBoundry) && (self.touchLocation.y > downBoundry) && (self.touchLocation.y < upBoundery)){
                self.playerNodes += 1
                let playerNode = PlayerNode().CreatePlayerNode(scene: self,name: Configurations().playerNodeName + String(self.playerNodes),texture:  self.playerNodeTexture, atPoint: self.touchLocation)
                self.addChild(playerNode)
            }
        }
    }
}



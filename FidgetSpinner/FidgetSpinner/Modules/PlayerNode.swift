//
//  PlayerNode.swift
//  FidgetSpinner
//
//  Created by Sherif Yasser on 03.03.21.
//

import SpriteKit

class PlayerNode{
    
    func createPlayerNodeWithinBoundries(scene: SKScene,name: String, touches: Set<UITouch>){
        let nodeRadius = Configurations().playerNodeSizeWidthFactor * scene.frame.width / 2
        var touchLocation = CGPoint()
        let leftBoundry =  scene.frame.minX + (nodeRadius)
        let rightBoundry = scene.frame.maxX - (nodeRadius)
        let upBoundery = scene.frame.maxY - (nodeRadius)
        let downBoundry = scene.frame.minY + (nodeRadius)
        let playerNodeTexture = SKTexture(imageNamed: Configurations().playerNodeImageName)
        
        playerNodeTexture.preload {
            if let touch = touches.first {
                touchLocation = touch.location(in: scene)
            }
            if((touchLocation.x > leftBoundry) && (touchLocation.x < rightBoundry) && (touchLocation.y > downBoundry) && (touchLocation.y < upBoundery)){
                let playerNode = PlayerNode().CreatePlayerNode(scene: scene,name: Configurations().playerNodeName,texture:  playerNodeTexture, atPoint: touchLocation)
                scene.addChild(playerNode)
            }
        }
    }
    
    func CreatePlayerNode(scene: SKScene,name: String ,texture: SKTexture, atPoint: CGPoint)-> TouchableSpriteNode{
        let nodeWidth = scene.frame.width * Configurations().playerNodeSizeWidthFactor
        let nodeHeight = scene.frame.width * Configurations().playerNodeSizeWidthFactor
        let playerNode = TouchableSpriteNode(imageNamed: Configurations().playerNodeImageName)
        playerNode.size = CGSize(width: nodeWidth, height: nodeHeight)
        playerNode.name = name
        playerNode.isUserInteractionEnabled = true
        playerNode.physicsBody = SKPhysicsBody(texture: texture, size: playerNode.size)
        
        playerNode.physicsBody?.affectedByGravity = false
        playerNode.position = atPoint
        
        return playerNode
    }
    
    func PlayerNodeTouched(playerNode: TouchableSpriteNode){
        playerNode.physicsBody?.applyAngularImpulse(Configurations().playerNodeImpulseRate)
    }
    
    
}

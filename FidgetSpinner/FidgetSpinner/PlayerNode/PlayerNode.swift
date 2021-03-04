//
//  PlayerNode.swift
//  FidgetSpinner
//
//  Created by Sherif Yasser on 03.03.21.
//

import SpriteKit

class TouchableSpriteNode : SKSpriteNode
{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        PlayerNode().PlayerNodeTouched(playerNode: self)
    }
}

class PlayerNode{
    var playerNodes:Int = 0
    
    
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

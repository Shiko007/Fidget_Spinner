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
    
    func CreatePlayerNode(scene: SKScene,name: String ,atPoint: CGPoint)-> TouchableSpriteNode{
        let nodeWidth = scene.frame.width * Configurations().playerNodeSizeWidthFactor
        let nodeHeight = scene.frame.width * Configurations().playerNodeSizeWidthFactor
        let playerNode = TouchableSpriteNode(imageNamed: Configurations().playerNodeImageName)
        playerNode.texture = SKTexture(imageNamed: Configurations().playerNodeImageName)
        playerNode.size = CGSize(width: nodeWidth, height: nodeHeight)
        playerNode.name = name
        playerNode.isUserInteractionEnabled = true
        if(playerNode.texture != nil){
            playerNode.physicsBody = SKPhysicsBody(texture: playerNode.texture!, size: playerNode.size)
        }
        else{
            playerNode.physicsBody = SKPhysicsBody(circleOfRadius: nodeWidth/2)
        }
        
        playerNode.physicsBody?.affectedByGravity = false
        playerNode.position = atPoint
        
        return playerNode
    }
    
    func PlayerNodeTouched(playerNode: TouchableSpriteNode){
        if(playerNode.color == .blue){
            playerNode.color = .red
        }
        else{
            playerNode.color = .blue
        }
    }
    
    
}

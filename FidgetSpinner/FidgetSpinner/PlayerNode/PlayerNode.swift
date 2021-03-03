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
        let square = TouchableSpriteNode(color: .red, size: CGSize(width: nodeWidth, height: nodeHeight))
        
        square.name = name
        square.isUserInteractionEnabled = true
        square.physicsBody = SKPhysicsBody(rectangleOf: square.size)
        square.physicsBody?.isDynamic = false
        square.position = atPoint
        
        return square
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

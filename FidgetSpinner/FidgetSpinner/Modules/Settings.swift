//
//  Settings.swift
//  FidgetSpinner
//
//  Created by Sherif Yasser on 06.03.21.
//

import SpriteKit

class Settings{
    func addSettingsIcon(scene: SKScene,position: CGPoint){
        let settingsNode = TouchableSpriteNode(imageNamed: Configurations().settingsNodeImageName)
        settingsNode.position = position
        settingsNode.isUserInteractionEnabled = true
        settingsNode.size = CGSize(width: scene.frame.width * Configurations().settingsNodeSizeFactor, height: scene.frame.width * Configurations().settingsNodeSizeFactor)
        settingsNode.name = Configurations().settingsNodeName
        settingsNode.position = CGPoint(x: scene.frame.maxX - (scene.frame.maxX * Configurations().settingsNodePositionXFactor), y: scene.frame.maxY - (scene.frame.maxY * Configurations().settingsNodePositionYFactor))
        scene.addChild(settingsNode)
    }
    
    func SettingsNodeTouched(settingsNode: TouchableSpriteNode){
        settingsNode.run(SKAction.rotate(byAngle: Configurations().settingsNodeRotateAngle, duration: Configurations().settingsNodeRotateTime)){
            print("Animation Done")
        }
    }
}

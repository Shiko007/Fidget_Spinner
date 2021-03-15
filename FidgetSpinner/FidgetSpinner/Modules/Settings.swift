//
//  Settings.swift
//  FidgetSpinner
//
//  Created by Sherif Yasser on 06.03.21.
//

import SpriteKit

class Settings{
    
    func addSettingsIcon(scene: SKScene){
        let settingsNode = TouchableSpriteNode(imageNamed: Configurations().settingsNodeImageName)
        settingsNode.isUserInteractionEnabled = true
        settingsNode.size = CGSize(width: scene.frame.width * Configurations().settingsNodeSizeFactor, height: scene.frame.width * Configurations().settingsNodeSizeFactor)
        settingsNode.name = Configurations().settingsNodeName
        settingsNode.position = CGPoint(x: scene.frame.maxX - (scene.frame.maxX * Configurations().settingsNodePositionXFactor), y: scene.frame.maxY - (scene.frame.maxY * Configurations().settingsNodePositionYFactor))
        scene.addChild(settingsNode)
    }
    
    func SettingsNodeTouched(settingsNode: TouchableSpriteNode){
        settingsNode.run(SKAction.rotate(byAngle: Configurations().settingsNodeRotateAngle, duration: Configurations().settingsNodeRotateTime)){
            self.loadSettingsWindow(insideScene: settingsNode.scene!)
            settingsNode.removeFromParent()
        }
    }
    
    func loadSettingsWindow(insideScene: SKScene){
        let windowWidth = insideScene.size.width * Configurations().settingsWindowWidthFactor
        let windowHeight = insideScene.size.height * Configurations().settingsWindowHeightFactor
        let settingsWindow = TouchableSpriteNode(imageNamed: Configurations().settingsWindowImageName)
        settingsWindow.size = CGSize(width: windowWidth, height: windowHeight)
        settingsWindow.position = CGPoint(x: insideScene.frame.midX, y: insideScene.frame.midY)
        settingsWindow.zPosition = Configurations().settingsWindowzPosition
        insideScene.addChild(settingsWindow)
        
        loadSettingsExitButton(insideNode: settingsWindow)
    }
    
    func loadSettingsExitButton(insideNode: TouchableSpriteNode){
        let exitNode = TouchableSpriteNode(imageNamed: Configurations().settingsExitNodeImageName)
        exitNode.isUserInteractionEnabled = true
        exitNode.size = CGSize(width: insideNode.size.width * Configurations().settingsNodeSizeFactor, height: insideNode.size.width * Configurations().settingsNodeSizeFactor)
        exitNode.name = Configurations().settingsExitNodeName
        exitNode.position = CGPoint(x: insideNode.frame.maxX - (insideNode.frame.maxX * Configurations().exitNodePositionXFactor), y: insideNode.frame.maxY - (insideNode.frame.maxY * Configurations().exitNodePositionYFactor))
        exitNode.zPosition = Configurations().settingsWindowExitButtonzPosition
        insideNode.addChild(exitNode)
    }
}

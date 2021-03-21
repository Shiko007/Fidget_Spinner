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
        settingsNode.zPosition = Configurations().settingsWindowzPosition
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
        settingsWindow.isUserInteractionEnabled = true
        settingsWindow.size = CGSize(width: windowWidth, height: windowHeight)
        settingsWindow.name = Configurations().settingsWindowName
        settingsWindow.position = CGPoint(x: insideScene.frame.midX, y: insideScene.frame.midY)
        settingsWindow.zPosition = Configurations().settingsWindowzPosition
        insideScene.addChild(settingsWindow)
        loadSettingsExitButton(insideNode: settingsWindow)
        loadSettingsBasicElements(insideNode: settingsWindow)
    }
    
    func loadSettingsBasicElements(insideNode: TouchableSpriteNode){
        loadSettingsBackgroundShapes(insideNode: insideNode)
        loadSettingsBackgroundColors(insideNode: insideNode)
    }
    
    func loadSettingsExitButton(insideNode: TouchableSpriteNode){
        let exitNode = TouchableSpriteNode(imageNamed: Configurations().settingsExitNodeImageName)
        exitNode.isUserInteractionEnabled = true
        exitNode.size = CGSize(width: insideNode.size.width * Configurations().settingsNodeSizeFactor, height: insideNode.size.width * Configurations().settingsNodeSizeFactor)
        exitNode.name = Configurations().settingsExitNodeName
        exitNode.position = CGPoint(x: insideNode.frame.maxX - (insideNode.frame.maxX * Configurations().exitNodePositionXFactor), y: insideNode.frame.maxY - (insideNode.frame.maxY * Configurations().exitNodePositionYFactor))
        exitNode.zPosition = Configurations().settingsWindowElementszPosition
        insideNode.addChild(exitNode)
    }
    
    func loadSettingsBackgroundShapes(insideNode: TouchableSpriteNode){
        let backgroundShapes = TouchableSpriteNode(color: .clear, size: CGSize(width: (insideNode.parent?.frame.width)!, height: ((insideNode.size.height) / 5)))
        let backgroundShapesText = SKLabelNode(text: "Background Shapes")
        backgroundShapesText.fontName = Configurations().settingsFontName
        backgroundShapesText.color = .white
        
        backgroundShapes.addChild(backgroundShapesText)
        backgroundShapes.isUserInteractionEnabled = true
        backgroundShapes.name = Configurations().settingsBackgroundShapesName
        backgroundShapes.position = CGPoint(x: insideNode.frame.minX , y: insideNode.frame.minY + (backgroundShapes.size.height/2))
        backgroundShapes.zPosition = Configurations().settingsWindowElementszPosition
        
        insideNode.addChild(backgroundShapes)
    }
    
    func loadSettingsBackgroundColors(insideNode: TouchableSpriteNode){
        let backgroundColors = TouchableSpriteNode(color: .clear, size: CGSize(width: (insideNode.parent?.frame.width)!, height: ((insideNode.size.height) / 5)))
        let backgroundColorsText = SKLabelNode(text: "Background Colors")
        backgroundColorsText.fontName = Configurations().settingsFontName
        backgroundColorsText.color = .white
        
        backgroundColors.addChild(backgroundColorsText)
        backgroundColors.isUserInteractionEnabled = true
        backgroundColors.name = Configurations().settingsBackgroundColorsName
        backgroundColors.position = CGPoint(x: insideNode.frame.minX , y: insideNode.frame.minY)
        backgroundColors.zPosition = Configurations().settingsWindowElementszPosition
        
        insideNode.addChild(backgroundColors)
    }
    
    func backgroundShapesTouched(backgroundShapesNode: TouchableSpriteNode){
        let settingsWindow = backgroundShapesNode.parent!
        resetSettingsWindow(settingsWindow: settingsWindow as! TouchableSpriteNode)
        loadSettingsBackgroundShapesWindow(insideWindow:settingsWindow as! TouchableSpriteNode)
    }
    func backgroundColorsTouched(backgroundColorsNode: TouchableSpriteNode){
        let settingsWindow = backgroundColorsNode.parent!
        resetSettingsWindow(settingsWindow: settingsWindow as! TouchableSpriteNode)
        loadSettingsBackgroundColorsWindow(insideWindow:settingsWindow as! TouchableSpriteNode)
    }
    
    func loadSettingsBackgroundShapesWindow(insideWindow: TouchableSpriteNode){
        for background in 0...Configurations().numberOfBackgroundShapes-1{
            let shapeImageName = Configurations().backgroundImagePrefix + String(background) + Configurations().backgroundImageSampleSuffix
            let backgroundShape = TouchableSpriteNode(imageNamed: shapeImageName)
            backgroundShape.isUserInteractionEnabled = true
            backgroundShape.size = CGSize(width: insideWindow.frame.width * Configurations().backgroundShapesSettingsMenuWidthFactor, height: ((insideWindow.size.height) * Configurations().backgroundShapesSettingsMenuHeigthFactor))
            backgroundShape.name = shapeImageName
            backgroundShape.position = CGPoint(x: 0, y: (backgroundShape.size.height - backgroundShape.size.height * CGFloat(background)) + ((CGFloat(background) - 1) * -Configurations().backgroundShapesSettingsMenuSpacer) )
            backgroundShape.zPosition = Configurations().settingsWindowElementszPosition
            insideWindow.addChild(backgroundShape)
        }
    }
    
    func loadSettingsBackgroundColorsWindow(insideWindow: TouchableSpriteNode){
        for background in 0...Configurations().numberOfBackgroundColors-1{
            let colorImageName = Configurations().backgroundImagePrefix + String(background) + Configurations().backgroundColorSampleSuffix
            let backgroundColor = TouchableSpriteNode(imageNamed: colorImageName)
            var spacerValue : CGFloat = 0
            var positionX : CGFloat = 0
            var positionY : CGFloat = 0
            let whichRow = CGFloat(Int((CGFloat(background)/Configurations().numberOfColorsPerRow)))
            backgroundColor.isUserInteractionEnabled = true
            backgroundColor.size = CGSize(width: insideWindow.frame.width * Configurations().backgroundColorsSettingsMenuFactor, height: insideWindow.frame.width * Configurations().backgroundColorsSettingsMenuFactor)
            backgroundColor.name = colorImageName
            spacerValue = backgroundColor.size.width / Configurations().numberOfColorsPerRow
            positionX = ((backgroundColor.size.width + spacerValue) * ((CGFloat(background) - 2) + (-Configurations().numberOfColorsPerRow * whichRow))) + spacerValue*2.5
            positionY = ((backgroundColor.size.width + spacerValue) * whichRow)
            backgroundColor.position = CGPoint(x: positionX, y: positionY)
            backgroundColor.zPosition = Configurations().settingsWindowElementszPosition
            insideWindow.addChild(backgroundColor)
        }
    }
    
    func resetSettingsWindow(settingsWindow: TouchableSpriteNode){
        for child in settingsWindow.children{
            if(child.name != Configurations().settingsExitNodeName){
                child.removeFromParent()
            }
        }
    }
}

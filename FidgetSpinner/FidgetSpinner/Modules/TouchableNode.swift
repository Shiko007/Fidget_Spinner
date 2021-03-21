//
//  TouchableNode.swift
//  FidgetSpinner
//
//  Created by Sherif Yasser on 06.03.21.
//
import SpriteKit
import CoreGraphics

class TouchableSpriteNode : SKSpriteNode
{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        
        if((self.name?.contains(Configurations().playerNodeName))!){
            PlayerNode().PlayerNodeTouched(playerNode: self)
        }
        else if(self.name == (Configurations().settingsNodeName)){
            Settings().SettingsNodeTouched(settingsNode: self)
        }
        else if(self.name == (Configurations().settingsExitNodeName)){
            Settings().addSettingsIcon(scene: self.scene!)
            self.parent?.removeFromParent()
            self.removeFromParent()
        }
        else if(self.name == (Configurations().settingsWindowName)){

        }
        else if(self.name == (Configurations().settingsBackgroundShapesName)){
            Settings().backgroundShapesTouched(backgroundShapesNode: self)
        }
        else if(self.name == (Configurations().settingsBackgroundColorsName)){
            Settings().backgroundColorsTouched(backgroundColorsNode: self)
        }
        else if((self.name?.contains(Configurations().backgroundImagePrefix))! && ((self.name?.contains(Configurations().backgroundImageSampleSuffix))!)){
            let backgroundNode = self.scene?.childNode(withName: Configurations().backgroundImagePrefix) as! SKShapeNode
            let backgroundImageName = self.name?.replacingOccurrences(of: Configurations().backgroundImageSampleSuffix, with: "")
            backgroundNode.fillTexture = SKTexture(imageNamed: backgroundImageName!)
        }
        else if((self.name?.contains(Configurations().backgroundImagePrefix))! && ((self.name?.contains(Configurations().backgroundColorSampleSuffix))!)){
            let backgroundNode = self.scene?.childNode(withName: Configurations().backgroundImagePrefix) as! SKShapeNode
            let prefix = Configurations().backgroundImagePrefix
            let suffix = Configurations().backgroundColorSampleSuffix
            if let color = (UIImage(named: self.name!)!)[100,100]{
                //Workaround the black not being detected as black issue
                if(self.name! == prefix + "0" + suffix){
                    backgroundNode.fillColor = .black
                }
                else{
                    var red: CGFloat = 0.0
                    var green: CGFloat = 0.0
                    var blue: CGFloat = 0.0
                    var alpha: CGFloat = 0.0
                    color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
                    backgroundNode.fillColor = color
                }
            }
        }
    }
}

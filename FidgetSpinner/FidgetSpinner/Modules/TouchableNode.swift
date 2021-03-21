//
//  TouchableNode.swift
//  FidgetSpinner
//
//  Created by Sherif Yasser on 06.03.21.
//

import SpriteKit

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
            print(self.size)
            print(self.frame.minX)
            print(touches.first?.location(in: self))
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
            print(backgroundNode)
            backgroundNode.fillTexture = SKTexture(imageNamed: backgroundImageName!)
        }
    }
}

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
        else if((self.name?.contains(Configurations().settingsNodeName))!){
            Settings().SettingsNodeTouched(settingsNode: self)
        }
    }
}

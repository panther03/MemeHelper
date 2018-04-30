//
//  Meme.swift
//  MemeHelper
//
//  Created by panther on 4/30/18.
//  Copyright © 2018 panther. All rights reserved.
//

import UIKit

class Meme : NSObject {
    var name : String
    var image : UIImage
    var sound : URL?
    
    init(name : String, image : UIImage, sound : URL?) {
        self.name = name
        self.image = image
        self.sound = sound
        
        super.init()
    }
}

//
//  EmoticonsController.swift
//  MemeHelper
//
//  Created by panther on 4/23/18.
//  Copyright © 2018 panther. All rights reserved.
//

import UIKit

class EmoticonsController: UIViewController {
    
    @IBAction func basicClicked(_ sender: UIButton) {
        UIPasteboard.general.string = "( ͡°  ͜ʖ ͡°)"
    }
    @IBAction func cuteClicked(_ sender: UIButton) {
        UIPasteboard.general.string = "( ͡◉ ͜ʖ ͡◉)"
    }
    @IBAction func heartClicked(_ sender: UIButton) {
        UIPasteboard.general.string = "( ♥ ͜ʖ ♥)"
    }
    @IBAction func dongerClicked(_ sender: UIButton) {
        UIPasteboard.general.string = "༼ຈل͜ຈ༽"
    }
    @IBAction func creepyClicked(_ sender: UIButton) {
        UIPasteboard.general.string = "┬┴┤( ͡⚆ل͜├┬┴┬"
    }
    @IBAction func tableFlipClicked(_ sender: UIButton) {
        UIPasteboard.general.string = "(╯ຈل͜ຈ) ╯︵ ┻━┻"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

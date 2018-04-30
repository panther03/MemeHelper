//
//  EmoticonsController.swift
//  MemeHelper
//
//  Created by panther on 4/23/18.
//  Copyright © 2018 panther. All rights reserved.
//

import UIKit

class EmoticonsController: UIViewController {
    @IBOutlet weak var copied_basic : UILabel!
    @IBOutlet weak var copied_cute : UILabel!
    @IBOutlet weak var copied_heart : UILabel!
    @IBOutlet weak var copied_donger : UILabel!
    @IBOutlet weak var copied_creepy : UILabel!
    @IBOutlet weak var copied_tableFlip : UILabel!
    
    let buttonClickWait = 0.25
    var lastButtonClick = Date()
    
    func rootClicked(string : String, labelToShow : UILabel) {
        if lastButtonClick.timeIntervalSinceNow * -1 > buttonClickWait {
            UIPasteboard.general.string = string
            fadeIn(view : labelToShow)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.fadeOut(view: labelToShow)
            }
            lastButtonClick = Date()
        }
    }
    
    func fadeOut(view : UIView) {
        UIView.animate(withDuration: 0.5, animations: { () -> Void in
            view.alpha = 0
        })
    }
    
    func fadeIn(view : UIView) {
        UIView.animate(withDuration: 0.5, animations: { () -> Void in
            view.alpha = 1
        })
    }
    
    @IBAction func basicClicked(_ sender: UIButton) {
        rootClicked(string: "( ͡°  ͜ʖ ͡°)", labelToShow: copied_basic)
    }
    @IBAction func cuteClicked(_ sender: UIButton) {
        rootClicked(string: "( ͡◉ ͜ʖ ͡◉)", labelToShow: copied_cute)
    }
    @IBAction func heartClicked(_ sender: UIButton) {
        rootClicked(string: "( ♥ ͜ʖ ♥)", labelToShow: copied_heart)
    }
    @IBAction func dongerClicked(_ sender: UIButton) {
        rootClicked(string: "༼ຈل͜ຈ༽", labelToShow: copied_donger)
    }
    @IBAction func creepyClicked(_ sender: UIButton) {
        rootClicked(string: "┬┴┤( ͡⚆ل͜├┬┴┬",labelToShow: copied_creepy)
    }
    @IBAction func tableFlipClicked(_ sender: UIButton) {
        rootClicked(string: "(╯ຈل͜ຈ) ╯︵ ┻━┻", labelToShow: copied_tableFlip)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

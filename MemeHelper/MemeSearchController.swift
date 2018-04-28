//
//  MemeSearchController.swift
//  MemeHelper
//
//  Created by panther on 4/27/18.
//  Copyright © 2018 panther. All rights reserved.
//

import UIKit

class MemeSearchController: UIViewController {
    @IBOutlet weak var queryText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showWebsite" {
            let kymController = segue.destination as! KYMWebpageController
            kymController.query = queryText.text!
        }
    }
}

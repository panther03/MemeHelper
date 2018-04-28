//
//  KYMWebpageController.swift
//  MemeHelper
//
//  Created by panther on 4/27/18.
//  Copyright © 2018 panther. All rights reserved.
//

import UIKit
import WebKit

class KYMWebpageController: UIViewController {
    @IBOutlet weak var kymView: WKWebView!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func generateURL(query : String) -> URL? {
        let cleaned_query = query.replacingOccurrences(of: " ", with: "_")
        return URL(string:"http://www.knowyourmeme/search?q=\(cleaned_query)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let request = URLRequest(url: generateURL(query: "The JoJ")!)
        print(request)
        kymView.load(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

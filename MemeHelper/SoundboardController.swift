//
//  SoundboardController.swift
//  MemeHelper
//
//  Created by panther on 4/24/18.
//  Copyright © 2018 panther. All rights reserved.
//

import UIKit

class SoundboardController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let meme_names : [String] = ["Steamed Hams", "друг"]
    let meme_images : [UIImage] = [
        UIImage(named:"steamed-hams")!,
        UIImage(named:"apyr")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return meme_names.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        cell.MemeImage.image = meme_images[indexPath.item]
        cell.MemeName.text = meme_names[indexPath.item]
        
        return cell
    }

}

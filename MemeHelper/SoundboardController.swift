//
//  SoundboardController.swift
//  MemeHelper
//
//  Created by panther on 4/24/18.
//  Copyright © 2018 panther. All rights reserved.
//

import UIKit
import AVFoundation

class SoundboardController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var cellSize : CGFloat {
        return (self.collectionView.frame.size.width - 20)/2
    }
    var audioplayer: AVAudioPlayer!
    
    let meme_names : [String] = ["Steamed Hams", "друг"]
    let meme_images : [UIImage] = [
        UIImage(named:"steamed-hams")!,
        UIImage(named:"apyr")!
    ]
    let meme_audio_urls : [URL?] = [
        Bundle.main.url(forResource: "oof", withExtension: "mp3"),
        Bundle.main.url(forResource: "oof", withExtension: "mp3"),
        Bundle.main.url(forResource: "oof", withExtension: "mp3"),
        Bundle.main.url(forResource: "oof", withExtension: "mp3"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsetsMake(5, 5, 0, 5)
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: cellSize,
                                 height: cellSize)

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
        cell.MemeImage.frame.size = CGSize(width: cellSize, height: cellSize)
       
        let str = NSAttributedString(string: meme_names[indexPath.item], attributes: [
            NSAttributedStringKey.foregroundColor : UIColor.black,
            NSAttributedStringKey.strokeColor : UIColor.white,
            NSAttributedStringKey.strokeWidth: -3,
            NSAttributedStringKey.font: UIFont.systemFont(ofSize: 24.0)
            ])
        cell.MemeName.attributedText = str
        cell.MemeName.frame.size = CGSize(width: cellSize, height: cellSize)
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        cell.layer.cornerRadius = 10
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        
        do {
            audioplayer = try AVAudioPlayer(contentsOf: meme_audio_urls[indexPath.item]!)
            audioplayer.play()
        } catch {
            print("Sorry, better ZUCC next time.")
        }
        
        cell?.layer.borderWidth = 0.5
    }

}

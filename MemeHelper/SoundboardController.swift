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
    var selectedRow : Int = -1
    
    @IBOutlet weak var collectionView: UICollectionView!
    var cellSize : CGFloat {
        return (self.collectionView.frame.size.width - 20)/2
    }
    var audioplayer: AVAudioPlayer!
    
    let memes : [Meme] = [
        Meme(name: "Roblox Oof", image: UIImage(named:"oof")!, sound: Bundle.main.url(forResource: "oof", withExtension: "mp3")),
        Meme(name: "The ZUCC", image: UIImage(named:"zucc")!, sound:  Bundle.main.url(forResource: "zucc", withExtension: "mp3")),
        Meme(name: "Steamed Hams", image: UIImage(named:"steamed-hams")!, sound: Bundle.main.url(forResource: "Steamed Hams", withExtension: "mp3")),
        Meme(name: "дpyr", image: UIImage(named:"apyr")!, sound: Bundle.main.url(forResource: "apyr", withExtension: "mp3")),
        Meme(name: "Jesus Christ it's Jason Bourne", image: UIImage(named:"jason_bourne")!, sound: Bundle.main.url(forResource: "jason_bourne", withExtension: "mp3")),
        Meme(name: "Mission Impossible Theme", image: UIImage(named:"mission_impossible")!, sound: Bundle.main.url(forResource: "mission_impossible", withExtension: "mp3"))
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
        return memes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        cell.MemeImage.image = memes[indexPath.item].image
        cell.MemeImage.frame.size = CGSize(width: cellSize, height: cellSize)
       
        let str = NSAttributedString(string: memes[indexPath.item].name, attributes: [
            NSAttributedStringKey.foregroundColor : UIColor.black,
            NSAttributedStringKey.strokeColor : UIColor.white,
            NSAttributedStringKey.strokeWidth: -3.5,
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
        selectedRow = indexPath.item
        let cell = collectionView.cellForItem(at: indexPath)
        let asset = AVURLAsset(url: memes[indexPath.item].sound!)
        UIView.animate(withDuration: CMTimeGetSeconds(asset.duration), delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: [], animations: {
            cell?.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }, completion: { finished in
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: [], animations: {
                cell?.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: nil
            )}
        )
        do {
            audioplayer = try AVAudioPlayer(contentsOf: memes[indexPath.item].sound!)
            audioplayer.play()
        } catch {
            print("Sorry, better ZUCC next time.")
        }
    }
}

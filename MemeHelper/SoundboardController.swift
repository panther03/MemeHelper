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
    
    let memes : [Meme] = [
        Meme(name: "Roblox Oof", image: UIImage(named:"oof")!, sound: Bundle.main.url(forResource: "oof", withExtension: "mp3")),
        Meme(name: "The ZUCC", image: UIImage(named:"zucc")!, sound:  Bundle.main.url(forResource: "zucc", withExtension: "mp3"))
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
        let cell = collectionView.cellForItem(at: indexPath)
        let asset = AVURLAsset(url: memes[indexPath.item].sound!)
        UIView.animate(withDuration: CMTimeGetSeconds(asset.duration), delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: [], animations: {
            cell?.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }, completion: { finished in
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {
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

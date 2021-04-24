//
//  CollectionViewController.swift
//  Course2Week3Task2
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let photosForCV = PhotoProvider().photos()
    let identifier = "PhotoCVCell"
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.photoCollectionView.register(UINib(nibName: "PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: identifier)
        
        photoCollectionView.contentInset = UIEdgeInsets(top: -8, left: 8, bottom: -8, right: 8)
        
        photoCollectionView.dataSource = self
        photoCollectionView.delegate = self
        }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosForCV.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = photoCollectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! PhotoCollectionViewCell
        
        cell.configure(with: photosForCV[indexPath.item])
        cell.layoutSubviews()
        
        return cell
        }

}

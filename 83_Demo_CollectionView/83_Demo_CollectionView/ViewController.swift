//
//  ViewController.swift
//  83_Demo_CollectionView
//
//  Created by MeoBeo on 9/17/20.
//  Copyright © 2020 Nguyen Anh Dao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet var collecView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collecView.dataSource = self
        collecView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.backgroundColor = #colorLiteral(red: 0.3045953653, green: 0.9651229978, blue: 0.3616073353, alpha: 1)
        cell.imgView.image = UIImage(named: "dentat")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 110, height: 110)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let manhinh2:MH2ViewController = storyboard?.instantiateViewController(withIdentifier: "MH2") as! MH2ViewController
        manhinh2.hinh = "dentat"
        self.navigationController?.pushViewController(manhinh2, animated: true)
    }

}

//
//  ViewController.swift
//  BluePrint01
//
//  Created by Shaun Tucker on 6/14/18.
//  Copyright © 2018 Shaun Tucker. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var collectionView: UICollectionView!
    private var dataRef: CollectionReference!
    
    var imagesArray = [UIImage(named:"3aria1.jpg"), UIImage(named:"3ballys1.jpg"), UIImage(named:"3bellagio.jpg") ]
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataRef = Firestore.firestore().collection("casinos")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        dataRef.getDocuments { (snapshot, error) in
            if let err = error {
                debugPrint("Error fetching docs: \(error)")
            } else {
                //print(snapshot?.documents)
                guard let snap = snapshot else { return }
                for document in snap.documents {
                    print(document.data())
                }
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionViewCell
        
        cell.imageName.image = imagesArray[indexPath.row]
        
        
        return cell 
    }

}


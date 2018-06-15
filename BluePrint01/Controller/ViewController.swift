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
    
    private var casinos = [Casino]()
    
    
 
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
                    //print(document.data())
                    let data = document.data()
                    let documentId = document.documentID
                    let location = data[LOCATION] as? String ?? "Anonymous"
                    let phone = data[PHONE] as? String ?? ""
                    let ratings = data[RATING] as? String ?? "No rating"
                    
                    
                    let newCasino = Casino(documentId: documentId, location: location, phone: phone, rating: ratings)
                    self.casinos.append(newCasino)
                }
                self.collectionView.reloadData()
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return casinos.count 
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "casinoCell", for: indexPath) as? CasinoCell {
            
            cell.configureCell(casino: casinos[indexPath.row])
            
            return cell
        } else {
            return UICollectionViewCell()
        }
    }

}










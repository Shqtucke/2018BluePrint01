//
//  CasinoCell.swift
//  BluePrint01
//
//  Created by Shaun Tucker on 6/14/18.
//  Copyright © 2018 Shaun Tucker. All rights reserved.
//

import UIKit

class CasinoCell: UICollectionViewCell {
    
    @IBOutlet var LabelOne: UILabel!
    @IBOutlet var labelTwo: UILabel!
    @IBOutlet var labelThree: UILabel!
    @IBOutlet var labelFour: UILabel!
    
    func configureCell(casino: Casino) {
        LabelOne.text = casino.location
        labelTwo.text = casino.documentId
        labelThree.text = casino.rating
        labelFour.text = String(casino.phone)
        
    }
}



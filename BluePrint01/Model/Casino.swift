//
//  Casino.swift
//  BluePrint01
//
//  Created by Shaun Tucker on 6/14/18.
//  Copyright © 2018 Shaun Tucker. All rights reserved.
//

import Foundation

class Casino {
    
    private(set) var documentId: String!
    private(set) var location: String!
    private(set) var phone: String!
    private(set) var rating: String!
    
    
    
    init(documentId: String, location: String, phone: String, rating: String) {
        
        self.documentId = documentId
        self.location = location
        self.phone = phone
        self.rating = rating
        
        
    }
    
}

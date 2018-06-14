//
//  Casino.swift
//  BluePrint01
//
//  Created by Shaun Tucker on 6/14/18.
//  Copyright © 2018 Shaun Tucker. All rights reserved.
//

import Foundation

class Casino {
    
    private(set) var location: String!
    private(set) var phone: Int!
    private(set) var rating: String!
    private(set) var documentId: String!
    
    init(location: String, phone: Int, rating: String, documentId: String) {
        self.location = location
        self.phone = phone
        self.rating = rating
        self.documentId = documentId
        
    }
    
}

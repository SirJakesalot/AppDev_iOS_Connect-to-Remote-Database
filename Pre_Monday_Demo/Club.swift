//
//  Club.swift
//  Pre_Monday_Demo
//
//  Created by Jake on 2/20/16.
//  Copyright © 2016 Jake. All rights reserved.
//

import Foundation

class Club : NSObject {
    var id          : String
    var timestamp   : String
    var name        : String
    var category    : String
    var dateStarted : String
        
    init (_id:String, _timestamp:String, _name:String, _category:String, _dateStarted:String) {
        id = _id
        timestamp = _timestamp
        name = _name
        category = _category
        dateStarted = _dateStarted
    }
    
    override var description: String {
        return "id: \(id), timestamp: \(timestamp), name: \(name), category: \(category), dateStart: \(dateStarted)"
    }
    
}
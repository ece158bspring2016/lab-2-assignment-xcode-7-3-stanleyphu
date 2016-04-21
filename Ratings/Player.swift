//
//  Car.swift
//  Ratings
//
//  Created by Stanley Phu on 4/20/16.
//  Copyright © 2016 Stanley Phu. All rights reserved.
//

import Foundation

import UIKit

struct Player {
    var name: String?
    var team: String?
    var rating: Int
    
    init(name: String?, team: String?, rating: Int) {
        self.name = name;
        self.team = team;
        self.rating = rating;
    }
}

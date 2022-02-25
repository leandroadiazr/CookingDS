//
//  Friend.swift
//  CollecTableView
//
//  Created by Leandro Diaz on 12/3/20.
//

import Foundation

struct Friend: Codable {
    var id: UUID
    var name: String
    var age: Int
    var company: String
    var email: String
    var registered: Date
    var tags: [String]
    var friends: [Connection]
    
}



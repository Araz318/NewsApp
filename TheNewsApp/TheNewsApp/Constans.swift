//
//  Constans.swift
//  TheNewsApp
//
//  Created by Araz Muradov on 15.03.23.
//

import Foundation
struct News: Codable {
    let article: String
    let title: String
    let image: String
    let category: String
    
    
}
struct User: Codable {
    var fullname: String
    var birthday: String
    var email: String
    var password: String
    
    }

struct Favorit: Codable {
    let article: String
    let title: String
    let image: String
    let category: String
    
    
}


//
//  User.swift
//  MSIBTest-SuitmediaKM7
//
//  Created by rifqi triginandri on 09/08/24.
//


import Foundation

struct User: Decodable{
    
    let email: String
    let first_name: String
    let last_name: String
    let avatar: String
    
}

struct UserResponse: Decodable{
    let data: [User]
}

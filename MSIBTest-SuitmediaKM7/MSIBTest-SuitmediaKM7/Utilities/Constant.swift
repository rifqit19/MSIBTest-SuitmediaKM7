//
//  Constant.swift
//  MSIBTest-SuitmediaKM7
//
//  Created by rifqi triginandri on 09/08/24.
//

import Foundation

struct Constants{
    
    struct Api {
        static let baseUrl = "https://reqres.in/api"
    }
    
    struct Endpoints {
        static let users = "users"
    }
    
    struct Parameters{
        struct Users{
            static let kPage = "page"
            static let kPerPage = "per_page"
            
            static func getUsers(page: Int, perPage: Int) -> [String: Any]{
                return[
                    kPage: page,
                    kPerPage: perPage
                ]
            }

        }
    }
}

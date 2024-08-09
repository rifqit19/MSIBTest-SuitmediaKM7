//
//  ApiHelper.swift
//  MSIBTest-SuitmediaKM7
//
//  Created by rifqi triginandri on 09/08/24.
//

import Foundation

class ApiHelper{
    
    static let shared = ApiHelper()
    
    private let apiClient = ApiClient.shared
    
    private init() {}
    
    func fetchUsers(page: Int, perPage: Int, completion: @escaping ([User]?, Error?) -> Void){
        let parameters = Constants.Parameters.Users.getUsers(page: page, perPage: perPage)
        
        apiClient.fetchData(endpoint: Constants.Endpoints.users, parameters: parameters) { data, error in

            guard let data = data, error == nil else{
                completion(nil, error)
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let result = try decoder.decode(UserResponse.self, from: data)

                completion(result.data, nil)
            }catch{
                completion(nil, error)
            }
        }
    }
}




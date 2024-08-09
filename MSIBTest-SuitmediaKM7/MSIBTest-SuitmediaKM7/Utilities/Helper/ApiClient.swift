//
//  ApiClient.swift
//  MSIBTest-SuitmediaKM7
//
//  Created by rifqi triginandri on 09/08/24.
//

import Foundation

class ApiClient{
    
    static let shared = ApiClient()
    
    private init() {}
    
    func fetchData(endpoint: String, parameters: [String: Any], completion: @escaping (Data?, Error?) -> Void){
        let url = buildUrl(endpoint: endpoint, parameters: parameters)
        print("URL: \(url)")
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data, error)
        }.resume()
        
    }
    
    
    private func buildUrl(endpoint: String, parameters: [String: Any]) -> URL {
        var components = URLComponents(string: Constants.Api.baseUrl + "/" + endpoint)!
        components.queryItems = parameters.map { URLQueryItem(name: $0.key, value: String(describing: $0.value)) }
        return components.url!
    }
    
    
}

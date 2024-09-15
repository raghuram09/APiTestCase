//
//  NetWorking.swift
//  ApiTesting
//
//  Created by Raghu on 04/08/24.
//

import Foundation

 protocol ApiCall{
    
    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void)
     
     func apiAlert()
}
extension ApiCall{
    func apiAlert(){
    }
}

class APIClient:ApiCall {

   // static let shared = APIClient()
    
    let baseURL = URL(string: "https://jsonplaceholder.typicode.com")!

    func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        let url = baseURL.appendingPathComponent("/users")
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                let error = NSError(domain: "APIError", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])
                completion(.failure(error))
                return
            }
            
            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                completion(.success(users))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}

struct User: Codable,Hashable {
    let id: Int
    let name: String
    let username: String
    let email: String
}

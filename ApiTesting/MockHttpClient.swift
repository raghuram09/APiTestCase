//
//  MockHttpClient.swift
//  ApiTesting
//
//  Created by Raghu on 15/09/24.
//

import Foundation

class MockHttpClient:APIClient{
    var shouldReturnError = false
    var mockUserList:[User]? = []
    override func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        
        if let mockViewUserData = mockUserList {
            
            completion(.success(mockViewUserData))
        }else{
            
            
        }
    }
    
}

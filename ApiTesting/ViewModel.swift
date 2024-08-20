//
//  ViewModel.swift
//  ApiTesting
//
//  Created by Raghu on 04/08/24.
//

import Foundation

class ViewModel:ObservableObject{
    
    @Published var users = [User]()
    
    
    func getUsers(){
        
        APIClient.shared.fetchUsers { responce in
            
            switch responce{
                
            case .success(let success):
                
                self.users = success
            case .failure(let failure):
                
                print(failure.localizedDescription)
            }
        }
    }
}

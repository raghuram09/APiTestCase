//
//  ViewModel.swift
//  ApiTesting
//
//  Created by Raghu on 04/08/24.
//

import Foundation

class ViewModel:ObservableObject{
    
    @Published var users = [User]()
    
    var apiCallRef: ApiCall
    init(apiCallRef:ApiCall){
        self.apiCallRef = apiCallRef
    }
    func getUsers(){

        apiCallRef.fetchUsers { responce in
            switch responce{
                
            case .success(let success):
                DispatchQueue.main.async {
                    self.users = success
                    print(self.users)

                }
            case .failure(let failure):
                
                print(failure.localizedDescription)
            }
        }
    }
}

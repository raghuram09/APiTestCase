//
//  ContentView.swift
//  ApiTesting
//
//  Created by Raghu on 04/08/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        List{
            
            ForEach(viewModel.users,id: \.self){ user in
                
                RowView(userInfo: user)
                
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

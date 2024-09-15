//
//  RowView.swift
//  ApiTesting
//
//  Created by Raghu on 14/09/24.
//

import SwiftUI

struct RowView: View {
    var userInfo : User?
    var body: some View {
        VStack{
            Text(userInfo?.name ?? "" )
            Text(userInfo?.email ?? "")
        }
    }
}

#Preview {
    RowView()
}

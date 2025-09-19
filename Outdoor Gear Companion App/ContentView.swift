//
//  ContentView.swift
//  Outdoor Gear Companion App
//
//  Created by Esther Nzomo on 8/13/25.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                Homepage()
            } else {
                LoginView()
            }
        }
        
    }
}

#Preview {
    ContentView()
}

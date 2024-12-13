//
//  ContentView.swift
//  Example
//

import SwiftUI
import FullviewSDK

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Normal text")
            DataRedaction {
                Text("This text can't be seen in agent side")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

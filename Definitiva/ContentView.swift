//
//  ContentView.swift
//  Definitiva
//
//  Created by Luciano Nicolini on 30/10/2023.
//

import SwiftUI

struct ContentView: View {
   
    @State private var selection: Tab = .featured

    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(Tab.featured)


            SearchView()
                .tabItem {
                    Label("Hotels", systemImage: "bed.double.fill")
                }
                .tag(Tab.list)
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}

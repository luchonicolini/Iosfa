//
//  SearchView.swift
//  Definitiva
//
//  Created by Luciano Nicolini on 07/11/2023.
//

import SwiftUI

struct SearchView: View {
    @Environment(ModelData.self) var modelData
    let background = Color("Color")
    @State private var searchText = ""
    
    var filteredDestinos: [String: [Model]] {
        if searchText.isEmpty {
            return modelData.categories
        } else {
            return modelData.categories.mapValues { landmarks in
                landmarks.filter { landmark in
                    landmark.name.localizedCaseInsensitiveContains(searchText)
                }
            }.filter { !$0.value.isEmpty }
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color(background).ignoresSafeArea(.all)
                
                ScrollView(.vertical,showsIndicators: false) {
                    VStack(spacing: 16) {
                        if filteredDestinos.isEmpty {
                            EmptySearchPlaceholder()
                        } else {
                            ForEach(filteredDestinos.keys.sorted(), id: \.self) { key in
                                CategoryRow(categoryName: key, items: filteredDestinos[key]!)
                                Divider().overlay(Color("Decoracion")).frame(width: 350).opacity(0.4)
                            }
                        }
                    }
                //.padding(10)
                }
            }
            .searchable(text: $searchText, prompt: "buscador de ciudades")
            .frame(maxHeight: .infinity, alignment: .top)
            .navigationTitle("Hoteles Iosfa")
        }
    }
}

#Preview {
    SearchView()
        .environment(ModelData())
}

struct EmptySearchPlaceholder: View {
    var body: some View {
        VStack {
           Label("No se encontraron destinos", systemImage: "magnifyingglass")
        }
    }
}

struct CategoryItem: View {
    var landmark: Model
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(landmark.image)
                .renderingMode(.original)
                .resizable()
                .frame(width: 285, height: 155)
                .cornerRadius(10)
            
            Text(landmark.name)
                .foregroundStyle(.primary)
               // .font(.caption)
                .font(.subheadline)
                .fontWeight(.medium)
            Text(landmark.subtitle)
                .font(.caption)
                .foregroundStyle(.gray)
        }
        .padding(.leading, 15)
    }
}

struct CategoryRow: View {
    var categoryName: String
    var items: [Model]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { landmark in
                        NavigationLink {
                            DetailView(landmark: landmark)
                        } label: {
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

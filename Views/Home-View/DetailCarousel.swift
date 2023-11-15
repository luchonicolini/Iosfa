//
//  DetailCarousel.swift
//  Definitiva
//
//  Created by Luciano Nicolini on 06/11/2023.
//

import SwiftUI

struct DetailCarousel: View {
    
    let location: Model.Category

    @State var modelData = ModelData()

    var hotels: [Model] {
        modelData.landmarks.filter { $0.category == location }
    }
      
    var body: some View {
        NavigationStack {
            List {
                ForEach(hotels) { hotel in
                    NavigationLink(destination: DetailView(landmark: hotel)) {
                        HStack(spacing: 20) {
                            Image(hotel.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .shadow(radius: 5)

                            VStack(alignment: .leading, spacing: 5) {
                                Text(hotel.name)
                                    .font(.headline)
                                    .fontWeight(.semibold)

                                Text(hotel.description)
                                    .font(.caption)
                                    .lineLimit(2)
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.vertical, 10)
                    }
                }
            }
            .listStyle(PlainListStyle())
        .navigationBarTitle(Text(location.rawValue), displayMode: .inline)
        }
    }
}

#Preview {
    DetailCarousel(location: .bariloche)
        .environment(ModelData())
}

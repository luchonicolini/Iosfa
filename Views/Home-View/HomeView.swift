//
//  HomeView.swift
//  Definitiva
//
//  Created by Luciano Nicolini on 02/11/2023.
//

import SwiftUI

struct HomeView: View {
    
    let background = Color("Color")
    @State private var showingProfile = false
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color(background)
                    .ignoresSafeArea()
                ScrollView(.vertical, showsIndicators: false) {
                
                    CarouselScroll()
        
                    Divider()
                        //.padding()
                        
                    Extracted()
                  
                    ProfileHost()
                }
            }
            .navigationTitle("Nuestros Destinos")
            .toolbar {
                         Button {
                             showingProfile.toggle()
                         } label: {
                             Label("User Profile", systemImage: "info.circle")
                         }
                     }
                     .sheet(isPresented: $showingProfile) {
                         ProfileHost()
                     }
        }
    }
}

#Preview {
    HomeView()
}

//CarouselScroll
struct CarouselScroll: View {
    var features: [Feature] = Feature.sampleData
    @State var count: Int = 0
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(features) { feature in
                    VStack(alignment: .leading, spacing: 5) {
                        NavigationLink(destination: DetailCarousel(location: feature.category)) {
                            Image(feature.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 240, height: 300)
                                .cornerRadius(10)
                        }
                        Text(feature.name)
                            .font(.title3)
                            .fontWeight(.medium)
                        HStack {
                            Label {
                                Text(feature.subtitle)
                                    .font(.subheadline)
                                    .foregroundColor(.primary)
                            
                            } icon: {
                                Image(systemName: "mappin.and.ellipse.circle")
                                    .symbolEffect(.bounce, value: count)
                            }
                            .symbolVariant(.circle.fill)
                            .foregroundStyle(.white, .orange)
                            
                        }
                    }
                }
            }
        }
        .padding()
    }
}

struct Extracted: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Beneficios")
                .font(.title)
                .fontWeight(.medium)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .minimumScaleFactor(0.5)
              
            
            Text("Todos los afiliados podrán disfrutar de los siguientes beneficios")
                .frame(maxWidth: .infinity, alignment: .leading)
                //.font(.subheadline)
                .font(.caption)
                .foregroundStyle(.primary)
                .padding(.horizontal, 20)
                .lineLimit(nil)
                .minimumScaleFactor(0.5)
            
            Video()
                .padding()
                Divider().padding(.horizontal, 20)
          
            Text("Ofertas destacadas")
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.horizontal, 20)
                .padding(.top, 20)
            
            Text("Aqui podrás encontrar una selección de nuestras mejores ofertas para que puedas disfrutar de los mejores descuentos.")
                     //.font(.subheadline)
                     .font(.caption)
                     .foregroundColor(.primary)
                     .multilineTextAlignment(.leading)
                     .fixedSize(horizontal: false, vertical: true)
                     .padding(.horizontal, 20)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 10) {
                    ForEach(cards) { descuento in
                        CardBenefitView(descuento: descuento)
                        
                    }
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
            .safeAreaPadding(.horizontal)
            .padding(.top, 20)
            //.padding(.bottom,64)
            
            Divider()
                .padding()
            
            Text("Novedades")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.horizontal, 20)
               
            Text("Descubre las últimas noticias, ofertas y eventos exclusivos que tenemos para ti. ¡Mantente al tanto de todo lo nuevo!")
                .frame(maxWidth: .infinity, alignment: .leading)
                //.font(.subheadline)
                .font(.caption)
                .foregroundStyle(.primary)
                .padding(.horizontal, 20)
                .lineLimit(nil)
                .minimumScaleFactor(0.5)
            
            NovedadCard(item: Novedad.sampleData[0])
                .padding()
            Divider()
            
          
        }
    }
}



struct CardBenefitView: View {
    @State private var showDetail: Bool = false
    var descuento: ModelBenefit
    
    var body: some View {
            Image(descuento.image)
                .resizable()
                //.frame(width: 200, height: 250)
                .frame(width: 210, height: 250)
                .cornerRadius(10)
                
               
                .sheet(isPresented: $showDetail) {
                    CardDetail(descuento: descuento)
                }
                .onTapGesture {
                    withAnimation {
                        self.showDetail.toggle()
                    }
                }
                .scaleEffect(showDetail ? 0.95 : 1.0) // Una pequeña animación para indicar el tap.
        }
    }


struct NovedadCard: View {
    var item: Novedad

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            NavigationLink(destination: Hoteleria()) {
                Image(item.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .cornerRadius(10)
            }
            Text(item.title)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
        
            Text(item.description)
                .font(.caption)
                .foregroundStyle(.primary)
                .lineLimit(3)
        }
    }
}

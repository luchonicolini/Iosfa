//
//  DetailView.swift
//  Definitiva
//
//  Created by Luciano Nicolini on 30/10/2023.
//

import SwiftUI
import MapKit

struct DetailView: View {
    @Environment(\.dismiss) var dismiss
    var landmark: Model
    //let background = Color(UIColor.systemBackground)
    let background = Color("Color")
    @State private var isShowingPreReservaView = false

    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Rectangle()
                .fill(background)
                .edgesIgnoringSafeArea(.all)
            ScrollView(.vertical,showsIndicators: false) {
             
                ZStack(alignment: .topLeading) {
                    ImageCarousel(landmark: landmark)
                        .frame(height: 320)
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.black)
                            .background {
                                Circle()
                                    .fill(.white)
                                    .frame(width: 40, height: 35)
                            }
                            .padding(32)
                    }
                }
                
                VStack(alignment: .leading, spacing: 6) {
                   
                    Text(landmark.name)
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    Text(landmark.city)
                        .font(.subheadline)
                    
                    HStack {
                        Label(landmark.subtitle, systemImage: "location.circle")
                            .font(.caption)
                            .foregroundStyle(.primary)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(Color.black.opacity(0.1))
                            .cornerRadius(8)
                      
                        Spacer()
                      
                        Label(landmark.phone, systemImage: "phone")
                            //.font(.subheadline)
                            .font(.caption)
                            .foregroundStyle(.primary)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(Color.black.opacity(0.1))
                            .cornerRadius(8)
                    }
                    Divider()
                    
            
               
                    ExtractedView(landmark: landmark)
                // Divider()
//                        .padding(8)
                        
                    Condiciones()
            
                    Divider()
                        .padding(.top, 10)
                    
                    Text("Descripción")
                        .font(.title2)
                        .fontWeight(.medium)
                        .padding(.top, 0.1)
                    Text(landmark.description)
                        
        
                }
                .padding()
            }
            .cornerRadius(8)
            .toolbar(.hidden, for: .tabBar)
            .ignoresSafeArea()
            .padding(.bottom,64)
            .overlay(alignment: .bottom) {
                VStack {
                    Divider()
                        .padding(.bottom)
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Disponibilidad Actual")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            Text(landmark.condition)
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .foregroundStyle( landmark.condition == "Disponible" ? .green : .red)
            
                        }
                        Spacer()
                        Button {
                            isShowingPreReservaView.toggle()
                        } label: {
                            Text("Reservar")
                                .foregroundStyle(.white)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .frame(width: 140, height: 40)
                                .background(.orange)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                    }
                    .padding(.horizontal,32)
                }
                .toolbar(.hidden)
                .background(Color(UIColor.systemBackground))
                .sheet(isPresented: $isShowingPreReservaView) {
                    FormView()
                }
            }
        }
    }
}

#Preview {
    DetailView(landmark: ModelData().landmarks[0])
}


struct ExtractedView: View {
    var landmark: Model
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Comodidades")
                .font(.title2)
                .fontWeight(.medium)
           
            ScrollView(.horizontal) {
                ForEach(landmark.services.images, id: \.self) { bedroom in
                    HStack {
                      //  Image(bedroom)
                            //.frame(width: 32)
                       
                        
                    }
                }
            }
            .scrollTargetBehavior(.paging)
        }
    }
}

struct Condiciones: View {
    let colorDecoracion = Color("Decoracion")
    let checkInTime = "14:00"
    let checkOutTime = "10:00"
    
    @State private var showingAlert = false

    var body: some View {
        VStack(alignment: .leading) {
            Text("Condiciones del Hotel")
                .font(.title2)
                .fontWeight(.medium)
                .padding(.top, 0.1)
            
            Button(action: {
                showingAlert = true
            }) {
                Label("Horarios", systemImage: "clock")
                    .font(.subheadline)
                    .foregroundColor(.primary)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(Color.black.opacity(0.1))
                    .cornerRadius(8)
                
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Horarios del Hotel"),
                      message: Text("Entrada: \(checkInTime)\nSalida: \(checkOutTime)"),
                      dismissButton: .default(Text("Entendido")))
            }
        }
    }
}


//
//  CardDetail.swift
//  Definitiva
//
//  Created by Luciano Nicolini on 06/11/2023.
//

import SwiftUI

struct CardDetail: View {
    var descuento: ModelBenefit
    let background = Color("Color")
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Rectangle()
                .fill(Color(background))
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text(descuento.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.primary)
                    
                    Text("Descripción")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundStyle(.primary)
                    
                    Text(descuento.description)
                        .font(.subheadline)
                        .foregroundStyle(.primary)
                    
                    if let req = descuento.requirements {
                        Text("Requisitos")
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundStyle(.primary)
                        
                        Text(req)
                            .font(.subheadline)
                            .foregroundStyle(.primary)
                    }
                    
                    Divider().overlay(Color(.white)).frame(width: 350).opacity(0.8)
                    
                    Text("Puntos Destacados")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundStyle(.primary)
                    
                    ForEach(descuento.highlights, id: \.title) { highlight in
                        HStack {
                            Text("\(highlight.title):")
                                .fontWeight(.medium)
                            Spacer()
                            Text(highlight.detail)
                        }
                        .font(.subheadline)
                        .foregroundStyle(.primary)
                    }
                    
                    Divider().overlay(Color(.white)).frame(width: 350).opacity(0.8)
                    
                    Text("Norma de aplicación para los descuentos")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(.primary)
                    
                    VStack(alignment: .leading, spacing: 6)  {
                        Text("- Los descuentos rigen desde el 24 de junio de 2016.")
                        Text("- Reservas para unidades turísticas IOSFA se tramitarán según condiciones generales vigentes.")
                        Text("- Descuentos NO acumulativos/fraccionables.")
                        Text("- Reserva con mínimo 30 días de anticipación, sujeta a disponibilidad.")
                    }
                    .font(.subheadline)
                    .foregroundStyle(.primary)
                    .multilineTextAlignment(.leading)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
    }
}

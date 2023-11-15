//
//  ProfileHost.swift
//  Definitiva
//
//  Created by Luciano Nicolini on 13/11/2023.
//

import SwiftUI

struct ProfileHost: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    InfoRow(icon: "location", text: "Paso 551, CABA")
                    InfoRow(icon: "phone", text: "Teléfono: 011-4964-1800 Interno 4058")
                    InfoRow(icon: "phone", text: "Celular: 11-5979-6882")
                    InfoRow(icon: "envelope", text: "Correo electrónico: reservas.turismo@iosfa.gob.ar")
                } header: {
                    Text("ATENCIÓN AL PÚBLICO").bold().foregroundStyle(.primary)
                } footer: {
                    Text("Descubre la tranquilidad y comodidad que ofrecemos en nuestra sede principal. Estamos aquí para ayudarte en todo lo que necesites.")
                }
                
                Section {
                    InfoRow(icon: "location", text: "Av. Córdoba 354, CABA")
                    InfoRow(icon: "phone", text: "Teléfono: 011-4313-1265")
                    InfoRow(icon: "phone", text: "Celular: 11-5979-6882")
                    InfoRow(icon: "envelope", text: "Correo electrónico: secretaria.turismo@iosfa.gob.ar")
                } header: {
                    Text("FILIAL ADMINISTRATIVA").bold().foregroundStyle(.primary)
                } footer: {
                    Text("Explora nuestra filial administrativa, Siempre estamos disponibles para atenderte y responder a tus consultas.")
                }
            }
            // This is the only difference.
            .listStyle(.insetGrouped)
        }
    }
}

#Preview {
    ProfileHost()
}

struct InfoRow: View {
    var icon: String
    var text: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.accentColor)
                .imageScale(.medium)
            Text(text)
                .foregroundColor(.primary)
        }
    }
}

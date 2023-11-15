//
//  FormView.swift
//  Definitiva
//
//  Created by Luciano Nicolini on 09/11/2023.
//

import SwiftUI

struct FormView: View {
    
    let background = Color("Color")
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color(background)
                    .ignoresSafeArea()
                
                PersonalInformation()
                
             
            }
            .navigationBarTitle(Text("Formulario de reserva"))
        }
    }
}


#Preview {
    FormView()
}

struct PersonalInformation: View {
    @Bindable var viewModel = FormModel()
    
    var body: some View {
        Form {
            Section(header: Text("Datos personales").bold().foregroundStyle(.primary)) {
                HStack {
                    Image(systemName: "person.fill")
                    TextField("Nombre", text: $viewModel.firstName)
                }
                HStack {
                    Image(systemName: "person.fill")
                    TextField("Apellido", text: $viewModel.lastName)
                }
                HStack {
                    Image(systemName: "number.square.fill")
                    TextField("DNI", text: $viewModel.dni)
                        .keyboardType(.numberPad)
                }
                HStack {
                    Image(systemName: "phone.fill")
                    TextField("Teléfono", text: $viewModel.phoneNumber)
                        .keyboardType(.numberPad)
                }
                HStack {
                    Image(systemName: "envelope.fill")
                    TextField("Correo electrónico", text: $viewModel.userEmail)
                        .keyboardType(.emailAddress)
                        .textContentType(.emailAddress)
                }
            }
          
            Section(header: Text("Cantidad de personas").bold().foregroundStyle(.primary)) {
                Stepper(value: $viewModel.adults, in: 1...10) {
                    Text("Adultos: \(viewModel.adults)")
                }
                
                Stepper(value: $viewModel.children, in: 0...10) {
                    Text("Niños: \(viewModel.children)")
                }
                
                Picker(selection: $viewModel.roomType, label: Text("Tipo de Habitación")) {
                    Text("Doble").tag("Doble")
                    Text("Triple").tag("Triple")
                    Text("Depto").tag("Depto")
                }
            }
            
            Section(header: Text("Fechas de estadía").bold().foregroundStyle(.primary)) {
                DatePicker("Fecha de ingreso", selection: $viewModel.checkInDate, in: Date()..., displayedComponents: .date)
                DatePicker("Fecha de egreso", selection: $viewModel.checkOutDate, in: viewModel.checkInDate..., displayedComponents: .date)
                    .disabled(viewModel.checkInDate == viewModel.checkOutDate)
            }
            
            Button(action: {
                
            }) {
                HStack {
                    Image(systemName: "calendar.badge.plus")
                        .font(.title2)
                        .padding(.trailing, 10)
                    Text("Reservar")
                }
                .buttonStyle(.bordered)
                
            }
        }
    }
}



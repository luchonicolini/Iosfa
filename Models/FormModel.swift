//
//  FormModel.swift
//  Definitiva
//
//  Created by Luciano Nicolini on 10/11/2023.
//

import Foundation
import Observation

@Observable class FormModel {
    // Propiedades del formulario
     var firstName = ""
     var lastName = ""
     var dni = ""
     var phoneNumber = ""
    
     var adults = 1
     var children = 0
     var roomType = "Doble"
    
     var checkInDate = Date()
     var checkOutDate = Date()
    
    // Propiedad para el email del usuario
     var userEmail = ""
     var hotelName = ""
}

//
//  Model.swift
//  Definitiva
//
//  Created by Luciano Nicolini on 30/10/2023.
//

import Foundation
import SwiftUI
import CoreLocation

struct Model: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var subtitle: String
    var image: String
    var phone: String
    var city: String
    var condition: String
    var category: Category
    var gallery: [String]
    var description: String
    var services: Service

    
    enum Category: String, CaseIterable, Codable {
        case bariloche = "Bariloche"
        case mardelplata = "Mar del Plata"
        case sierras = "Sierras de Cordoba"
        case buenosaires = "Buenos Aires"
    }
    
    struct Service: Codable {
        var name: String
        var images: [String]
    }
        
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

//extension Model
extension Model: Equatable {
    static func == (lhs: Model, rhs: Model) -> Bool {
        return lhs.id == rhs.id
    }
}

//Model HomeView

struct Feature: Identifiable {
    var id = UUID()
    let imageName: String
    let name: String
    let subtitle: String
    let category: Model.Category
    
    init(id: UUID = UUID(), imageName: String, name: String, subtitle: String, category: Model.Category) {
        self.id = id
        self.imageName = imageName
        self.name = name
        self.subtitle = subtitle
        self.category = category
    }
}

extension Feature {
    static let sampleData: [Feature] =
    [
        Feature(imageName: "Uno_feature", name: "Bariloche", subtitle: "Río Negro", category: .bariloche),
        Feature(imageName: "Dos_feature", name: "Mar del Plata", subtitle: "Buenos Aires", category: .mardelplata),
        Feature(imageName: "Tres_feature", name: "Sierras de Cordoba", subtitle: "Cordoba", category: .sierras),
        Feature(imageName: "Cuatro_feature", name: "Buenos Aires", subtitle: "Caba", category: .buenosaires)
    ]
}

struct Novedad: Identifiable {
    var id: UUID
    var imageName: String
    var title: String
    var date: String
    var description: String
    //var destination: AnyView
    
    static var sampleData: [Novedad] = [
        Novedad(id: UUID(), imageName: "hoteleria", title: "Hoteleria Convenida Iosfa", date: "26 Julio, 2023", description: "Descubre destinos en Misiones, Entre Ríos, Mendoza y la Costa Atlántica. Aprovecha los acuerdos turísticos de IOSFA")
    ]
}

//ModelBenefit

struct ModelBenefit: Identifiable {
    var id = UUID()
    let name: String
    let image: String
    let description: String
    let requirements: String?
    let duration: String
    let highlights: [Highlight]
}

struct Highlight {
    let title: String
    let detail: String
}

let cards: [ModelBenefit] = [
    ModelBenefit(
        name: "Veteranos de Malvinas",
        image: "im_Turismo6",
        description: "Para todos los Afiliados/as que revisten la situación de Veteranos de la Guerra de Malvinas (VGM) pueden acceder a un 20% de descuento sobre las tarifas vigentes, pudiendo hacerlo extensivo a su pareja, por un periodo máximo de 7 días y 6 noches en cualquier época del año.",
        requirements: "Dicho beneficio puede ser utilizado solamente una vez por año y para poder aplicar a este, deberán presentar su Documento Nacional de Identidad.",
        duration: "Válido 1 una vez por año.",
        highlights: [
            Highlight(title: "Descuento", detail: "Anual, temporada baja o alta.")
        ]
    ),
    ModelBenefit(
        name: "Viaje de Bodas",
        image: "im_Turismo1",
        description: "10 noches de alojamiento para afiliados titulares recién casados.",
        requirements: "Presentación de copia de Acta de Matrimonio.",
        duration: "Válido 90 días post boda, cualquier época.",
        highlights: [
            Highlight(title: "Alojamiento", detail: "10 noches en nuestros hoteles."),
            Highlight(title: "Vigencia", detail: "Anual, temporada baja o alta.")
        ]
    ),
    ModelBenefit(
        name: "Retirados, Jubilados y Pensionados",
        image: "im_Turismo3",
        description: "Descuento en alojamiento para el Afiliado Titular, acompañante e hijos a cargo.",
        requirements: nil,
        duration: "Vigencia anual.",
        highlights: [
            Highlight(title: "Descuento", detail: "10% en alojamiento con desayuno.")
        ]
    ),
    ModelBenefit(
        name: "25-30 Años de Servicios",
        image: "im_beneficio2",
        description: "7 noches para quienes cumplen 25 años continuos o 30 años interrumpidos de servicio.",
        requirements: nil,
        duration: "Válido 1 año desde fecha aniversario, excepto fines de semana largos y temporada alta.",
        highlights: [
            Highlight(title: "Alojamiento", detail: "7 noches con desayuno en nuestros hoteles.")
        ]
    ),
    ModelBenefit(
        name: "Cumpleaños de 65",
        image: "im_Turismo4",
        description: "3 noches de alojamiento con desayuno en temporada baja para afiliados que cumplan 65 años.",
        requirements: "Presentación de copia de DNI para acreditar fecha de nacimiento.",
        duration: "Válido 1 año desde el cumpleaños, excepto fines de semana largos y temporada alta.",
        highlights: [
            Highlight(title: "Incluye", detail: "Alojamiento para el afiliado y un acompañante.")
        ]
    ),
    ModelBenefit(
        name: "Aniversario de Bodas",
        image: "im_Turismo5",
        description: "Regalos y descuentos especiales para celebrar aniversarios de boda.",
        requirements: "Presentación de copia de Acta de Matrimonio.",
        duration: "Válido 1 año desde la fecha aniversario, excepto fines de semana largos y temporada alta.",
        highlights: [
            Highlight(title: "Bodas de Oro/Plata", detail: "7 noches con desayuno."),
            Highlight(title: "10, 15 o 20 años de casados", detail: "50% descuento en 7 noches con desayuno."),
            Highlight(title: "55 años y cada 5 años subsiguientes", detail: "Beneficio especial para parejas.")
        ]
    )
]

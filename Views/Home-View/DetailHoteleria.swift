//
//  Hotel.swift
//  Definitiva
//
//  Created by Luciano Nicolini on 06/11/2023.
//

import SwiftUI

struct Hoteleria: View {
    
    struct ListItem: Identifiable {
        var id = UUID()
        var name: String
        var descuentos: String
        var phone: String
        var mail: String
        var web: URL
    }
    
    var informacion: [ListItem] = [
        ListItem(name: "Posada El Chamán (Puerto Iguazú)", descuentos: "25 % de descuento", phone: "tel:3757435105" ,mail: "mailto:posadadelchaman@gmail.com", web: URL(string: "https://www.posadadelchaman.com/")!),
        
        ListItem(name: "Hotel Queguay (Colón)", descuentos: "15 % de descuento", phone: "tel:8005551212" ,mail: "mailto:apple@me.com", web: URL(string: "https://www.posadadelchaman.com/")!),
        
        ListItem(name: "Agencia de viaje Sentidos (Colón)", descuentos: "10% y el 15% de descuento", phone: "tel:8005551212" ,mail: "reservas@posadadelchaman.com.ar", web: URL(string: "https://turismosentidos.com.ar/web/")!),
        
        ListItem(name: "Cabañas Bella Alba (San Rafael)", descuentos: "25 % de descuento", phone: "tel:8005551212" ,mail: "reservas@posadadelchaman.com.ar", web: URL(string: "https://turismosentidos.com.ar/web/")!),
        
        ListItem(name: "Cabañas Islas Malvinas (San Rafael)", descuentos: "25 % de descuento", phone: "tel:8005551212" ,mail: "reservas@posadadelchaman.com.ar", web: URL(string: "https://turismosentidos.com.ar/web/")!),
        
        ListItem(name: "Casa Turística (San Rafael)", descuentos: "15 % de descuento", phone: "tel:8005551212" ,mail: "reservas@posadadelchaman.com.ar", web: URL(string: "https://turismosentidos.com.ar/web/")!),
        
        ListItem(name: "Hotel Colonial (San Bernardo)", descuentos: "15 % de descuento", phone: "tel:8005551212" ,mail: "reservas@posadadelchaman.com.ar", web: URL(string: "https://turismosentidos.com.ar/web/")!),
        
        
    ]
    
    init() {
        UINavigationBar.appearance().barTintColor = UIColor(named: "Color")
    }
    
    @State private var showAlert = false
    @State private var currentInfo: ListItem?
    
    var body: some View {
        NavigationStack {
        ZStack(alignment: .top) {
            Color("Color").ignoresSafeArea(.all)
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 16) {
                    ForEach(informacion) { info in
                        Button(action: {
                            currentInfo = info
                            showAlert = true
                        }) {
                            VStack(alignment: .leading, spacing: 15) {
                                Text(info.name)
                                    .font(.headline)
                                    .padding(.top)
                                Text("\(info.descuentos)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                
                                HStack(spacing: 15) {
                                    IconLinkView(iconName: "phone.circle.fill", iconColor: .green, text: "Telefono")
                                    IconLinkView(iconName: "paperplane.fill", iconColor: .blue, text: "Correo")
                                    IconLinkView(iconName: "link", iconColor: .gray, text: "Web")
                                }
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color("Color"))
                            .cornerRadius(12)
                            .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 5)
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Hoteleria Convenida")
            .navigationBarTitleDisplayMode(.inline)
            .actionSheet(isPresented: $showAlert) {
                ActionSheet(title: Text(currentInfo?.name ?? "Acciones"), buttons: [
                    .default(Text("Llamar"), action: {
                        if let phone = currentInfo?.phone {
                            openURL(phone)
                        }
                    }),
                    .default(Text("Enviar Correo"), action: {
                        if let mail = currentInfo?.mail {
                            openURL(mail)
                        }
                    }),
                    .default(Text("Visitar Sitio Web"), action: {
                        if let web = currentInfo?.web {
                            openURL(web.absoluteString)
                        }
                    }),
                    .cancel(Text("Cancelar"))
                ])
            }
        }
    }
    
    func openURL(_ urlString: String) {
        if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    struct IconLinkView: View {
        let iconName: String
        let iconColor: Color
        let text: String
        
        var body: some View {
            HStack {
                Image(systemName: iconName)
                    .foregroundColor(iconColor)
                    .padding(.all, 10)
                    .background(Color("Color"))
                    .cornerRadius(8)
                Text(text)
                    .font(.footnote)
            }
            .foregroundColor(.primary)
        }
    }
}


struct Hoteleria_Previews: PreviewProvider {
    static var previews: some View {
        Hoteleria()
    }
}

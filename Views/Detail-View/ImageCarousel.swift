//
//  ImageCarouse.swift
//  Definitiva
//
//  Created by Luciano Nicolini on 30/10/2023.
//

import SwiftUI

struct ImageCarousel: View {
    var landmark: Model
    
    func setupAppearanceForPager() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .orange
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.white.withAlphaComponent(0.9)
    }
    
    var body: some View {
        TabView {
            ForEach(landmark.gallery, id: \.self) { imageName in
                Image(imageName)
                    .resizable()
                    //.scaledToFill()
                    .aspectRatio(contentMode: .fill)
                    .shadow(radius: 4)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        //efecto CustomShape
        .clipShape(CustomShape(corner: .bottomLeft, radii: 35))
        .onAppear {
            setupAppearanceForPager()
        }
    }
}

#Preview {
    ImageCarousel(landmark: ModelData().landmarks[0])
}

//efecto CustomShape
struct CustomShape: Shape {
    var corner: UIRectCorner
    var radii: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radii, height: radii))
     
        return Path(path.cgPath)
    }
}

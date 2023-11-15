//
//  Video.swift
//  Definitiva
//
//  Created by Luciano Nicolini on 03/11/2023.
//

import SwiftUI
import AVKit

struct Video: View {
    let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource:"beneficios", ofType: "mp4")!))
    @State private var isPlaying = false
    
    var body: some View {
        ZStack {
            VideoPlayer(player: player)
                .cornerRadius(10)
                .aspectRatio(16/9, contentMode: .fit)
                //.padding()
            
            // Icono de play superpuesto
            if !isPlaying {
                Image(systemName: "play.circle.fill")
                    .resizable()
                    .foregroundStyle(Color.white.opacity(0.7))
                    .frame(width: 70, height: 70)
                    .contentTransition(.symbolEffect(.replace))
                    .onTapGesture {
                        isPlaying.toggle()
                        player.play()
                    }
            }
        }
        
        .onAppear() {
            // El video ya no se reproduce automáticamente cuando se carga la vista.
            setupVideoPlaybackObserver()
        }
        .onDisappear() {
            player.pause()
        }
    }
    
    func setupVideoPlaybackObserver() {
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) { _ in
            isPlaying = false
            player.seek(to: .zero)  // Regresa el video al inicio
        }
    }
}

#Preview {
    Video()
}

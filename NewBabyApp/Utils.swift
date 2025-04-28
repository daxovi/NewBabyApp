//
//  Utils.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 17.10.2024.
//
import SwiftUI
import AVKit

func getImage(imageName: String) -> Image? {
    let supportedExtensions = ["png", "jpg", "jpeg"]
    
    for ext in supportedExtensions {
        if let filePath = Bundle.main.path(forResource: imageName, ofType: ext) {
            if let uiImage = UIImage(contentsOfFile: filePath) {
                return Image(uiImage: uiImage)
            } else {
                print("Obrázek \(imageName).\(ext) nebyl načten.")
            }
        }
    }
    
    print("Obrázek \(imageName) nebyl nalezen v podporovaných formátech.")
    return nil
}

func getVideo(videoName: String) -> (AVPlayer, AVPlayerViewControllerRepresentedView?)? {
    if let filePath = Bundle.main.path(forResource: videoName, ofType: "mp4") {
        let player = AVPlayer(url: URL(fileURLWithPath: filePath))
        let playerView = AVPlayerViewControllerRepresentedView(player: player)
        return (player, playerView)
    } else {
        print("Cesta k souboru \(videoName) nebyla nalezena.")
    }
    return nil
}

struct AVPlayerViewControllerRepresentedView: UIViewControllerRepresentable {
    let player: AVPlayer

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        player.play()
        return controller
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        // Aktualizace controlleru pokud je to potřeba
    }
}

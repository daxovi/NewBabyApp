//
//  VideoPlayer.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 06.01.2025.
//

import SwiftUI
import AVKit
import UIKit

struct VideoPlayerFullscreen: UIViewControllerRepresentable {
    let videoURL: URL

    func makeUIViewController(context: Context) -> UIViewController {
        let player = AVPlayer(url: videoURL)
        let playerViewController = CustomAVPlayerViewController()
        playerViewController.player = player
        playerViewController.modalPresentationStyle = .fullScreen

        // Nastavení callbacku při zavření

        // Prezentujeme přehrávač na celou obrazovku
        let rootViewController = UIViewController()
        rootViewController.view.backgroundColor = .clear
        rootViewController.modalPresentationStyle = .fullScreen

        DispatchQueue.main.async {
            rootViewController.present(playerViewController, animated: true) {
                player.play()
            }
        }
        return rootViewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Coordinator {}

    class CustomAVPlayerViewController: AVPlayerViewController {
        var onDismiss: (() -> Void)?

        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)

            if isBeingDismissed || isMovingFromParent {
                onDismiss?()
            }
        }
    }
}

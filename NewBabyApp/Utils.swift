//
//  Utils.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 17.10.2024.
//
import SwiftUI

func getImage(imageName: String) -> Image? {
    // Získání cesty k souboru uvnitř balíčku aplikace
    if let filePath = Bundle.main.path(
        forResource: imageName, ofType: "jpg")
    {
        if let uiImage = UIImage(contentsOfFile: filePath) {
            return Image(uiImage: uiImage)
        } else {
            print("Obrázek \(imageName) nebyl nalezen.")
        }
    } else {
        print("Cesta k souboru \(imageName) nebyla nalezena.")
    }

    return nil
}

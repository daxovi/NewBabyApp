//
//  Collection+safe.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 13.06.2025.
//
import Foundation

extension Collection {
  subscript(safe index: Index) -> Element? {
    return indices.contains(index) ? self[index] : nil
  }
}

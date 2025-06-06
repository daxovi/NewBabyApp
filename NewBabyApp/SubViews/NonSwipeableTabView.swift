//
//  NoSwipeAbleTabView.swift
//  NewBabyApp
//
//  Created by Dalibor Janeček on 06.06.2025.
//

import SwiftUI

struct NonSwipeableTabView<Content: View>: UIViewControllerRepresentable {
    let selectedIndex: Binding<Int>
    let views: [Content]

    init(selectedIndex: Binding<Int>, @ViewBuilder content: () -> [Content]) {
        self.selectedIndex = selectedIndex
        self.views = content()
    }

    func makeUIViewController(context: Context) -> UIPageViewController {
        let controller = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        controller.dataSource = nil
        controller.delegate = context.coordinator

        // Disable swipe gesture
        controller.view.subviews.compactMap { $0 as? UIScrollView }.first?.isScrollEnabled = false

        context.coordinator.controllers = views.map { UIHostingController(rootView: $0) }
        if let first = context.coordinator.controllers[safe: selectedIndex.wrappedValue] {
            controller.setViewControllers([first], direction: .forward, animated: true)
        }

        return controller
    }

    func updateUIViewController(_ uiViewController: UIPageViewController, context: Context) {
        if let controller = context.coordinator.controllers[safe: selectedIndex.wrappedValue] {
            uiViewController.setViewControllers([controller], direction: .forward, animated: false)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UIPageViewControllerDelegate {
        var parent: NonSwipeableTabView
        var controllers: [UIViewController] = []

        init(_ parent: NonSwipeableTabView) {
            self.parent = parent
        }
    }
}

// Safe access
extension Collection {
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}

//
//  PageViewController.swift
//  landmarks
//
//  Created by Vincent Cloutier on 2021-12-12.
//


import SwiftUI
import UIKit

// The page view controller stores an array of Page instances, which must be a type of View. These are the pages you use to scroll between landmarks.
struct PageViewController<Page: View>: UIViewControllerRepresentable {
    var pages: [Page]

// SwiftUI calls this method a single time when it’s ready to display the view, and then manages the view controller’s life cycle.
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)

        return pageViewController
    }

// create the UIHostingController that hosts the page SwiftUI view on every update.
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [UIHostingController(rootView: pages[0])], direction: .forward, animated: true)
    }
}

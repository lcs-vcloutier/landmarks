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
    @Binding var currentPage: Int
    
    // SwiftUI calls this makeCoordinator() method before makeUIViewController(context:), so that you have access to the coordinator object when configuring your view controller.
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // SwiftUI calls this method a single time when it’s ready to display the view, and then manages the view controller’s life cycle.
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        
        return pageViewController
    }
    
    // create the UIHostingController that hosts the page SwiftUI view on every update.
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [context.coordinator.controllers[currentPage]], direction: .forward, animated: true)
    }
    
    // A SwiftUI view that represents a UIKit view controller can define a Coordinator type that SwiftUI manages and provides as part of the representable view’s context.
    //SwiftUI manages the UIViewControllerRepresentable type’s coordinator, and provides it as part of the context when calling the methods you created above.
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        var parent: PageViewController
        var controllers = [UIViewController]()
        
        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            controllers = parent.pages.map { UIHostingController(rootView: $0) }
        }
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerBefore viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                return controllers.last
            }
            return controllers[index - 1]
        }
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerAfter viewController: UIViewController) -> UIViewController?
        {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == controllers.count {
                return controllers.first
            }
            return controllers[index + 1]
        }
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            didFinishAnimating finished: Bool,
            previousViewControllers: [UIViewController],
            transitionCompleted completed: Bool) {
                if completed,
                   let visibleViewController = pageViewController.viewControllers?.first,
                   let index = controllers.firstIndex(of: visibleViewController) {
                    parent.currentPage = index
                }
            }
    }
}

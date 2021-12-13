//
//  landmarksApp.swift
//  WatchLandmarks WatchKit Extension
//
//  Created by Vincent Cloutier on 2021-12-12.
//

import SwiftUI

@main
struct landmarksApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}

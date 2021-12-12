//
//  ContentView.swift
//  landmarks
//
//  Created by Vincent Cloutier on 2021-12-09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())

    }
}

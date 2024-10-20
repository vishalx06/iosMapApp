//
//  MapAppApp.swift
//  MapApp
//
//  Created by Vishal Sharma on 31/08/24.
//

import SwiftUI

@main
struct MapAppApp: App {
    
    @StateObject private var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationView()
                .environmentObject(vm)
        }
    }
    
}

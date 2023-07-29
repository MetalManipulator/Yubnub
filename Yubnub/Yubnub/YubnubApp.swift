//
//  YubnubApp.swift
//  Yubnub
//
//  Created by Levi Gustin on 7/25/23.
//

import SwiftUI

@main
struct YubnubApp: App {
    var listViewModel = ListView.ViewModel()

    var body: some Scene {
        WindowGroup {
            ListView(viewModel: listViewModel)
        }
    }
}

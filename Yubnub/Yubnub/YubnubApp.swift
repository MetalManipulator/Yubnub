//
//  YubnubApp.swift
//  Yubnub
//
//  Created by Levi Gustin on 7/25/23.
//

import SwiftUI

@main
struct YubnubApp: App {
    var body: some Scene {
        WindowGroup {
            ListView(viewModel: .init())
        }
    }
}

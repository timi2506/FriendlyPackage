//
//  Example.swift
//
//  Created by Tim on 09.05.25.
//

import SwiftUI
import FriendlyPackage

struct FriendlyPackageExample: View {
    init() {
        initializeFriendlyService()
    }
    var body: some View {
        NavigationStack {
            VStack {
                Button("Restart App") {
                    restartApp()
                }
                Button("Open Messages") {
                    openApp("com.apple.MobileSMS")
                }
            }
            .padding()
        }
    }
}

#Preview {
    FriendlyPackageExample()
}

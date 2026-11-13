//
//  Identity_PocketApp.swift
//  Identity-Pocket
//
//  Created by karmic on 11/8/26.
//

import SwiftUI

@main
struct Identity_PocketApp: App {
  @State private var walletSession = WalletSession()

  var body: some Scene {
    WindowGroup {
      Group {
        switch walletSession.state {
        case .idle, .loading:
          ProgressView("Preparing wallet…")
        case .ready:
          ContentView()
            .environment(walletSession)
        case .failed(let message):
          VStack(spacing: 16) {
            Text(message)
            Button("Retry") {
              walletSession.initialize()
            }
          }
          .padding()
        }
      }
      .task {
        walletSession.initialize()
      }
    }
  }
}

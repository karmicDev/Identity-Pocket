//
//  Identity_PocketApp.swift
//  Identity-Pocket
//
//  Created by karmic on 11/8/26.
//

import SwiftUI
import EudiWalletKit

@main
struct Identity_PocketApp: App {
  @State private var walletSession = WalletSession()
  
  var body: some Scene {
    WindowGroup {
      Group {
        if walletSession.wallet != nil {
          ContentView()
            .environment(walletSession)
        } else if let message = walletSession.errorMessage {
          VStack(spacing: 16) {
            Text(message)
            
            Button("Retry") {
              walletSession.initialize()
            }
          }
          .padding()
        } else {
          ProgressView("Preparing wallet…")
        }
      }
      .task {
        walletSession.initialize()
      }
    }
  }
}

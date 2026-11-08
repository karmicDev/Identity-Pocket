//
//  ContentView.swift
//  Identity-Pocket
//
//  Created by karmic on 11/8/26.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    TabView {
      Tab(WalletTab.wallet.title, systemImage: WalletTab.wallet.systemImage) {
        WalletView()
      }
      Tab(WalletTab.activity.title, systemImage: WalletTab.activity.systemImage) {
        ActivityView()
      }
      Tab(WalletTab.settings.title, systemImage: WalletTab.settings.systemImage) {
        SettingsView()
      }
    }
  }
}

#Preview {
  ContentView()
}

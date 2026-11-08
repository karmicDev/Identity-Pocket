//
//  WalletView.swift
//  Identity-Pocket
//
//  Created by karmic on 11/8/26.
//

import SwiftUI

struct WalletView: View {
  var body: some View {
    NavigationStack {
      VStack {
        Text("Demo wallet")
          .font(.caption)
          .foregroundStyle(.secondary)

        ContentUnavailableView(
          "No credentials yet",
          systemImage: "wallet.bifold",
          description: Text(
            "Add a demo credential to get started."
          )
        )
      }
      .navigationTitle("Your wallet")
    }
  }
}

#Preview {
  WalletView()
}

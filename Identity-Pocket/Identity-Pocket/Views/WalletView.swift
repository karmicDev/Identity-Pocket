//
//  WalletView.swift
//  Identity-Pocket
//
//  Created by karmic on 11/8/26.
//

import SwiftUI

struct WalletView: View {
  @State private var credential: DemoCredential?

  var body: some View {
    NavigationStack {
      VStack {
        Text("Demo wallet")
          .font(.caption)
          .foregroundStyle(.secondary)

        if let credential = credential {
          List {
            NavigationLink {
              CredentialDetailView(credential: credential)
            } label: {
              VStack(alignment: .leading) {
                Text("Demo age credential")

                Text(credential.issuerName)
                  .font(.subheadline)
                  .foregroundStyle(.secondary)
              }
            }
          }
        } else {
          ContentUnavailableView(
            "No credentials yet",
            systemImage: "wallet.bifold",
            description: Text(
              "Add a demo credential to get started."
            )
          )
        }
      }
      .navigationTitle("Your wallet")
      .toolbar {
        ToolbarItem(placement: .automatic) {
          Button("Add demo credential") {
            credential = DemoCredential.demoCredential
          }
          .disabled(credential != nil)
        }
      }
    }
  }
}

#Preview {
  WalletView()
}

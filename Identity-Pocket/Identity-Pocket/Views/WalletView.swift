//
//  WalletView.swift
//  Identity-Pocket
//
//  Created by karmic on 11/8/26.
//

import SwiftUI
import WalletStorage

struct WalletView: View {
  @Environment(WalletSession.self) private var walletSession

  var body: some View {
    NavigationStack {
      Group {
        if let error = walletSession.documentLoadError {
          ContentUnavailableView {
            Label("Credentials unavailable", systemImage: "exclamationmark.triangle")
          } description: {
            Text(error)
          } actions: {
            Button("Retry") { Task { await walletSession.loadDocuments() } }
          }
        } else if walletSession.documents.isEmpty {
          if walletSession.isLoadingDocuments {
            ProgressView("Loading credentials…")
          } else {
            ContentUnavailableView(
              "No credentials yet",
              systemImage: "wallet.bifold",
              description: Text("Credentials you receive from an issuer will appear here.")
            )
          }
        } else {
          List(walletSession.documents) { document in
            VStack(alignment: .leading) {
              Text(document.displayName ?? document.docType)
              Text(String(describing: document.docDataFormat))
                .font(.subheadline)
                .foregroundStyle(.secondary)
            }
          }
        }
      }
      .navigationTitle("Your wallet")
    }
    .task { await walletSession.loadDocuments() }
  }
}

#Preview {
  WalletView()
    .environment(WalletSession())
}

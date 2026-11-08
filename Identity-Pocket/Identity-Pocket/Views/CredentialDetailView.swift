//
//  CredentialDetailView.swift
//  Identity-Pocket
//
//  Created by karmic on 11/8/26.
//

import SwiftUI

struct CredentialDetailView: View {
  let credential: DemoCredential

  var body: some View {
    Form {
      Section("Credential") {
        LabeledContent(
          "Issuer",
          value: credential.issuerName
        )

        LabeledContent(
          "Over 18",
          value: credential.ageOver18 ? "Yes" : "No"
        )

        LabeledContent(
          "Expires",
          value: credential.expiresAt.formatted(
            date: .abbreviated,
            time: .shortened
          )
        )
      }

      Section {
        Text("Fictional demo data. Not verified.")
          .foregroundStyle(.secondary)
      }
    }
    .navigationTitle("Credential details")
  }
}

#Preview {
  NavigationStack {
    CredentialDetailView(credential: DemoCredential.demoCredential)
  }
}

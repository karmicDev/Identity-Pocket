//
//  WalletSession.swift
//  Identity-Pocket
//
//  Created by karmic on 11/8/26.
//

import Foundation
import EudiWalletKit
import Observation
import WalletStorage

@MainActor
@Observable

final class WalletSession {
  private(set) var wallet: EudiWallet?
  private(set) var errorMessage: String?
  private(set) var documents: [WalletStorage.Document] = []
  private(set) var isLoadingDocuments = false
  private(set) var documentLoadError: String?
  
  func initialize() {
    guard wallet == nil else { return }

    do {
      wallet = try WalletFactory.makeWallet()
      errorMessage = nil
    } catch {
      errorMessage = "Failed to create wallet."
    }
  }

  func loadDocuments() async {
    guard let wallet, !isLoadingDocuments else { return }

    isLoadingDocuments = true
    documentLoadError = nil
    defer { isLoadingDocuments = false }

    do {
      documents = try await wallet.loadDocuments(
        status: .issued
      ) ?? []
    } catch {
      documentLoadError = "Could not load stored credentials."
    }
  }
}


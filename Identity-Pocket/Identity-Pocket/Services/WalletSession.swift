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
import OSLog

@MainActor
@Observable
final class WalletSession {
  enum State {
    case idle
    case loading
    case ready(EudiWallet)
    case failed(message: String)
  }

  private(set) var state: State = .idle
  private(set) var documents: [WalletStorage.Document] = []
  private(set) var documentLoadError: String?
  private(set) var isLoadingDocuments = false

  private let logger = Logger(subsystem: "de.karmic.Identity-Pocket", category: "WalletSession")

  var wallet: EudiWallet? {
    if case .ready(let wallet) = state { return wallet }
    return nil
  }

  func initialize() {
    switch state {
    case .ready, .loading: return
    case .idle, .failed: break
    }

    state = .loading

    do {
      state = .ready(try WalletFactory.makeWallet())
    } catch {
      logger.error("Wallet setup failed: \(String(describing: error), privacy: .public)")
      state = .failed(message: "The wallet could not be set up.")
    }
  }

  func loadDocuments() async {
    guard let wallet, !isLoadingDocuments else { return }

    isLoadingDocuments = true
    documentLoadError = nil
    defer { isLoadingDocuments = false }

    do {
      documents = try await wallet.loadDocuments(status: .issued) ?? []
    } catch {
      logger.error("Loading documents failed: \(String(describing: error), privacy: .public)")
      documentLoadError = "Could not load stored credentials."
    }
  }
}

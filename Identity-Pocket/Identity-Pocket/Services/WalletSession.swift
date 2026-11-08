//
//  WalletSession.swift
//  Identity-Pocket
//
//  Created by karmic on 11/8/26.
//

import Foundation
import EudiWalletKit
import Observation

@MainActor
@Observable

final class WalletSession {
  private(set) var wallet: EudiWallet?
  private(set) var errorMessage: String?
  
  func initialize() {
    guard wallet == nil else { return }
    
    do {
      wallet = try WalletFactory.makeWallet()
      errorMessage = nil
    } catch {
      errorMessage = "Failed to create wallet."
    }
  }
}


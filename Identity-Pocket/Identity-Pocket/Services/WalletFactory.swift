//
//  WalletFactory.swift
//  Identity-Pocket
//
//  Created by karmic on 11/8/26.
//

import Foundation
import EudiWalletKit
import MdocSecurity18013

enum WalletFactory {
  static func makeWallet() throws -> EudiWallet {
    let configuration = EudiWalletConfiguration(
      serviceName: "de.karmic.Identity-Pocket.wallet",
      userAuthenticationRequired: true
    )
    let trustConfiguration = TrustConfiguration(
      trustSource: .etsi(.eudiRef)
    )

    return try EudiWallet(
      eudiWalletConfig: configuration,
      trustConfig: trustConfiguration
    )
  }
}

//
//  Identity_PocketTests.swift
//  Identity-PocketTests
//
//  Created by karmic on 11/8/26.
//

import Foundation
import Testing

@testable import Identity_Pocket

struct Identity_PocketTests {
  private let credential: DemoCredential

  init() throws {
    let expirationDate = try Date(
      "2030-01-15T12:00:00Z",
      strategy: .iso8601
    )

    credential = DemoCredential(
      id: UUID(),
      issuerName: "Demo Issuer",
      ageOver18: true,
      expiresAt: expirationDate
    )
  }

  @Test func oneSecondBeforeExpiration() {
    let date = credential.expiresAt.addingTimeInterval(-1)

    #expect(!credential.isExpired(at: date))
  }

  @Test func exactlyAtExpiration() {
    #expect(credential.isExpired(at: credential.expiresAt))
  }

  @Test func oneSecondAfterExpiration() {
    let date = credential.expiresAt.addingTimeInterval(1)

    #expect(credential.isExpired(at: date))
  }
}

//
//  DemoCredential.swift
//  Identity-Pocket
//
//  Created by karmic on 11/8/26.
//

import Foundation

struct DemoCredential: Identifiable {
  let id: UUID
  let issuerName: String
  let ageOver18: Bool
  let expiresAt: Date

  func isExpired(at date: Date) -> Bool {
    date >= expiresAt
  }
}

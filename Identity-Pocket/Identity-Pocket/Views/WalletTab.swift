//
//  WalletTab.swift
//  Identity-Pocket
//
//  Created by karmic on 11/8/26.
//

enum WalletTab: Hashable {
  case wallet
  case activity
  case settings
  
  var title: String {
    switch self {
    case .activity: return "Activity"
    case .settings: return "Settings"
    case .wallet: return "Your wallet"
    }
  }
  
  var systemImage: String {
    switch self {
    case .activity: return "clock.arrow.circlepath"
    case .settings: return "gearshape"
    case .wallet: return "wallet.bifold"
    }
  }
}

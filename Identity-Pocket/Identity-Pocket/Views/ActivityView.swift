//
//  ActivityView.swift
//  Identity-Pocket
//
//  Created by karmic on 11/8/26.
//

import SwiftUI

struct ActivityView: View {
  var body: some View {
    NavigationStack {
      Text("Your sharing activity will appear here.")
        .padding()
        .navigationTitle("Activity")
    }
  }
}

#Preview {
  ActivityView()
}

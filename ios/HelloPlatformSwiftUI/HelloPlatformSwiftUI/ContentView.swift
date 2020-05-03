//
//  ContentView.swift
//  HelloPlatformSwiftUI
//
//  Created by James Shvarts on 5/3/20.
//  Copyright © 2020 James Shvarts. All rights reserved.
//

import SwiftUI
import common

struct ContentView: View {
    var body: some View {
      Text(CommonKt.createApplicationScreenMessage())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

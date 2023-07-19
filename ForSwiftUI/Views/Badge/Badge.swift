//
//  Badge.swift
//  ForSwiftUI
//
//  Created by Kevin on 2023/7/19.
//

import SwiftUI

struct Badge: View {
    var body: some View {
        ScrollView(.vertical) {
            Spacer()
            Text("Awesome")
        }
        .navigationTitle("Awesome Badge")
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}

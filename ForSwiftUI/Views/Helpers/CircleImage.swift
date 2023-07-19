//
//  CircleImage.swift
//  ForSwiftUI
//
//  Created by Kevin on 2023/7/19.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        if #available(iOS 15.0, *) {
            image
                .frame(width: 160.0, height: 160.0)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.white, lineWidth: 6.0)
                }
                .shadow(radius: 8)
        } else {
            image
                .clipShape(Circle())
                .shadow(radius: 8)
        }
    }
}

//struct CircleImage_Previews: PreviewProvider {
//    static var previews: some View {
//        CircleImage(image: Image("liandang"))
//    }
//}

//
//  ImagePlaceholderView.swift
//  ITunes Client App
//
//  Created by Ehlullah Karakurt on 9.10.2022.
//

import SwiftUI

struct ImagePlaceholderView: View {
    var body: some View {
        Rectangle()
            .fill(Color("GrayColor"))
            .frame(width: 90, height: 100)
    }
}

struct ImagePlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePlaceholderView()
    }
}

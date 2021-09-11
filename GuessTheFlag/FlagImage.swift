//
//  FlagImage.swift
//  GuessTheFlag
//
//  Created by Евгений Кириллов on 11.09.2021.
//

import SwiftUI

struct FlagImage: View {
    let imageName: String
    
    var body: some View {
        Image(imageName)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(color: .primary, radius: 10)
    }
}

struct FlagImage_Previews: PreviewProvider {
    static var previews: some View {
        FlagImage(imageName: "France")
    }
}

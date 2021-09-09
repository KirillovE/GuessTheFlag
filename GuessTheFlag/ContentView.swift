//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Евгений Кириллов on 09.09.2021.
//

import SwiftUI

struct ContentView: View {
    private var countries = [
        "Estonia",
        "France",
        "Germany",
        "Ireland",
        "Italy",
        "Nigeria",
        "Poland",
        "Russia",
        "Spain",
        "UK",
        "US"
    ]
    private var correctAnswer = Int.random(in: 0 ... 2)
    
    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of...")
                    Text(countries[correctAnswer])
                }
                .foregroundColor(.white)
                
                ForEach(0 ..< 3) { number in
                    Button {
                        // flag was tapped
                    } label: {
                        Image(self.countries[number])
                            .renderingMode(.original)
                    }
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

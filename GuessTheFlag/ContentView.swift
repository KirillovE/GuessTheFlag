//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Евгений Кириллов on 09.09.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = [
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
    ].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0 ... 2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [.clear, .accentColor]),
                startPoint: .top,
                endPoint: .bottom
            ).ignoresSafeArea()
            
            VStack(spacing: 30) {
                Spacer()
                
                VStack {
                    Text("Tap the flag of...")
                    Text(countries[correctAnswer])
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                .foregroundColor(.primary)
                
                ForEach(0 ..< 3) { number in
                    Button {
                        flagTapped(number)
                    } label: {
                        Image(self.countries[number])
                            .renderingMode(.original)
                    }
                    .clipShape(Capsule())
                    .shadow(color: .primary, radius: 10)
                    
                }
                
                Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(
                title: Text(scoreTitle),
                message: Text("Your score is ???"),
                dismissButton: .default(Text("Continue"), action: askQuestion)
            )
        }
    }
    
    private func flagTapped(_ number: Int) {
        number == correctAnswer
            ? (scoreTitle = "Correct")
            : (scoreTitle = "Wrong")
        
        showingScore = true
    }
    
    private func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

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
    @State private var currentScore = 0
    
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
                
                Text("Current score is \(currentScore)")
                
                Spacer()
            }
            .foregroundColor(.primary)
        }
        .alert(isPresented: $showingScore) {
            Alert(
                title: Text(scoreTitle),
                message: Text("Your score is \(currentScore)"),
                dismissButton: .default(Text("Continue"), action: askQuestion)
            )
        }
    }
    
    private func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            currentScore += 1
        } else {
            scoreTitle = "Wrong"
        }
        
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
        ContentView()
            .preferredColorScheme(.dark)
    }
}

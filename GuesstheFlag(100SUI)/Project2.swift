//
//  Project2.swift
//  GuesstheFlag(100SUI)
//
//  Created by Artem on 18.07.2023.
//

import SwiftUI

struct Project2: View {
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    @State private var round  = 0
    @State private var gameOver: Bool = false
    
    var body: some View {
        ZStack {
            //            LinearGradient(gradient: Gradient(colors: [.blue,.black]), startPoint: .top, endPoint: .bottom)
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.35)],
                           center: .top, startRadius: 200, endRadius: 700).opacity(0.9)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                VStack(spacing: 15) {
                    VStack{
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(.secondary)
                        Text(countries[correctAnswer])
                            .foregroundColor(.white)
                            .font(.largeTitle.weight(.semibold))
                    }
                    ForEach(0..<3) { number in
                        Button {
                            
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .cornerRadius(11)
                                .shadow(radius: 5)
                                .onTapGesture {
                                    flagTapped(number)
                                }
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                //.background(.ultraThinMaterial).opacity(0.2)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                Spacer()
                Spacer()
                
              Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                Spacer()
            }
            .padding()
            .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: askQuestion)
            } message: {
                Text("Your score is \(score)")
            }
            .alert(scoreTitle + "\n Game over!", isPresented: $showingScore) {
                Button("Reset", action: reset)
            } message: {
                Text("Your score is \(score)")
            }
            .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: askQuestion)
            } message: {
                Text("Your score is \(score)")
            }
            .alert(scoreTitle + "\n Game over!", isPresented: $showingScore) {
                Button("Reset", action: reset)
            } message: {
                Text("Your score is \(score)")
            }
        }
     
     
      //  .background(.ultraThinMaterial)
        
    }
       
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])!"
            score -= 1
        }
        round += 1
        if round == 8 {
            gameOver = true
        } else {
            showingScore = true
        }
    }
    
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func reset() {
        score = 0
        askQuestion()
    }
}

struct Project2_Previews: PreviewProvider {
    static var previews: some View {
        Project2()
    }
}

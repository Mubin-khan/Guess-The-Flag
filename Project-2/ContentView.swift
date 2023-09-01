//
//  ContentView.swift
//  Project-2
//
//  Created by Mubin Khan on 9/1/23.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var currectAnswer = Int.random(in: 0...2)
    @State private var showAlert : Bool = false
    @State private var title : String = ""
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: .blue, location: 0.3),
                .init(color: .red, location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                VStack (spacing: 15) {
                    VStack {
                        VStack(spacing: 5) {
                            Text("Tap the Flag of")
                                .foregroundColor(.secondary)
                                .font(.subheadline.weight(.bold))
                            Text("\(countries[currectAnswer])")
                                .foregroundColor(.black)
                                .font(.largeTitle.weight(.semibold))
                        }
                        
                        ForEach(0..<3){ number in
                            Button {
                                callAlert(number: number)
                            } label : {
                                Image(countries[number].lowercased())
                                    .renderingMode(.original)
                                    .clipShape(Capsule())
                                    .shadow(radius: 5)
                                    .padding(5)
                                    
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(.regularMaterial)
                    .cornerRadius(10)
                    
                    .alert(title, isPresented: $showAlert) {
                        Button("OK", role: .cancel) {
                            askQuestion()
                        }
                    }
                }
                
                Spacer()
                Spacer()
                
                Text("Score ???")
                    .font(.title.weight(.semibold))
                    .foregroundColor(.white)
                Spacer()
            }
            .padding()
        }
    }
    
    func callAlert(number : Int) {
        if number == currectAnswer {
            title = "correct"
        }else {
            title = "Wrong"
        }
        showAlert = true
    }
    
    func askQuestion() {
        countries.shuffle()
        currectAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  GuesstheFlag(100SUI)
//
//  Created by Artem on 18.07.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    var body: some View {
        ZStack {
            AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue,.purple,.red]), center: .center)
            VStack {
                Text("Нюселенок!❤️")
                    .foregroundStyle(.secondary)
                    .padding(20)
                    .background(.ultraThinMaterial)
                Button("Button 1") {
                }
                .buttonStyle(.bordered)
                Button("Button 2", role: .destructive) {
                }
                .buttonStyle(.bordered)
                Button("Button 3") {
                }
                .buttonStyle(.borderedProminent)
                .buttonStyle(.bordered)
                .tint(.green)
                Button("Button 3", role: .destructive) {
                }
                .buttonStyle(.borderedProminent)
                Button {
                    
                } label: {
                    Text("Tap me")
                        .padding(10)
                        .foregroundColor(.white)
                        .background(.purple).cornerRadius(20)
                }
                
                Button {
                    print("Edit button was tapped")
                }label: {
                    Label ("Edit", systemImage: "pencil")
                        .padding()
                        .background(.ultraThinMaterial).cornerRadius(10)
                    
                }
                Button {
                    showingAlert = true
                }label: {
                    Label ("Show Alert!", systemImage: "pencil")
                        .padding()
                        .background(.ultraThinMaterial).cornerRadius(10)
                    
                }
            
                    
                }
            .alert("Imortant message", isPresented: $showingAlert) {
                Button("OK") {}
                Button("Delete", role: .destructive) {}
                Button("Cancel", role: .cancel) {}
                Button("Cancel 2") {
                }
            }  message: {
            Text("My new text!")
        }
    }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

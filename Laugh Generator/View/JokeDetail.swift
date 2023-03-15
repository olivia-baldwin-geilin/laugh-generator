//
//  JokeDetail.swift
//  Laugh Generator
//
//  Created by Olivia Baldwin-Geilin on 3/13/23.
//

import SwiftUI

struct JokeDetail: View {
    @State var joke: Joke
    @State var showEnterRating = false
    
    func setRating(rating: Int) {
        self.joke.rating = rating
    }
    
    var body: some View {
        VStack (alignment: .leading, spacing: 10) {
            Text("Joke ID: \(joke.id)")
            Text(joke.body)
                .font(.title2)
                
            HStack {
                Button(action: {
                    self.showEnterRating.toggle()
                }) {
                    Text("Rate This Joke")
                }.sheet(isPresented: $showEnterRating) {
                    EnterRating(joke: joke, rating: joke.rating, updateRating: self.setRating)
                        .presentationDetents([.medium])
                }
                    .buttonStyle(.bordered)
                    
                Spacer()
                    
                Text("\(joke.rating)/5")
                    
                Image(String(joke.rating))
                    .resizable()
                    .frame(width: 40, height: 40)
            }
            
            Spacer()
        }
        .padding()
    }
}

struct JokeDetail_Previews: PreviewProvider {
    static var previews: some View {
        JokeDetail(joke: test_joke)
    }
}

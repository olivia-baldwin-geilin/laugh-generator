//
//  EnterRating.swift
//  Laugh Generator
//
//  Created by Olivia Baldwin-Geilin on 3/13/23.
//

import SwiftUI

struct EnterRating: View {
    var joke: Joke
    @State var rating: Int
    let updateRating: (Int) -> ()
    
    var body: some View {
        VStack {
            Text("Select Rating: ")
                .font(.title2)
            
            
            HStack {
                ForEach(1...5, id: \.self) { number in
                    VStack {
                        Image(String(number))
                            .resizable()
                            .frame(width: 50, height: 50)
                            .background(
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(number == rating ? .gray : .white)
                                        .frame(width: 55, height: 55)
                                        .opacity(0.5)
                                )
                        
                        Text(String(number))
                    }
                    .onTapGesture {
                        rating = number
                        ModelData().updateRating(id: joke.id, rating: rating) { (message) in
                            print(message)
                        }
                        self.updateRating(rating)
                    }
                }
            }
        }
    }
}

struct EnterRating_Previews: PreviewProvider {
    static var previews: some View {
        EnterRating(joke: test_joke, rating: test_joke.rating, updateRating: test_update)
    }
}

//
//  JokeRow.swift
//  Laugh Generator
//
//  Created by Olivia Baldwin-Geilin on 3/10/23.
//

import SwiftUI

struct JokeRow: View {
    var joke: Joke
    
    var body: some View {
        HStack {
            Text(joke.body)
                .font(.title2)
            
            Spacer()
            
            VStack {
                Image(String(joke.rating))
                    .resizable()
                    .frame(width: 40, height: 40)
                
                Text("\(joke.rating)/5")
            }
        }
    }
}

struct JokeRow_Previews: PreviewProvider {
    static var previews: some View {
        JokeRow(joke: test_joke)
    }
}

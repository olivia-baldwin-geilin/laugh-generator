//
//  JokeList.swift
//  Laugh Generator
//
//  Created by Olivia Baldwin-Geilin on 3/10/23.
//

import SwiftUI

struct JokeList: View {
    @State var jokes_list: [Joke]
    
    var body: some View {
        NavigationView {
            List(jokes_list) { joke in
                NavigationLink {
                    JokeDetail(joke: joke)
                } label: {
                    JokeRow(joke: joke)
                }
            }
                .onAppear {
                    ModelData().fetchJokes { (jokes) in
                        DispatchQueue.main.async {
                            self.jokes_list = jokes
                        }
                        
                    }
            }
        }
    }
}

struct JokeList_Previews: PreviewProvider {
    static var previews: some View {
        JokeList(jokes_list: test_joke_list)
    }
}

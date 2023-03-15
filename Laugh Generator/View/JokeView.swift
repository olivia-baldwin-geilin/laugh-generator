//
//  SwiftUIView.swift
//  Laugh Generator
//
//  Created by Olivia Baldwin-Geilin on 3/10/23.
//

import SwiftUI

struct JokeView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Random Joke:")
                .font(.title)
            
            Divider()
            
            Text("Joke body hahahahaha")
        }
        .padding()
    }
}

struct JokeView_Previews: PreviewProvider {
    static var previews: some View {
        JokeView()
    }
}

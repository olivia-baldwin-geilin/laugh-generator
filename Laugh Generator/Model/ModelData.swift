//
//  File.swift
//  Laugh Generator
//
//  Created by Olivia Baldwin-Geilin on 3/10/23.
//

import Foundation

final class ModelData {
    var jokes: [Joke] = []

    var domainString = "http://127.0.0.1:5000"

    func fetchJokes(completionHandler: @escaping ([Joke]) -> Void) {
        let url = URL(string: domainString + "/jokes")!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
            if let error = error {
                print("Error with fetching jokes: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Error with response, unexpected status code: \(response)")
                return
            }
            
            if let data = data,
               let jokeSummary = try? JSONDecoder().decode(JokeSummary.self, from: data) {
                completionHandler(jokeSummary.results ?? [])
            }
        })
        task.resume()
    }
    
    func updateRating(id: String, rating: Int, completionHandler: @escaping (String) -> Void) {
        let url = URL(string: domainString + "/update_rating/\(id)")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
        let json: [String: Any] = [
            "rating": rating
        ]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: {(data, response, error) in
            if let error = error {
                print("Error with fetching jokes: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Error with response, unexpected status code: \(response)")
                return
            }
            
            if let data = data,
               let response = try? JSONDecoder().decode(Response.self, from: data) {
                completionHandler(response.message ?? "")
            }
        })
        task.resume()
    }

}

//
//  APICaller.swift
//  NetflixClone
//
//  Created by  Mukhammed Ali Khamzayev on 08.02.2023.
//

import Foundation

struct Constants {
    static let API_KEY = "fecb6417c2cee1a6737f068830c187e3"
    static let baseURL = "https://api.themoviedb.org"
    static let mainURL = "https://api.themoviedb.org/3/trending/all/day?api_key=fecb6417c2cee1a6737f068830c187e3"
}

enum APIError: Error {
    case failedTogetData
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: Constants.mainURL) else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                completion(.success(results.results))

                print(results.results[0])

//               let results =  try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
//                print(results)
            } catch {
                completion(.failure(error))
            }
            
              
        }
        task.resume()
    }
}

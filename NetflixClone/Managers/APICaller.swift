//
//  APICaller.swift
//  NetflixClone
//
//  Created by  Mukhammed Ali Khamzayev on 08.02.2023.
//

import Foundation

struct Constants {
    static let YoutubeAPI_KEY = "AIzaSyDZMPer8T1Q2N8gzcIc2j0wsFq_8UJaIfM"
    static let API_KEY = "fecb6417c2cee1a6737f068830c187e3"
    static let baseURL = "https://api.themoviedb.org"
    static let YoutubeBaseURL = "https://youtube.googleapis.com/youtube/v3/search?"
    static let mainURL = "https://api.themoviedb.org/3/trending/all/day?api_key=fecb6417c2cee1a6737f068830c187e3"
}

enum APIError: Error {
    case failedTogetData
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))

              //  print(results.results[0])

//               let results =  try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
//                print(results)
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
            
              
        }
        task.resume()
    }
    
    func getTrendingTvs(completion: @escaping (Result<[Title], Error>) -> Void ) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {return}
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
               // completion(.success(results.results))
            } catch {
              //  completion(.failure(error))
                print(APIError.failedTogetData)
            }
        }
        task.resume()
    }
    
    func getUpcomingMovies(completion: @escaping (Result<[Title], Error>) -> Void ) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {return}
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                print(APIError.failedTogetData)
            }
        }
        task.resume()
        
    }
    
    func getPopular(completion: @escaping (Result<[Title], Error>) -> Void ) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {return}
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                print(APIError.failedTogetData)
            }
        }
        task.resume()
        
    }
    
    func getTopRated(completion: @escaping (Result<[Title], Error>) -> Void ) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {return}
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                print(APIError.failedTogetData)
            }
        }
        task.resume()
        
    }
    
    func getDiscoverMovies(completion: @escaping (Result<[Title], Error>) -> Void ) {
        
        /*
         https://api.themoviedb.org/3/discover/movie?api_key=<<api_key>>&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate
         */
        guard let url = URL(string: "\(Constants.baseURL)/3/discover/movie?api_key=\(Constants.API_KEY)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {return}
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                print(APIError.failedTogetData)
            }
        }
        task.resume()
    }
    
    func search(with query: String, completion: @escaping (Result<[Title], Error>) -> Void ) {
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        /*
         https://api.themoviedb.org/3/search/movie?api_key={api_key}&query=Jack+Reacher
         */
        
        guard let url = URL(string: "\(Constants.baseURL)/3/search/movie?api_key=\(Constants.API_KEY)&query=\(query)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {return}
            
            do {
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                print(APIError.failedTogetData)
            }
        }
        task.resume()
        
    }
    
    func getMovie(with query: String, completion: @escaping (Result<VideoElement, Error>) -> Void ) {
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        
        guard let url = URL(string: "\(Constants.YoutubeBaseURL)q=\(query)&key=\(Constants.YoutubeAPI_KEY)") else {return}
        
       
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {return}
            
            do {
                let resutls = try JSONDecoder().decode(YoutubeSearchResponse.self, from: data )
                completion(.success(resutls.items[0]))
                
//                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
//                completion(.success(results.results))
            } catch {
                completion(.failure(error))
                print(error.localizedDescription)
               // print(APIError.failedTogetData)
            }
        }
        task.resume()
    }
    
}

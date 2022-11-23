//
//  NetworkManager.swift
//  NASA
//
//  Created by Юрий Губин on 22.11.2022.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchPicture(completion: @escaping (Result<[Picture], NetworkError>) -> Void) {
        guard let url = URL(string: "https://api.nasa.gov/planetary/apod?start_date=2022-10-20&api_key=DEMO_KEY") else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                completion(.failure(.noData))
                return
            }
            do {
                let pictures = try JSONDecoder().decode([Picture].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(pictures))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
//    func fetchImage(from url: String?, completion: @escaping(Result<Data, NetworkError>) -> Void) {
//        guard let url = URL(string: url ?? "") else {
//            completion(.failure(.invalidURL))
//            return
//        }
//        DispatchQueue.global().async {
//            guard let imageData = try? Data(contentsOf: url) else {
//                completion(.failure(.noData))
//                return
//            }
//            DispatchQueue.main.async {
//                completion(.success(imageData))
//            }
//        }
//    }
    
    
}

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
    
    func fetch<T: Decodable>(_ type: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: "https://api.nasa.gov/planetary/apod?start_date=2022-10-20&api_key=HEtwem4zf5swc3Bng0kauwz4VdtIdE7zgVds3dW4") else {
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
                let pictures = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(pictures))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}

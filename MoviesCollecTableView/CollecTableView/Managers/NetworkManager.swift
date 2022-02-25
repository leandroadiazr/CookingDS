//
//  NetworkManager.swift
//  CollecTableView
//
//  Created by Leandro Diaz on 12/2/20.
//

import UIKit

class NetworkManager {
    
    private init() {}
    let cache = NSCache<NSString, UIImage >()
    public static let shared = NetworkManager()
    var stringURL = "https://www.omdbapi.com/?apikey=4674eb1f&s="
    
    func getData(for field: String, completed: @escaping (Result<Movies, ErrorMessage> ) -> Void) {
        let endPoint = stringURL + field + "&plot=full"
        
        guard let url = URL(string: endPoint) else {
            completed(.failure(.invalidRequest))
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                
                completed(.failure(.invalidRequest))
                return
            }
            
            guard let result = response as? HTTPURLResponse, result.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy =  .iso8601
                
                let receivedData = try decoder.decode(Movies.self, from: data)
                completed(.success(receivedData))
            } catch {
                print(error)
            }
        }
        dataTask.resume()
    }
}





extension JSONDecoder {
    func decode<T: Decodable>(_ type: T.Type, fromURL url: String, completed: @escaping (T)-> Void){
        guard let url = URL(string: url) else {
            fatalError("Invalid url")
        }
        
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy =  .iso8601
                
                
                let receivedData = try self.decode(type, from: data)
                print(receivedData)
                DispatchQueue.main.async {
                    completed(receivedData)
                }
                
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}






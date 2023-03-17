//
//  ApiServices.swift
//  TaskApp
//
//  Created by Secrieru Andrei on 16.03.2023.
//

import Foundation


class ApiServices {
    
    private var dataTask: URLSessionDataTask?

//    typealias CompletionHandler = (Swift.Result<T.Type, Error>)  -> Void

    func getCharacters<T: Codable>(stringURL: String, expected: T.Type, completion: @escaping (Swift.Result<T, Error>) -> Void) {
        guard let url = URL(string: stringURL) else { return }
        
        dataTask = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let response = response as? HTTPURLResponse
            else {
                print("Something goes wrong")
                return }
            
            if response.statusCode == 200 {
                guard let data = data else { return }
                guard let result = parse(data: data) else {
                    print("something wrong")
                    return }
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            }
        })
        
        dataTask?.resume()
        func parse(data: Data) -> T? {
            let decoder = JSONDecoder()
            guard let result = try? decoder.decode(T.self, from: data) else {return nil}
            return result
        }
    }
}

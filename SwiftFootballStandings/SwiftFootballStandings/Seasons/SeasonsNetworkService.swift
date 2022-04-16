//
//  SeasonsNetworkService.swift
//  SwiftFootballStandings
//
//  Created by Yegor Gorskikh on 15.04.2022.
//

import Foundation

final class SeasonsNetworkService {
    
    let seasonsId: String
    
    init(seasonsId: String) {
        self.seasonsId = seasonsId
    }
    
    // MARK: - Internal methods
    
    func getData(completion: @escaping (Result<SeasonsResponse, NetworkResponseError>) -> Void) {

        let stringUrl = "https://api-football-standings.azharimm.site/leagues/\(seasonsId)/seasons"
        
        guard
            let url = URL(string: stringUrl)
        else {
            completion(.failure(.anotherError))
            return
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            
            
            if let error = error {
                completion(.failure(NetworkResponseError.getNetworkResponseError(error)))
                return
            }
            
            guard
                let data = data,
                let response = response as? HTTPURLResponse,
                (200 ..< 300) ~= response.statusCode
            else {
                completion(.failure(.anotherError))
                return
            }
            
            do {
                let response = try JSONDecoder().decode(SeasonsResponse.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(.decodeError))
            }
        }
        task.resume()
    }
    
}

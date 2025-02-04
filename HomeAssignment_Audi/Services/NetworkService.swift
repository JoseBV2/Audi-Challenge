//
//  NetworkService.swift
//  HomeAssignment_Audi
//
//  Created by Jóse Bustamante on 4/02/25.
//

import Alamofire
import Combine

class NetworkService {
    static let shared = NetworkService()
    
    func fetchData<T: Decodable>(from url: String, completion: @escaping (Result<T, Error>) -> Void) {
        AF.request(url)
            .validate()
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let decodedData):
                    completion(.success(decodedData))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}

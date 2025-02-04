//
//  NetworkServiceProtocol.swift
//  HomeAssignment_Audi
//
//  Created by Jóse Bustamante on 4/02/25.
//


import Foundation

protocol NetworkServiceProtocol {
    func fetchData<T: Decodable>(from url: String, completion: @escaping (Result<T, Error>) -> Void)
}

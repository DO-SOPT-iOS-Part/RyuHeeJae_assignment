//
//  WeatherService.swift
//  ProjectDescriptionHelpers
//
//  Created by 류희재 on 2023/11/14.
//

import Foundation

import RxSwift

public protocol URLSessionNetworkService {
    func post<T: Codable>(
        _ data: T,
        url urlString: String,
        headers: [String: String]?
    ) -> Observable<Result<Data, URLSessionNetworkServiceError>>
    func patch<T: Codable>(
        _ data: T,
        url urlString: String,
        headers: [String: String]?
    ) -> Observable<Result<Data, URLSessionNetworkServiceError>>
    func delete(
        url urlString: String,
        headers: [String: String]?
    ) -> Observable<Result<Data, URLSessionNetworkServiceError>>
    func get(
        url urlString: String,
        headers: [String: String]?
    ) -> Observable<Result<Data, URLSessionNetworkServiceError>>
}

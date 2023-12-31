//
//  WeatherService.swift
//  ProjectDescriptionHelpers
//
//  Created by 류희재 on 2023/11/14.
//

import Foundation

import RxSwift

public protocol URLSessionNetworkService {
    init() 
    func request(target: URLSessionTargetType) -> Observable<Result<Data, URLSessionNetworkServiceError>>
}

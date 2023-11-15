//
//  DefaultMainUseCase.swift
//  Domain
//
//  Created by 류희재 on 2023/10/24.
//  Copyright © 2023 hellohidi. All rights reserved.
//

import RxSwift
import RxCocoa

public final class DefaultMainUseCase: MainUseCase {
    
    public var cityList = ["gongju", "gwangju", "gumi", "gunsan", "daegu", "daejeon", "mokpo", "busan", "seosan", "seoul", "sokcho", "suwon", "suncheon", "ulsan", "iksan", "jeonju", "jeju", "cheonan", "cheongju", "chuncheon"]
    public var weatherList = BehaviorRelay<[CurrentWeatherModel]>(value: CurrentWeatherModel.weatherData)
    public let repository: WeatherRepository
    
    public init(repository: WeatherRepository) {
        self.repository = repository
    }
    
    
    public func updateSearchResult(_ text: String) {
        let defaultWeatherList: [CurrentWeatherModel] = CurrentWeatherModel.weatherData
        if text.isEmpty {
            weatherList.accept(defaultWeatherList)
        } else {
            let filteredList = defaultWeatherList.filter { $0.place.contains(text) }
            weatherList.accept(filteredList)
        }
    }
    
    public func getCurrentWeatherData() async throws {
        var updateCurrentWeatherList: [CurrentWeatherModel] = []
        for city in cityList {
            let cityCurrentWeather = try await repository.getCityWeatherData(city: city)
            updateCurrentWeatherList.append(cityCurrentWeather)
        }
        self.weatherList.accept(updateCurrentWeatherList)
    }
}


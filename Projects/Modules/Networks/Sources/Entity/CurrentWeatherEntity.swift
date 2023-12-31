//
//  CurrentWeatherEntity.swift
//  Networks
//
//  Created by 류희재 on 2023/11/15.
//  Copyright © 2023 hellohidi. All rights reserved.
//

import Foundation

public struct CurrentWeatherEntity: Codable {
    let coord: Coord
    public let weather: [Weathers]
    let base: String
    public let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    public let timezone, id: Int
    public let name: String
    let cod: Int
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double
}

// MARK: - Main
public struct Main: Codable {
    public let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int
    let seaLevel, grndLevel: Int?
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case pressure, humidity
    }
}

// MARK: - Sys
struct Sys: Codable {
    let type, id: Int?
    let country: String
    let sunrise, sunset: Int
}

// MARK: - Weather
public struct Weathers: Codable {
    let id: Int
    public let main, description, icon: String
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double?
}

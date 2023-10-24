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
    public var weatherList = BehaviorRelay<[WeatherModel]>(value: WeatherModel.weatherData)
    
    public init() {} // 'DefaultMainUseCase'의 초기화 메서드를 public으로 선언하여 외부 모듈에서 사용 가능하도록 합니다.
}

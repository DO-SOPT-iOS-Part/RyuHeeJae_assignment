//
//  DetailBuilder.swift
//  DetailFeatureInterface
//
//  Created by 류희재 on 7/5/24.
//  Copyright © 2024 Weather-iOS. All rights reserved.
//

import Core
import Domain

import DetailFeatureInterface

public
final class DetailBuilder {
    public var repository: WeatherRepository
    
    public init(repository: WeatherRepository) {
        self.repository = repository
    }
}

extension DetailBuilder: DetailFeatureViewBuildable {
    public func makeMain() -> DetailPresentable {
        let useCase = DefaultMainUseCase(repository: repository)
        let vm = DetailViewModel(mainUseCase: useCase)
        let vc = DetailViewController(viewModel: vm)
        vc.viewModel = vm
        return (vc, vm)
    }
}


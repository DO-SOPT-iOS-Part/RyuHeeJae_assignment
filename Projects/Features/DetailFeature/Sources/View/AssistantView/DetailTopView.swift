//
//  DetailTopView.swift
//  DetailFeature
//
//  Created by 류희재 on 2023/10/25.
//  Copyright © 2023 hellohidi. All rights reserved.
//

import UIKit

import Core
import DSKit
import Domain

import SnapKit
import Then

final class DetailTopView: UIView {
    
    // MARK: - Properties
    
    private let stackView = UIStackView()
    
    let placeLabel = UILabel()
    let temparatureLabel = UILabel()
    let weatherLabel = UILabel()
    let maxmimTemparatureLabel = UILabel()
    
    
    // MARK: - UI Components
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        hieararchy()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Method
    
    private func style() {
        stackView.do {
            $0.axis = .vertical
            $0.distribution = .equalSpacing
            $0.alignment = .center
            $0.spacing = 4
        }
        placeLabel.do {
            $0.textColor = .white
            $0.font = DSKitFontFamily.SFProDisplay.regular.font(size: 36)
        }
        
        temparatureLabel.do {
            $0.textColor = .white
            $0.font = DSKitFontFamily.SFProDisplay.thin.font(size: 102)
        }
        
        weatherLabel.do {
            $0.textColor = .white
            $0.font = DSKitFontFamily.SFProDisplay.regular.font(size: 24)
        }
        
        maxmimTemparatureLabel.do {
            $0.textColor = .white
            $0.font = DSKitFontFamily.SFProDisplay.medium.font(size: 20)
        }
    }
    
    private func hieararchy() {
        self.addSubview(stackView)
        stackView.addArrangedSubViews(
            placeLabel,
            temparatureLabel,
            weatherLabel,
            maxmimTemparatureLabel
        )
    }
    
    private func layout() {
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension DetailTopView {
    func updateUI(_ data: CurrentWeatherModel?) {
        guard let data else { return }
        Task {
            placeLabel.text = data.place
            temparatureLabel.text = "\(Int(data.temparature - 273))°"
            weatherLabel.text = data.weather
            maxmimTemparatureLabel.text = "최고:\(Int(data.maxTemparature - 273))°   최저:\(Int(data.minTemparature - 273))°"
        }
    }
}






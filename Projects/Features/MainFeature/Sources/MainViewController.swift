//
//  MainViewController.swift
//  MainFeature
//
//  Created by 류희재 on 2023/10/23.
//  Copyright © 2023 baegteun. All rights reserved.
//

import UIKit
import Domain

import SnapKit
import Then
import RxSwift
import RxGesture
import RxCocoa

public final class MainViewController : UIViewController {
    
    //MARK: - Properties
    let tapSubject = PublishSubject<Int>()
    
    public let viewModel: MainViewModel
    private let disposeBag = DisposeBag()
    
    let rootView = MainView()
    
    //MARK: - UI Components
    
    //MARK: - Life Cycle
    
    public init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func loadView() {
        self.view = rootView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        bindUI()
        bindViewModel()
    }
    
    private func bindUI() {
        tapSubject.subscribe(with: self, onNext: { owner, index in
            print("와 \(index)번째 터치 인식 성공이다!")
        }).disposed(by: disposeBag)
    }
    
    private func bindViewModel() {
        let input = MainViewModel.Input()
        
        let output = self.viewModel.transform(from: input, disposeBag: disposeBag)
        
        output.weatherList
            .asDriver(onErrorJustReturn: [])
            .drive(with: self, onNext: { owner, weatherList in
                owner.updateUI(weatherList)
            }).disposed(by: disposeBag)
    }
    
    //MARK: - Custom Method
    
    private func updateUI(_ weatherList: [WeatherModel]) {
        (0..<weatherList.count).enumerated().map { index, _ in
            let weatherListView = MainWeatherListView()
            weatherListView.delegate = self
            weatherListView.dataBind(index, weatherList[index])
            return weatherListView
        }.forEach(rootView.weatherView.stackView.addArrangedSubview)
    }
    
    //    private func addLabels() {
    //        (0..<20).enumerated().map { index, _ in
    //            let weatherListView = MainWeatherListView()
    //
    //            // MainWeatherListView에 고유한 태그를 할당합니다.
    //            weatherListView.tag = index
    //
    //            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped(_:)))
    //            weatherListView.isUserInteractionEnabled = true
    //            weatherListView.addGestureRecognizer(tapGesture)
    //            return weatherListView
    //        }
    //        .forEach(rootView.weatherView.stackView.addArrangedSubview)
    //    }
}

extension MainViewController: MainViewWeatherListDelegate {
    func weatherViewDidTap(_ tag: Int) {
        tapSubject.onNext(tag)
    }
}
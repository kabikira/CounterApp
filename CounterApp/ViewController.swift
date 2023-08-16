//
//  ViewController.swift
//  CounterApp
//
//  Created by koala panda on 2023/07/27.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet private weak var countLabel: UILabel!
    @IBOutlet private weak var countUpButton: UIButton!
    @IBOutlet private weak var countDownButton: UIButton!
    @IBOutlet private weak var countResetButton: UIButton!

    private let disposeBag = DisposeBag()

    private var viewModel: CounterRxViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setViewModel()

    }

    private func setViewModel() {
        viewModel = CounterRxViewModel()
        let input = CounterViewModelInput(
            countUpButton: countUpButton.rx.tap.asObservable(),
            countDownButton: countDownButton.rx.tap.asObservable(),
            countResetButton: countResetButton.rx.tap.asObservable()
        )
        viewModel.setup(input: input)

        viewModel.outputs?.counterText
            .drive(countLabel.rx.text)
            .disposed(by: disposeBag)
    }



}



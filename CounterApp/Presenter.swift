//
//  Presenter.swift
//  CounterApp
//
//  Created by koala panda on 2023/08/15.
//

import Foundation

class CounterPresenter {
    private var count = 0 {
        didSet {
            delegate?.updateCount(count: count)
        }
    }

    private var delegate: CounterDelegate?

    func attachView(_ delegate: CounterDelegate) {
        self.delegate = delegate
    }

    func detachView() {
        self.delegate = nil
    }

    func incrementCount() {
        count += 1
    }

    func decrementCount() {
        count -= 1
    }

    func resetCount() {
        count = 0
    }
}

//
//  ViewModel.swift
//  countAppMVVM
//
//  Created by 神原良継 on 2022/03/23.
//

import Foundation
import RxSwift

class ViewModel {
    
    let tappedPlusButton: AnyObserver<Int>
    var countModel: Observable<Int>
    
    var vmNum: Int = 0
    
    private let disposeBag = DisposeBag()
    
    init() {
        let tappedPlusButtonSubject = PublishSubject<Int>()
        let countModelSubject = PublishSubject<Int>()
        
        tappedPlusButton = tappedPlusButtonSubject.asObserver()
        countModel = countModelSubject.asObservable()
        
        countModel = countModelSubject
            .map { [weak self] _ in
                let hoge = self?.vmNum ?? 0
                self?.vmNum = 1 + hoge

                return self?.vmNum ?? 0
            }
    
        tappedPlusButtonSubject
            .subscribe(countModelSubject)
            .disposed(by: disposeBag)
    }
}

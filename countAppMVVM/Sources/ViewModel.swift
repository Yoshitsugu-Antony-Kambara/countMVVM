//
//  ViewModel.swift
//  countAppMVVM
//
//  Created by 神原良継 on 2022/03/23.
//

import Foundation
import RxSwift

class ViewModel {
    
    let viewDidLoad: AnyObserver<Int>
    let countModel: Observable<Int>
    
    init() {
        let viewDidLoadSubject = PublishSubject<Int>()
        //inputs
        viewDidLoad = viewDidLoadSubject.asObserver()
        //ouputs

        countModel = viewDidLoadSubject
            .map { num in
                let numPlused: Int = num + 1
                return numPlused
            }
    }
}

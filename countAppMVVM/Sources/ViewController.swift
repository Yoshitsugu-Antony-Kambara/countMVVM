//
//  ViewController.swift
//  countAppMVVM
//
//  Created by 神原良継 on 2022/03/23.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    @IBOutlet var countLabel: UILabel!
    
    let viewModel = ViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindToViewModel()
    }
    
    @IBAction func tappedPlusButton() {
        viewModel.tappedPlusButton.onNext(0)
    }
    
    private func bindToViewModel() {
        viewModel.countModel
            .subscribe(onNext: { numPlused in
                self.countLabel.text = String(numPlused)
            })
            .disposed(by: disposeBag)
    }
}


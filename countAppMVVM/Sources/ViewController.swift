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
    
    public var num: Int = 0
    
    let viewModel = ViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        bindToViewModel()
    }
    
    @IBAction func tappedPlusButton() {
        viewModel.viewDidLoad.onNext(num)
    }

    
    private func bindToViewModel() {
        viewModel.countModel
            .subscribe(onNext: { numPlused in
                self.num = numPlused
                self.countLabel.text = String(self.num)
            })
            .disposed(by: disposeBag)
    }

}


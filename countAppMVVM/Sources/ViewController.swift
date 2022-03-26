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
    
    public var num: Int!
    
    let viewModel = ViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        bindToViewModel()
    }
    
    @IBAction func tappedPlusButton() {
        let toInt: String = countLabel.text ?? "0"
        num = Int(toInt) ?? 0
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


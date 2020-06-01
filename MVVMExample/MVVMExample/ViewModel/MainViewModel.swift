//
//  MainVIewModel.swift
//  MVVMExample
//
//  Created by 박진수 on 25/01/2019.
//  Copyright © 2019 박진수. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MainViewModel: NSObject {
    
    // Variable은 BehaviorSubject를 감싸는 onNext()이벤트만 제출할 수 있는 래퍼
    // 할당 해제될 때, 자동으로 onCompleted() 이벤트를 보냄
    // Variable은 RxSwift 4.0에서 deprecated됐으므로 BehaviorRelay로 바꿀것
//    let searchText = Variable("")
    let searchText = BehaviorRelay<String>(value: "")
    let txt = BehaviorRelay<String>(value: "")
    
    // Driver은 Observable과 다르게 MainScheduler에서 사용을 하며, UI layer에서 좀 더 직관적으로 사용하도록 제공하는 unit
    lazy var data: Driver<[Repository]> = {
//        return self.txt.asObservable()
//            .throttle(0.3, scheduler: MainScheduler.instance) // 지정한 시간 동안 생긴 옵저버블 중 마지막 것을 선택해주는 오퍼레이터
//            .distinctUntilChanged() // 새로운 값만 전달
//            .flatMapLatest(ApiUtil.getRepo)
//            .asDriver(onErrorJustReturn: [])
        
        return self.searchText.asObservable()
            .throttle(0.5, scheduler: MainScheduler.instance) // 지정한 시간 동안 생긴 옵저버블 중 마지막 것을 선택해주는 오퍼레이터
            .distinctUntilChanged() // 새로운 값만 전달
            .flatMapLatest(ApiUtil.getRepo)
            .asDriver(onErrorJustReturn: [])

    }()

}

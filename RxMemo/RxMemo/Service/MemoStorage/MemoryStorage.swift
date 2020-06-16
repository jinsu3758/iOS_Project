//
//  MemoryStorage.swift
//  RxMemo
//
//  Created by 박진수 on 2020/06/11.
//  Copyright © 2020 박진수. All rights reserved.
//

import Foundation
import RxSwift

// 메모리에 메모를 저장하는 클래스
class MemoryStorage: MemoStorageType {
    private var list = [
        Memo(content: "Hello, RxSwift", insertDate: Date().addingTimeInterval(-10)),
        Memo(content: "What the...", insertDate: Date().addingTimeInterval(-20))
    ]
    
    private lazy var sectionModel = MemoSectionModel(model: 0, items: list)
    
    // 기본값을 list로 설정하기 위해 lazy로 설정
    private lazy var store = BehaviorSubject<[MemoSectionModel]>(value: [sectionModel])
    
    @discardableResult
    func createMemo(content: String) -> Observable<Memo> {
        let memo = Memo(content: content)
        
        sectionModel.items.insert(memo, at: 0) // 앞 순서에 넣기 위해 insert
        
        store.onNext([sectionModel])
        
        return Observable.just(memo)
    }
    
    @discardableResult
    func memoList() -> Observable<[MemoSectionModel]> {
        return store
    }
    
    @discardableResult
    func update(memo: Memo, content: String) -> Observable<Memo> {
        let updated = Memo(original: memo, updatedContent: content)
        
        if let index = sectionModel.items.firstIndex(where: { $0 == memo }) {
            sectionModel.items.remove(at: index)
            sectionModel.items.insert(updated, at: index)
        }
        
        store.onNext([sectionModel])
        
        return Observable.just(updated)
    }
    
    @discardableResult
    func delete(memo: Memo) -> Observable<Memo> {
        if let index = sectionModel.items.firstIndex(where: { $0 == memo }) {
            sectionModel.items.remove(at: index)
        }
        
        store.onNext([sectionModel])
        
        return Observable.just(memo)
    }
    
    
}

//
//  MemoStorageType.swift
//  RxMemo
//
//  Created by 박진수 on 2020/06/11.
//  Copyright © 2020 박진수. All rights reserved.
//

import Foundation
import RxSwift

protocol MemoStorageType {
    @discardableResult
    func createMemo(content: String) -> Observable<Memo>
    
    @discardableResult
    func memoList() -> Observable<[MemoSectionModel]>
    
    @discardableResult
    func update(memo: Memo, content: String) -> Observable<Memo>
    
    @discardableResult
    func delete(memo: Memo) -> Observable<Memo>
    

}

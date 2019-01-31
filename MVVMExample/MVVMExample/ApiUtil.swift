//
//  ApiUtil.swift
//  MVVMExample
//
//  Created by 박진수 on 25/01/2019.
//  Copyright © 2019 박진수. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class ApiUtil {
    static func getRepo(_ id: String) -> Observable<[Repository]> {
        guard !id.isEmpty,
            let url = URL(string: "https://api.github.com/users/\(id)/repos")
            else { return Observable.just([]) }
        
        return URLSession.shared.rx.json(url: url)
            .retry()
            .map({ json in
                guard let items = json as? [[String : Any]] else { return [] }
                
                var repo = [Repository]()
                
                items.forEach {
                    guard let repoName = $0["name"] as? String,
                        let repoURL = $0["html_url"] as? String else { return }
                    repo.append(Repository(name: repoName, url: repoURL))
                }
                return repo
            })
    }
}

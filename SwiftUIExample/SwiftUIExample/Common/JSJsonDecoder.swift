//
//  JSJsonDecoder.swift
//  SwiftUIExample
//
//  Created by 박진수 on 2020/04/28.
//  Copyright © 2020 박진수. All rights reserved.
//

import Foundation

class JSJsonDecoder {
    static let shared = JSJsonDecoder()
    
    func getJsonFromFile(_ fileName: String) -> Data? {
        do {
            if let file = Bundle.main.url(forResource: fileName, withExtension: "json") {
                let data = try Data(contentsOf: file)
                return data
            }
            return nil
        }
        catch {
            return nil
        }
    }
    
    func decode<T: Codable>(completion: ((T?, Error?) -> Void)?) {
        guard let data = getJsonFromFile("landmark") else {
            completion?(nil, nil)
            return
        }
        if let object = try? JSONDecoder().decode(T.self, from: data) {
            completion?(object, nil)
        }
    }
    
    
    
}

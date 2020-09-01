import UIKit
import Foundation
import Combine

var str = "Hello, playground"

Just(5).sink { value in
    print(value)
}

let provider = (1...10).publisher

provider.sink(receiveCompletion: { _ in
    print("완료")
}, receiveValue: { value in
    print(value)
})


class CustomSubscriber: Subscriber {
    typealias Input = String
    typealias Failure = Never
    
    func receive(completion: Subscribers.Completion<Never>) {
        print("모든 데이터의 발행 완료")
    }
    
    func receive(subscription: Subscription) {
        print("데이터의 구독을 시작")
    }
    
    func receive(_ input: String) -> Subscribers.Demand {
        return .none
    }
    
    let textField = UITextField()
    
    
    
    let sub = NotificationCenter.default
    .publisher(for: UIControl.textDidChangeNotification, object: textField)
    .map( { ($0.object as! NSTextField).stringValue } )
        .sink(receiveCompletion: { print ($0.) },
          receiveValue: { print ($0) })
    
    
}

public protocol Publisher {
    associatedtype Output
    associatedtype Failure : Error
    func receive<S>(subscriber: S) where S : Subscriber, Self.Failure == S.Failure, Self.Output == S.Input
}



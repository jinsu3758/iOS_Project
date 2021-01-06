import Foundation



let dispatch = DispatchQueue.global()
let new_dispatch = DispatchQueue.init(label: "new")

dispatch.async {
    for i in 0..<5 {
        print("async 1 : \(i)")
    }
}

new_dispatch.sync {
    for i in 0..<5 {
        print("new sync 1 : \(i)")
    }
}

dispatch.sync {
    for i in 0..<5 {
        print("sync 1 : \(i)")
    }
}

dispatch.async {
    for i in 0..<5 {
        print("async 2 : \(i)")
    }
}

dispatch.async {
    for i in 0..<5 {
        print("async 3 : \(i)")
    }
}




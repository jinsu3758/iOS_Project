import Foundation



let dispatch = DispatchQueue.global()
let mainqueue = DispatchQueue.main
let new_dispatch = DispatchQueue.init(label: "new")

//dispatch.async {
//    for i in 0..<5 {
//        print("async 1 : \(i)")
//    }
//}
mainqueue.async {
    for i in 0..<5 {
        print("main async 1 : \(i)")
    }
}

for i in 0..<5 {
    print("main 1 : \(i)")
}

//new_dispatch.sync {
//    for i in 0..<5 {
//        print("new sync 1 : \(i)")
//    }
//}
//
//dispatch.sync {
//    for i in 0..<5 {
//        print("sync 1 : \(i)")
//    }
//}
//
//dispatch.async {
//    for i in 0..<5 {
//        print("async 2 : \(i)")
//    }
//}
//
//dispatch.async {
//    for i in 0..<5 {
//        print("async 3 : \(i)")
//    }
//}




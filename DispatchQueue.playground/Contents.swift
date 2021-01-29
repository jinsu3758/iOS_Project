import Foundation



let concurrent = DispatchQueue.global()   // concurrent
let main = DispatchQueue.main  // main
let serial = DispatchQueue.init(label: "test")    // serial

func concurrent_test1() {
    concurrent.sync {
        print("concurrent sync : 1")
    }
    print("main 2")
    
    concurrent.sync {
        for i in 3...500 {
            print("concurrent sync : \(i)")
        }
    }
    
    print("main 11")
    print("main 12")
    
    // 무조건 sync
}

func concurrent_test2() {
    concurrent.async {
        print("1")
    }
    
    main.async {
        print("2")
    }

    main.async {
        print("3")
    }
    
    print("4")
    
    // 1 4 2 3
    // 4 1 2 3
    // 1과 4는 순서보장x, 2와 3은 무조건 뒤에 순서 보장
}

func main_test1() {
    main.sync {
        print("1")
    }
    
    print("2")
    
    // crash 발생
}

func main_test2() {
    main.async {
        print("main async")
    }
    for i in 0...500 {
        print(i)
    }
    
    // 무조건 main이 먼저
}

func main_test3() {
    main.async {
        print("main async")
    }
    for i in 0...500 {
        print(i)
    }
    for i in 0...500 {
        print(i)
    }
}

main_test3()

func all_test1() {
    let background = DispatchQueue.global(qos: .background)
    
    main.async {
        print("1")
    }
    
    background.async {
        print("back")
    }
    
    concurrent.async {
        print("2")
    }
    
    serial.async {
        print("3")
    }
    
    print("4")

    // 2 4 3 1
    // 2 3 4 1
    // 4 3 2 1
    // back이 무조건 느리지는 않음 back이 1등할 떄도 있네
    // 2와 1 만 순서 보장(2가 무조건 빠름) 왜 그렇지...?
    // 4는 여전히 1보다 앞, 1은 1,2,3,4 중에서는 무조건 맨 뒤
    
}

func all_test2() {
    concurrent.async {
        for i in 0..<5 {
            print("async 1 : \(i)")
        }
    }
    main.async {
        for i in 0..<5 {
            print("main async 1 : \(i)")
        }
    }

    for i in 0..<5 {
        print("main 1 : \(i)")
    }

    serial.sync {
        for i in 0..<5 {
            print("new sync 1 : \(i)")
        }
    }
    
    concurrent.sync {
        for i in 0..<5 {
            print("sync 1 : \(i)")
        }
    }
    
    concurrent.async {
        for i in 0..<5 {
            print("async 2 : \(i)")
        }
    }
    
    concurrent.async {
        for i in 0..<5 {
            print("async 3 : \(i)")
        }
    }
    
    // main async는 맨 마지막이다 왜 그럴까?
    // concurrent는 무조건 그냥보다 먼저 시작한다, concurrent1은 끝나는 순서는 보장 x 근데 그냥이랑 보통 번갈아가면서
    // 나머지는 다 순서대로, 중간에 concurrent1이 끼어들 떄가 있다
    // concurrent2와 3은 무조건 순서 보장
}

func all_test3() {
    print("1")
    
    concurrent.async {
        print("2")
    }
    
    concurrent.async {
        print("3")
    }
    print("4")

    // 1 2 3 4 무조건
}

func serial_test() {
    serial.sync {
        for i in 1...100 {
            print(i)
        }
        serial.sync {
            print("555")
        }
    }
    
}

func serial_test2() {
    print("1")
    serial.async {
        print("2")
    }
    
    main.async {
        print("3")
    }
    
    serial.async {
        print("4")
    }
    print("5")
//    for _ in 0...100 {
//        print("main")
//    }
//
    serial.sync {
        print("6")
    }
    
    print("7")
    
    // 1 2 5 4 6 7 3
    // 여전히 메인 async는 제일 마지막
    // serial 작업 스레드가 무조건 느린건 아니지만 대체적으로 메인스레드보다 늦게 반응함
    // 기준은 딱히 없는듯 동시적으로 돌아가서 그런듯 그런데 순서는 또 보장함
    
}

serial_test2()



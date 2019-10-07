import UIKit
import PlaygroundSupport
//: Определяем бесконечное выполнение, чтобы предотвратить "выбрасывание" background tasks, когда работа на Playground будет закончена.
PlaygroundPage.current.needsIndefiniteExecution = true

let mainQueue = DispatchQueue.main

let userInteractiveQueue = DispatchQueue.global(qos: .userInteractive)
let userQueue = DispatchQueue.global(qos: .userInitiated)
let utilityQueue = DispatchQueue.global(qos: .utility)
let backgroundQueue = DispatchQueue.global(qos: .background)

let defaultQueue = DispatchQueue.global()

func task( _ symbol: String){
    for i in 1...10 {
        print(" \(symbol) \(i) priority: \(qos_class_self().rawValue)")
    }
}

func taskHigth( _ symbol: String){
    
    print(" \(symbol)  high priority: \(qos_class_self().rawValue)")
    
}
//
//print("SYNC")
//userQueue.sync {
//    task("😊")
//}
//task("🤯")
//
//sleep(2)
//
//
//print("ASYNC")
//userQueue.async {
//    task("😊")
//}
//task("🤯")

//let mySerialQueue = DispatchQueue(label: "com.edu")
//
//print("SYNC")
//mySerialQueue.sync {
//    task("😊")
//}
//task("🤯")
//
//sleep(2)
//
//
//print("ASYNC")
//mySerialQueue.async {
//    task("😊")
//}
//task("🤯")

//let serialPriorityQueue = DispatchQueue( label: "com.edu.serialPriority", qos: .userInitiated)
//serialPriorityQueue.async {
//    task("😊")
//}
//serialPriorityQueue.async {
//    task("🤯")
//}
//sleep(1)

//let serialPriorityQueue1 = DispatchQueue( label: "com.edu.serialPriority", qos: .userInitiated)
//
//let serialPriorityQueue2 = DispatchQueue( label: "com.edu.serialPriority", qos: .background)
//serialPriorityQueue1.async {
//    task("😊")
//}
//serialPriorityQueue2.async {
//    task("🤯")
//}
//sleep(1)

//let serialUtilityQueue = DispatchQueue( label: "com.edu.serialPriority", qos: .utility)
//
//let serialBackgroundQueue = DispatchQueue( label: "com.edu.serialPriority", qos: .background)
//
//serialBackgroundQueue.asyncAfter(deadline: .now() + 0.1, qos: .userInteractive) {
//    task("🤯")
//}
//serialUtilityQueue.async {
//    task("😊")
//}
//
//sleep(1)

//let workerQueue = DispatchQueue(label: "com.edu.worker_cuncurrent", qos: .userInitiated, attributes: .concurrent)
//workerQueue.async {
//    task("😊")
//}
//workerQueue.async {
//    task("🤯")
//}
//
//sleep(2)

//let workerQueue1 = DispatchQueue(label: "com.edu.worker_cuncurrent1", qos: .userInitiated, attributes: .concurrent)
//let workerQueue2 = DispatchQueue(label: "com.edu.worker_cuncurrent1", qos: .background, attributes: .concurrent)
//workerQueue2.async {
//    task("😊")
//}
//workerQueue1.async {
//    task("🤯")
//}
//
//sleep(2)

let hightPriorityItem = DispatchWorkItem ( qos: .userInteractive, flags: [.enforceQoS]){
    taskHigth("🐣")
}

//safeString.setString(string: "")
//usualString = ""

//let workerQueue2 = DispatchQueue(label: "com.edu.concurrent2", qos: .userInitiated, attributes: .concurrent)
//let workerQueue3 = DispatchQueue(label: "com.edu.concurrent2", qos: .background, attributes: .concurrent)
//
//
//    workerQueue2.async {
//        task("😊")
//    }
//    workerQueue3.async {
//        task("🤯")
//    }
//    workerQueue2.async(execute: hightPriorityItem)
//    workerQueue3.async(execute: hightPriorityItem)
//
//sleep(1)

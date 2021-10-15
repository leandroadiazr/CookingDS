import Cocoa

var greeting = "Hello, playground"


//MARK:- LinkedLists
struct LikedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    func printList() {
        if isEmpty {
         isEmpty
        }
        
        while tail?.next != nil {
            print(head?.next)
        }
    }
    
    mutating func push(_ value: T) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    mutating func append(_ val: T) {
        guard !isEmpty else {
            push(val)
            return
        }
        let node = Node(value: val)
        tail?.next = node
        tail = node
    }
    
    mutating func insert(val: T, at index: Int){
        var currentIndex = 0
        var currentHead = head
        var nextNode: Node<T>?
        
        while(currentHead != nil && currentIndex < index) {
            currentHead = currentHead?.next
            currentIndex += 1
        }
        nextNode = currentHead
        currentHead?.next = Node(value: val, next: nextNode?.next)
    }
    
    mutating func pop() -> Node<T>? {
        if head != nil {
            let currentHead = head
            head = currentHead?.next
        }
        return head
    }
    
    mutating func removeLast() -> Node<T>? {
        guard let head = head else {
            return nil
        }

        guard head.next != nil else {
            return pop()
        }
        var prev = head
        var current = head
        while let next = current.next {
            prev = current
            current = next
        }
        prev.next = nil
        tail = prev
        
        return current
    }
    
    mutating func removeAfter(after node: Node<T>) -> Node<T>? {
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next
    }
    
}

class Node<T> {
    var value: T
    var next: Node?
    
    init(value: T, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + " "
    }
}


//MARK:-USage of class node
let node1 = Node(value: 1)
let node2 = Node(value: 2)
let node3 = Node(value: 3)

node1.next = node2
node2.next = node3
//print(node1)

var list = LikedList<Int>()
list.push(18)
list.push(55)
list.append(151)

list.insert(val: 99, at: 0)
//print(list)

list.pop()
//print("popping :", list)

list.push(185)
list.push(555)
list.append(1551)
//print(list)


list.removeLast()
//print("removing last :", list)

list.removeAfter(after: Node(value: 99))
//print("removed after :", list)
list.printList()



//MARK:- Find Duplicate from list

func findDuplicates(_ arr: [Int]) -> [Int] {
    
    var duplicates = [Int]()
    
    for i in 0..<arr.count {
        for j in 1..<arr.count where i != j{
            if arr[i] == arr[j] {
                duplicates.append(arr[j])
                break
            }
        }
    }
    
    return duplicates
}

//findDuplicates([1,2,3,2,1])


//MARK:- Find number using binarySearch
func findWithBinarySearch(_ arr: [Int], target: Int) -> Int {
    var firstPointer = 0
    var midPointer = arr.count / 2
    var endPointer = arr.count - 1
    var tempArr = [Int]()
    
    
    for _ in 0..<arr.count - 1 {
        if arr[midPointer] < target {
            endPointer = midPointer
            print("end pointer :", endPointer)
            tempArr.append([firstPointer..<endPointer].count - 1)
            print("temp arry :", tempArr)
//            midPointer = tempArr.count / 2
            print("mid pointer ",  midPointer)
        }
        
        if target == tempArr[midPointer] {
            return tempArr[midPointer]
        }
        
//        if tempArr[midPointer] - 1 > target {
//            print("mid pointer : ", midPointer)
////            firstPointer = midPointer
//
//            print("fist pointer now", firstPointer, endPointer)
////
////            tempArr.append([firstPointer..<endPointer].count)
////            for number in tempArr {
////                if number == midPointer {
////                return number
////            }
//
////            }
//            firstPointer += 1
//
//        }
//        else if arr[midPointer] < arr.count - 1 {
//            endPointer = midPointer
//            print(firstPointer, midPointer, endPointer)
//            tempArr.append([firstPointer..<endPointer].count)
//            if number == midPointer {
//                return number
//            }
//
//            endPointer -= 1
//
//        }
    }
    
    return -1
}


//print(findWithBinarySearch([1,2,3,4,5,6,7,8,9], target: 3))


let monthExpenses: [String: Int] = [
    "jan" : 2200,
    "feb" : 2350,
    "mar" : 2600,
    "apr" : 2130,
    "may" : 2190
]

//func compareExp(_ m1: [String: Int], target1: Int, target2: Int) -> Int {
//    var f = 0
//    var l = 0
//
//
//    for (i, value) in m1 {
//        for (j, value) in m1 where j != i {
//           if value == target1  {
//                    f = value
//            }
//        }
//    }
//
//    return 1
//}
//compareExp(monthExpenses, target: 2)


//MARK:- STacks
struct Stack<T> {
    private var storage: [T] = []
    init() {}

    var isEmpty: Bool {
        return storage.isEmpty
    }
    
    var first: T? {
        return storage.first
    }
    
    mutating func push(_ el: T) {
        storage.append(el)
    }
    
    mutating func pop() -> T? {
        return storage.popLast()
    }
    
    mutating func pushElements(_ elements: [T]) {
        storage.append(contentsOf: elements)
    }

    mutating func removeAll() {
        storage.removeAll()
    }
}
extension Stack: CustomStringConvertible {
    var description: String {
        let top = "------------Top------------\n"
        let bot = "\n------------bot------------"
        let stackEl = storage.map{ "\($0)" }.reversed().joined(separator: "\n")
        return top + stackEl + bot
    }
}

//var stack = Stack<Int>()
//stack.push(55)
//stack.pushElements([1,2,23,4,5,6,4])
//print(stack)
//
//stack.removeAll()
//print(stack)


struct Queue<T> {
    var stack = [T]()
    init() {}
    
    var isEmpty: Bool {
        return stack.isEmpty
    }
    
    var peek: T? {
        return stack.first
    }
    
    mutating func inQueue(_ el: T) {
        stack.append(el)
    }
    
    mutating func deQueue() -> T? {
        return isEmpty ? nil : stack.removeFirst()
    }
        
}

var queue = Queue<String>()
queue.inQueue("leandro diaz")
queue.inQueue("leandro dia")
queue.inQueue("leandro di")
queue.inQueue("leandro d")
//print(queue)



//MARK:- Recuersion*--------------------------
//MARK:- Factorials Using Recursion
func factorial(number: Int) -> Int {
//    if number == 0 {
//        return 1
//    }
//    return number * factorial(number: number - 1)
    
    return number == 1 ? 1 : number * factorial(number: number - 1)
}
//factorial(number: 5)

func increment(index: Int) -> Int {
    
    var counter = index
    counter += 1
    
//    if counter < 10 {
//        return increment(index: counter)
//    }
//    return counter
    
    return counter < 10 ? increment(index: counter) : counter
}

//increment(index: 1)

//func recursionPower(index: Int, po: Int) -> Int {
//
//    if index == 0 {
//        return 1
//    } else {
////        return index * recursionPower(index: index, po: po - 1)
//    }
//
//
//    return index == 0 ? 1 : recursionPower(index: index, po: po)
//}
//
//recursionPower(index: 2, po: 3)
    
//MARK:- Tree

struct Tree<T> {
    var root: T
    var child: [Tree] = []
    
    
    mutating func add(_ child: Tree) {
        self.child.append(child)
    }

}

var drinks = Tree<String>(root: "Drinks")


let hot = Tree<String>(root: "Coffee")
let cold = Tree<String>(root: "Cocacola")

drinks.add(hot)
drinks.add(cold)


print(drinks.child)























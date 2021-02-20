import UIKit

class MyArray {
    
    var length: Int
    var data: Array<Any>
    
    init() {
        print("init MyArray")
        length = 0
        data = [Any]()
    }
    
    func get(index: Int) -> Any {
        return data[index]
    }
    

    /// - Complexity: O(1) on average
    func push(item: Any) {
        data.append(item)
        length += 1
    }
    
    /// - Complexity: O(1) on average
    func pop() -> Any {
        let lastItem = data[length - 1]
        data.remove(at: length - 1)
        length -= 1
        return lastItem
    }
    
    /// - Complexity: O(1) on average
    func deleteAtIndex(index: Int) -> Any {
        let item = data[index]
        shiftItems(index: index)
        return item
    }
    
    /// - Complexity: O(1) on average
    func shiftItems(index: Int) {
        for i in index..<length-1 {
            data[i] = data[i+1]
        }
        data.remove(at: length - 1)
        length -= 1
    }
    
    func printData() {
        print(data)
    }
}

let myArray = MyArray()
myArray.push(item: "hi")
myArray.push(item: "you")
myArray.push(item: "!")
myArray.pop()
myArray.printData()

myArray.deleteAtIndex(index: 0)
myArray.push(item: "are")
myArray.push(item: "nice")
myArray.printData()

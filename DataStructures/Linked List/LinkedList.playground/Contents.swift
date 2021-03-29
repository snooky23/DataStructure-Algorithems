public class Node<T> {
    var value: T
    var next: Node?
    
    //The next and previous nodes are optional since the head does not have a previous node and the tail does not have a next node.
    weak var previous: Node?
    
    public init(value: T) {
        self.value = value
    }
}

public class LinkedList<T> {
    
    private var head: Node<T>?
    
    public var last: Node<T>? {
        guard var node = head else {
            return nil
        }
        
        while let next = node.next {
            node = next
        }
        return node
    }
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node<T>? {
        return head
    }
    
    public func append(value: T) {
        let newNode = Node(value: value)
        if let lastNode = last {
            newNode.previous = lastNode
            lastNode.next = newNode
        } else {
            head = newNode
        }
    }
    
    public var count: Int {
        guard var node = head else {
            return 0
        }
        
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
    
    public var print: String {
        var s = "["
        var node = head
        while node != nil {
            s += "\(node!.value)"
            node = node!.next
            if node != nil { s += ", " }
        }
        return s + "]"
    }
    
    public func node(atIndex index: Int) -> Node<T> {
        if index == 0 {
            return head!
        } else {
            var node = head!.next
            for _ in 1..<index {
                node = node?.next
                if node == nil { //(*1)
                    break
                }
            }
            return node!
        }
    }
    
    public func insert(value: T, atIndex index: Int) {
       let newNode = Node(value: value)
       if index == 0 {
           newNode.next = head
           head?.previous = newNode
           head = newNode
       } else {
           let previousNode = self.node(atIndex: index-1)
           let nextNode = previousNode.next

           newNode.previous = previousNode
           newNode.next = previousNode.next
           previousNode.next = newNode
           nextNode?.previous = newNode
       }
    }
    
    public func remove(node: Node<T>) -> T {
        let previousNode = node.previous
        let nextNode = node.next

        if let previousNode = previousNode {
            previousNode.next = nextNode
        } else {
            head = nextNode
        }
        nextNode?.previous = previousNode

        node.previous = nil
        node.next = nil
        return node.value
    }
    public func removeAt(_ index: Int) -> T {
        let nodeToRemove = node(atIndex: index)
        return remove(node: nodeToRemove)
    }
}

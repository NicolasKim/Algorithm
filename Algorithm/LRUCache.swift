//
//  VOLRUCache.swift
//  VROnline
//
//  Created by dreamtracer on 2019/5/31.
//  Copyright © 2019 dreamtracer. All rights reserved.
//

extension LRUCache : CustomDebugStringConvertible {
    var debugDescription: String {
        get {
            var resultStr = ""
            var node : Element? = header
            while let n = node?.post ,let _ = n.key {
                resultStr += "\(String(describing: n.val))"
                node = n
            }
            return resultStr
        }
    }
}

class LRUCache<V>{
    
    private class Element<V> {
        
        var post : Element?
        weak var pre  : Element?
        var val  : V?
        var key  : String?
        
        init(value : V?) {
            self.val = value
        }
    }
    
    
    private var _capacity : Int = 5;
    private var _size     : Int = 0;
    private var cache   : Dictionary<String,Element<V>> = [:]
    
    private var header : Element<V> = Element(value: nil)
    private var tail   : Element<V> = Element(value: nil)
    
    var capacity: Int {
        return _capacity
    }
    
    var size : Int {
        return _size
    }
    
    
    init(with capacity : Int) {
        if capacity < 5 {
            _capacity = 5;
        } else {
        	_capacity = capacity;
        }
        header.post = tail
        tail.pre = header
    }
    
    func put(key : String, value : V) {
        if let node = cache[key] {
            //覆盖元素值，
            node.val = value
            //从链表中移除
            remove(node)
            //加到头部
            add(node)
        } else {
            //创建链表节点
            let node = Element<V>(value: value)
            //赋值key
            node.key = key
            //map赋值
            cache[key] = node
            //加到头部
            add(node)
            //超出容量，且tail的pre不为header，则将最后的元素弹出 ， 默认tail和header的key为nil
            if capacity < _size , let tail = tail.pre,let removeKey = tail.key {
                //从map中删除
                cache.removeValue(forKey: removeKey)
                //从节点中删除
                remove(tail)
            }
        }
    }
    
    
    func get(key : String) -> V? {
        //如果没有对应的节点直接返回nil
        guard let node = cache[key] else {
            return nil;
        }
        //移除节点
        remove(node)
        //添加到头部
        add(node)
        
        return node.val
    }
    
    func remove(key : String) -> V? {
        guard let node = cache[key] else {
            return nil;
        }
        //移除节点
        remove(node)
        return node.val
    }

    
    private func add(_ element : Element<V>) {
        element.post = header.post
        header.post?.pre = element
        element.pre = header
        header.post = element
        _size += 1;
    }
    
    
    
    private func remove(_ element:Element<V>){
        if _size <= 0 {
            return
        }
        element.pre?.post = element.post
        element.post?.pre  = element.pre
        _size -= 1
    }
}

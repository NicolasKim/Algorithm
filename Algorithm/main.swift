//
//  main.swift
//  Algorithm
//
//  Created by dreamtracer on 2019/5/31.
//  Copyright © 2019 dreamtracer. All rights reserved.
//

import Foundation

//LRU
let cache = LRUCache<String>(with: 5)
cache.put(key: "key1", value: "value1")
print(String(reflecting: cache))
cache.put(key: "key2", value: "value2")
print(String(reflecting: cache))
cache.put(key: "key3", value: "value3")
print(String(reflecting: cache))
_ = cache.get(key: "key2")
print(String(reflecting: cache))
cache.put(key: "key4", value: "value4")
print(String(reflecting: cache))
cache.put(key: "key5", value: "value5")
print(String(reflecting: cache))
cache.put(key: "key6", value: "value6")
print(String(reflecting: cache))
cache.put(key: "key1", value: "value1-1")
print(String(reflecting: cache))
_ = cache.get(key: "key3")
print(String(reflecting: cache))
cache.put(key: "key7", value: "value7")
print(String(reflecting: cache))
cache.put(key: "key8", value: "value8")
print(String(reflecting: cache))
cache.put(key: "key9", value: "value9")
print(String(reflecting: cache))


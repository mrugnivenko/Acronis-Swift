//: A Cocoa based Playground to present user interface

import AppKit
import PlaygroundSupport

if let str = readLine(){
    let array  = str.components(separatedBy: "\n").compactMap {Int($0)}
    print(array)
}

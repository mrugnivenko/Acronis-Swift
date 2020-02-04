//: A Cocoa based Playground to present user interface

import AppKit
import PlaygroundSupport


var mass: [Int] = [1,0,0,1,1]
let n: Int = 5
var max: Int = 0
var quantity: Int = 0


func max_ones(mass: [Int], n: Int) -> Int{
    for i in 0...n-1{
        if mass[i] == 1{
            quantity += 1
        }
        else{
            if quantity > max{
                max = quantity
                quantity = 0
            }
            else{
                quantity = 0
            }
            
        }
        if i == n-1{
            if quantity > max{
                max = quantity
                quantity = 0
            }
            else{
                quantity = 0
            }
        }
    }
    return max
}

max_ones(mass: mass, n: n)


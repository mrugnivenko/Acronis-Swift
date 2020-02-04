
//: A Cocoa based Playground to present user interface

import AppKit
import PlaygroundSupport


func generation(n: Int, counter_open: Int, counter_close: Int, list: String){
    let N: Int = n
    let Counter_open: Int = counter_open
    let Counter_close: Int = counter_close
    let List: String = list
    if Counter_open + Counter_close == 2 * N{
        print(List)
    }
    
    if counter_open < n{
        let List_1: String = List + "("
        generation(n: N, counter_open: Counter_open + 1, counter_close: Counter_close, list: List_1)
    }
    
    if counter_open > counter_close{
        let List_2: String = List + ")"
        generation(n: N, counter_open: Counter_open, counter_close: Counter_close + 1 , list: List_2)
    }
}

generation(n: 3, counter_open: 0, counter_close: 0, list: "")

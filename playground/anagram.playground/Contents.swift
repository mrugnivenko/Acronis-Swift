//: A Cocoa based Playground to present user interface

import AppKit
import PlaygroundSupport

let list_1: String = "dfghj"
let list_2: String = "jgfhd"

func quntity_of_anagram(list_1: String, list_2: String) -> Int{
    let lenght_1: Int = list_1.count
    let lenght_2: Int = list_2.count
    
    if lenght_1 == lenght_2{
        var check: Bool = true
        
        for i in list_1{
            var count: Int = 0
            for j in list_2{
                if i != j{
                    count += 1
                }
                if count == lenght_1{
                    check = false
                }
            }
            
        }
        if check == true{
            return 1
        }
        else{
            return 0
        }
        
    }
    else{
        return 0
    }
    }
    

quntity_of_anagram(list_1: list_1, list_2: list_2)

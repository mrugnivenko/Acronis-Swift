import AppKit
import PlaygroundSupport


let string_1 = "ab"
let string_2 = "abbb ddhjd"

func how_many_juw(string_1: String, string_2: String) -> Int{
    
    var quantity: Int
    quantity = 0
    
    var list_1: [String] = []
    var list_2: [String] = []
    
    
    for letter in string_1{
        list_1.append(String(letter))
    }
    for letter in string_2{
        list_2.append(String(letter))
    }
    
    
    for letter_1 in list_1{
        for letter_2 in list_2{
            if letter_1 == letter_2{
                quantity += 1
            }
        }
    }
    
    return quantity
}

how_many_juw(string_1: string_1, string_2: string_2)

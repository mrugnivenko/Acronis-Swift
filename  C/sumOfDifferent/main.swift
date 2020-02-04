//
//  main.swift
//  sumOfDifferent
//
//  Created by Виталий Алексеевич on 02/05/2019.
//  Copyright © 2019 Виталий Алексеевич. All rights reserved.
//

import Foundation

func giveMass()-> [Int]{
    guard let kNumberStr = readLine(), var numOfElements = Int(kNumberStr) else {
        return []
    }
    
    var array:[Int] = []
    
    repeat {
        guard let string = readLine() else {
            continue
        }
        if numOfElements > 0 {
            if let number = Int(string){
                array.append(number)
            }
            numOfElements -= 1
        }
    } while numOfElements > 0
    return array
}

func number_of_elements_and_print(array: [Int]){
    var tmp_number: Int = 0
    var first:Int = 1
    let n: Int = array.count
    if n != 0{
        for i in 0...n-1{
            if first == 1{
                first = 0
                tmp_number = array[i]
                print(tmp_number)
            }
            else{
                if tmp_number != array[i]{
                    tmp_number = array[i]
                    print(tmp_number)
                }
            }
        }
        
    }
}

number_of_elements_and_print(array: giveMass())

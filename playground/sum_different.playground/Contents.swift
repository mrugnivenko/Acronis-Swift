//: A Cocoa based Playground to present user interface

import AppKit
import PlaygroundSupport

var mass_1: [Int] = [1,2,2,4]

func sumOfDif(mass: [Int]){
    var mass_2: [Int] = []
    var summ: Int = 0
    var flag: Bool = true
    mass_2.append(mass[0])
    summ += mass[0]

    for i in mass{
        flag = true
        for j in mass_2{
            if i == j{
                flag = false
            }
        }
        if flag == true{
            summ += i
            mass_2.append(i)
        }
    }
    print(summ)
}

sumOfDif(mass: mass_1)

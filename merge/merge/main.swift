//
//  main.swift
//  merge
//
//  Created by Виталий Алексеевич on 02/05/2019.
//  Copyright © 2019 Виталий Алексеевич. All rights reserved.
//

import Foundation

func merge()->[[Int]]{
guard let kNumberStr = readLine(), var numOfArrays = Int(kNumberStr) else {
    return []
}

var arraysOfArrays = [[Int]]()

repeat {
    guard let string = readLine() else {
        continue
    }
    if numOfArrays > 0 {
        arraysOfArrays.append([])
        let numsStringArray = string.split(separator: " ")
        
        for (i, numberString) in numsStringArray.enumerated() where i > 0 {
            if let number = Int(numberString) {
                arraysOfArrays[arraysOfArrays.count - 1].append(number)
            }
        }
        numOfArrays -= 1
    }
} while numOfArrays > 0
return arraysOfArrays
}

func QSortByFirstElement(massOfMass: [[Int]])->[[Int]]{
    
    let quantity: Int = massOfMass.count
    if quantity == 1 || quantity == 0{
        return massOfMass
    }
    var tMass: [[Int]] = []
    if quantity == 2{
        if massOfMass[0][0]>massOfMass[1][0]{
            tMass.append(massOfMass[1])
            tMass.append(massOfMass[0])
            return tMass
        }
    }
    var tMass_1: [[Int]] = []
    var tMass_2: [[Int]] = []
    for i in 1...quantity-1{
        if massOfMass[i][0]>massOfMass[0][0]{
            tMass_2.append(massOfMass[i])
        }
        else{
            tMass_1.append(massOfMass[i])
        }
    }
    tMass_1 = QSortByFirstElement(massOfMass: tMass_1)
    tMass_1.append(massOfMass[0])
    tMass_2 = QSortByFirstElement(massOfMass: tMass_2)
    return (tMass_1 + tMass_2 )
}


func sort(massOfMass: [[Int]])->[Int]{
    var tMass: [[Int]] = massOfMass
    var tResult: [Int] = []
    while tMass.count > 0{
        tMass = QSortByFirstElement(massOfMass: tMass)
        tResult.append(tMass[0][0])
        tMass[0].remove(at: 0)
        if tMass[0].count == 0{
            tMass.remove(at: 0)
        }
    }
    return tResult
}

var arr = [Int]()
arr = sort(massOfMass: merge())
for elem in arr{
    print(elem,terminator:" ")
}

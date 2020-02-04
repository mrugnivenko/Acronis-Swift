//
//  main.swift
//  sequence of units
//
//  Created by Виталий Алексеевич on 28/04/2019.
//  Copyright © 2019 Виталий Алексеевич. All rights reserved.
//

import Foundation

func giveMass(){
    guard let kNumberStr = readLine(), var numOfElements = Int(kNumberStr) else {
        return
    }
    
    var max: Int = 0
    var quantity: Int = 0
    
    while numOfElements > 0 {
        guard let string = readLine() else {
            break
        }
        if numOfElements > 0 {
            if let number = Int(string){
                if number == 1{
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
                
                if quantity > max{
                    max = quantity
                }
                
            }
            numOfElements -= 1
        }
        
    }
    print(max)
}

giveMass()
/*func giveMass(){
    guard let kNumberStr = readLine(), var numOfElements = Int(kNumberStr) else {
        return
    }
}


var max: Int = 0
var quantity: Int = 0

func max_ones(mass: [Int]){
    let n: Int = mass.count
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
    print(max)
    
}

max_ones(mass: giveMass())
*/

/*if let str = readLine(){
 let array  = str.components(separatedBy: "\n").compactMap {Int($0)}
 print(array)
 }*/

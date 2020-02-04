//
//  main.swift
//  SJ
//
//  Created by Виталий Алексеевич on 28/04/2019.
//  Copyright © 2019 Виталий Алексеевич. All rights reserved.
//



import Foundation

//let string_1 = readLine()
//let string_2 = readLine()


var string_1 = readLine()
var string_2 = readLine()


func how_many_juw(string_1: String, string_2: String){
    
    var quantity: Int
    quantity = 0
    
   
    var list: [String] = []
    
    
    for letter in string_2{
        list.append(String(letter))
    }
    
    
    for letter in list{
        if string_1.contains(letter){
            quantity += 1
        }
    }
    
    print(quantity)
    
}

if string_1 != nil{
    if string_2 != nil{
        how_many_juw(string_1: string_1! , string_2: string_2!)
    }
}




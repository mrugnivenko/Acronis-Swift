//
//  main.swift
//  anagram
//
//  Created by Виталий Алексеевич on 28/04/2019.
//  Copyright © 2019 Виталий Алексеевич. All rights reserved.
//

import Foundation


var string_1 = readLine()
var string_2 = readLine()

func isAnagram(list_1: String, list_2: String){
    
    let lenght_1: Int = list_1.count
    let lenght_2: Int = list_2.count
    
    if lenght_1 == lenght_2{
        var dictionary: [Character:Int] = [:]
        
        for i in list_1{
            if nil != dictionary[i]{
                dictionary[i]?+=1
            }
            else{
                dictionary[i] = 1
            }
        }
        
        for i in list_2{
            if nil != dictionary[i]{
                dictionary[i]?-=1
            }
            else{
                dictionary[i] = -1
            }
            
        }
        
        var flag:Bool = false
        for (_,number) in dictionary{
            if number != 0{
                flag = true
            }
        }
        if flag == false{
            print(1)
        }
        else{
            print(0)
        }
    }
    else{
        print(0)
    }
    
}

if string_1 != nil{
    if string_2 != nil{
        isAnagram(list_1: string_1!, list_2: string_2!)
    }
}






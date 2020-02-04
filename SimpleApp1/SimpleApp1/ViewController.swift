//
//  ViewController.swift
//  SimpleApp1
//
//  Created by Daniil Sargin on 25/04/2019.
//  Copyright © 2019 dsargin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,
    UITextFieldDelegate {

    @IBOutlet weak  var Button: UIButton!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let charactersSet: [Character] = [
            "0", "1", "2", "3", "4", "5", "6",
            "7", "8", "9"
        ]
        for c in string {
            if !charactersSet.contains(c) {
                return false
            }
        }
        return true
    }
    
    
    func arr_power(n: Int)->Int
    {
        var tmp=Double(n),tmp1=Double(0)
        while true
        {
            tmp1=Double(n)*log(tmp)
            if (tmp1-tmp)/tmp1<0.1
            {
                break
            }
            tmp=tmp1
            
        }
        return Int(round(tmp1))*2
    }
    
    
    func proresheti(arr:[Int],n:Int,size:Int)->[Int]
    {
        var i = n*2
        var ar = arr
        while true
        {
            if i>=size
            {
                break
            }
            ar[i]=1
            i=i+n
            
        }
        return ar
    }
    
    
    func proresheti_full(arr:[Int],n:Int)->[Int]
    {
        var i = 2
        var ar = arr
        while true
        {
            if i>=n
            {
                break
            }
            if ar[i]==0
            {
                ar=proresheti(arr:ar,n:i,size:n)
            }
            i=i+1
        }
        return ar
    }
    
    
    func find_simple(n:Int)->Int
    {
        if n == 1{
            return 2
        }
        if n == 2{
            return 3
        }
        var arr = Array(repeating:0,count: arr_power(n:n))
        arr = proresheti_full(arr:arr,n:arr_power(n:n))
        var i = 0,j=2
        while true
        {
            if i==n
            {
                return j-1
            }
            if arr[j]==0
            {
                i=i+1
            }
            j=j+1
            
        }
        
    }

    
    @IBAction func onButtonTap(_ sender: UIButton) {
        if let text = textField.text, let number = Int(text) {
            doSomeHardOperation(n: number) { [weak self] result in
                self?.resultLabel.text = "\(result)"
            }
        }
    }
    
    func doSomeHardOperation(n: Int, completion: @escaping (Int) -> ()) {
        Button.isEnabled = false
        DispatchQueue.global().async {
            let number = self.find_simple(n: n)
            DispatchQueue.main.async { [weak self] in
                self?.Button.isEnabled = true
                completion(number)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }


}


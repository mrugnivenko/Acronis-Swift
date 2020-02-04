//
//  ViewController.swift
//  Currency converter
//
//  Created by Виталий Алексеевич on 28/03/2019.
//  Copyright © 2019 Виталий Алексеевич. All rights reserved.
//

import UIKit

class ViewController: UIViewController/*протокол экрана*/, UIPickerViewDataSource/*протокол предачи данных в пикер*/, UIPickerViewDelegate /*протокол для названия валют*/  {
    
    //всё это - указатели на объекты экрана
    
    @IBOutlet weak  var  label: UILabel!
    
    @IBOutlet weak  var pickerFrom: UIPickerView!
    @IBOutlet weak  var pickerTo: UIPickerView!
    
    @IBOutlet weak  var activityIndicator: UIActivityIndicatorView!

    let currencies = ["RUB", "USD", "EUR"]
    
    override func viewDidLoad() { //вызывается после того, как экран загружен в память
        super.viewDidLoad()
       
        //говорим, кто даёт информацию пикерам
        self.pickerTo.dataSource = self
        self.pickerFrom.dataSource = self
        
        //говорим, кто даёт названия пикерам
        self.pickerTo.delegate = self
        self.pickerFrom.delegate = self
        
        self.activityIndicator.hidesWhenStopped = true //появление и скрытие загрузки
        self.requestCurrentCurrencyRate()
        

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //задаём пикеру количество вертикальных крутилок - именно барабанов
    func numberOfComponents( in pickerView: UIPickerView) ->Int {
        return 1
    }
    
    

    //запрос валют по базовой
    func requestCurrencyRates(baseCurrenсy : String, parseHandler: @escaping (Data?, Error?) -> Void ){
        let url  = URL(string: "https://api.exchangeratesapi.io/latest?base=" + baseCurrenсy)!
        
        let dataTask = URLSession.shared.dataTask(with: url){
            (dataReceived, response, error) in
            parseHandler(dataReceived, error)
        }
        dataTask.resume()
    }

    //анализируем информацию, которую получили с сайта
    func parseCurrencyRatesResponse(data: Data?, toCurrency: String) -> String{
        var value : String = ""
        do {
            let json = try JSONSerialization.jsonObject(with: data!, options: []) as? Dictionary<String, Any>
            
            if let parsedJSON = json {
                print("\(parsedJSON)")
                if let rates  = parsedJSON["rates"] as? Dictionary<String, Double>{
                    if let rate = rates[toCurrency]{
                        value = "\(rate)"
                    } else{
                        value = "No rate for currency\"\(toCurrency)\" found"
                    }
                } else {
                    value = "No \"rates\" field found"
                }
            } else {
                value = "No JSON value parsed"
            }
        } catch {
            value = error.localizedDescription
        }
        return value
    }
    
    //всё объединили, то есть запрос+делаем париснг+ отдаём ответ
    func retrieveCurrencyRate(baseCurrency: String, toCurrency: String, completion: @escaping (String) -> Void){
        self.requestCurrencyRates(baseCurrenсy: baseCurrency){[weak self] (data, error) in
            var string = "No currency retrieved!"
            
            if let currentError = error {
                string = currentError.localizedDescription
            } else {
                if let strongSelf = self{
                    string = strongSelf.parseCurrencyRatesResponse(data: data, toCurrency: toCurrency)
                }
            }
            completion(string)
        }
    }
    //возвращает массив валют без базового
    func currenciesExceptBase() -> [String] {
        var currenciesExceptBase = currencies
        currenciesExceptBase.remove(at: pickerFrom.selectedRow(inComponent: 0))
        
        return currenciesExceptBase
    }
    
    //количество компонент в барабане для выбора
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == pickerTo{
            return self.currenciesExceptBase().count
        }
        return currencies.count
    }
    
    //возвращает строку, которая отображается в пикере для элемента row массива currencies
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView === pickerTo{
            return self.currenciesExceptBase()[row]
        }
        return currencies[row]
    }
    
    func requestCurrentCurrencyRate(){
        
        self.activityIndicator.startAnimating()
        self.label.text = ""
        let baseCurrencyIndex = self.pickerFrom.selectedRow(inComponent: 0)
        let toCurrencyIndex = self.pickerTo.selectedRow(inComponent: 0)
        
        //обновление pickerTo и исчезновение base
        let baseCurrency = self.currencies[baseCurrencyIndex]
        let toCurrency = self.currenciesExceptBase()[toCurrencyIndex]
        
        self.retrieveCurrencyRate(baseCurrency: baseCurrency, toCurrency: toCurrency){[weak self] (value) in
            DispatchQueue.main.async(execute:{
                if let strongSelf = self {
                    strongSelf.label.text = value
                    strongSelf.activityIndicator.stopAnimating()
                }
            })
        }
    }
    //запрос уже есть сразу после запуска экрана
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int , inComponent component: Int){
        if pickerView === pickerFrom {
            self.pickerTo.reloadAllComponents()
        }
        
        self.requestCurrentCurrencyRate()
    }
    
    /*func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView === pickerFrom {
            self.pickerTo.reloadAllComponents()
        }
        let baseCurrencyIndex = self.pickerFrom.selectedRow(inComponent: 0)
        let toCurrencyIndex = self.pickerTo.selectedRow(inComponent: 0)
        
        let baseCurrency = self.currencies[baseCurrencyIndex]
        let toCurrency = self.currencies[toCurrencyIndex]
        
        self.retrieveCurrencyRate(baseCurrency: baseCurrency, toCurrency: toCurrency) { [weak self]
            (value) in
            DispatchQueue.main.async(execute: {
                if let strongSelf = self{
                    strongSelf.label.text = value
                
                }
            })
        }
    }
    */
}








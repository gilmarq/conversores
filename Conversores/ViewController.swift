//
//  ViewController.swift
//  Conversores
//
//  Created by Gilmar on 05/02/2019.
//  Copyright © 2019 Gilmar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfValue: UITextField!
    @IBOutlet weak var btUnit1: UIButton!
    @IBOutlet weak var btUnit2: UIButton!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var lbunit: UILabel!
    @IBOutlet weak var lbResultUnit: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func showNext(_ sender: UIButton) {
        
    switch lbunit.text! {
        case "Temperatura":
             lbunit.text = "Peso"
             btUnit1.setTitle("Kilograma", for: .normal)
             btUnit2.setTitle("Libra", for: .normal)
        case "Peso":
            lbunit.text = "Moeda"
            btUnit1.setTitle("Real", for: .normal)
            btUnit2.setTitle("Dólar", for: .normal)
        case "Moeda":
            lbunit.text = "Distância "
            btUnit1.setTitle("Metro", for: .normal)
            btUnit2.setTitle("kilômetro", for: .normal)
        default:
            lbunit.text = "Temperatura "
            btUnit1.setTitle("Celsus", for: .normal)
            btUnit2.setTitle("Farenheint", for: .normal)
        }
        convert(nil)
    }
    
    
    @IBAction func convert(_ sender: UIButton?) {
        if let sender = sender{
            if sender ==  btUnit1{
                btUnit2.alpha =  0.5
            }else{
                btUnit1.alpha = 0.5
            }
            sender.alpha = 1.0
        }
        
        switch lbunit.text! {
        case "Temperatura":
            calcTemperute()
        case "Peso":
            calcWeight()
        case "Moeda":
            calcCurrency()
        default:
            calcDistence()
        }
        view.endEditing(true)
        
        let result = Double(lbResult.text!)!
        lbResult.text = String(format:"%2f", result)
        
    }
    func calcTemperute(){
        guard let temperature = Double(tfValue.text!) else {return}
        if btUnit1.alpha == 1.0{
            lbResultUnit.text = "Fahrenheint"
            lbResult.text = String(temperature * 1.8 + 32.0 )
        }else{
            lbResultUnit.text = "Celsius"
             lbResult.text = String((temperature - 32.0)/1.8)
        }
        
    }
    func calcWeight(){
        guard let weight = Double(tfValue.text!) else {return}
        if btUnit1.alpha == 1.0{
            lbResultUnit.text = "Libra "
            lbResult.text = String(weight / 2.2046)
        }else{
            lbResultUnit.text = "Kilograma"
            lbResult.text = String(weight * 2.2046)
        }
        
    }
    func calcCurrency(){
        guard let currency = Double(tfValue.text!) else {return}
        if btUnit1.alpha == 1.0{
            lbResultUnit.text = "Dólar"
            lbResult.text = String(currency   / 3.65)
        }else{
            lbResultUnit.text = "Real"
            lbResult.text = String(currency * 3.65)
        }
}
    
    func calcDistence(){
        guard let distence = Double(tfValue.text!) else {return}
        if btUnit1.alpha == 1.0{
            lbResultUnit.text = "Kilômetros"
            lbResult.text = String(distence / 1000.0)
        }else{
            lbResultUnit.text = "Metro"
            lbResult.text = String(distence * 1000.0)
        }
        
}

}



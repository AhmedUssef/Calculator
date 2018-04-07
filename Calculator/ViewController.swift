//
//  ViewController.swift
//  Calculator
//
//  Created by Ahmed on 3/28/18.
//  Copyright © 2018 Ahmed. All rights reserved.
//

import UIKit

enum Operation:String {
    case Add = "+"
    case Sub = "-"
    case Divide = "/"
    case Multiply = "*"
    case NULL = "Null"
    
}

class ViewController: UIViewController {
override  var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    @IBOutlet weak var Resultlbl: UILabel!
    
    var Runningnumber = ""
    var Leftnumber = ""
    var Rightnumber = ""
    var Result = ""
    var Currentoperation:Operation = .NULL
    
    @IBAction func Buttonsaction(_ sender: UIButton) {

        if Runningnumber.count <= 8 {
            Runningnumber += "\(sender.tag)"
            Resultlbl.text = Runningnumber
        }
        
    }
    
    @IBAction func Dott(_ sender: UIButton) {
        if Runningnumber.count <= 7 {
            Runningnumber += "."
            Resultlbl.text = Runningnumber
        }
        
    }
    
    @IBAction func Equal(_ sender: UIButton) {
        OPeration(operation: Currentoperation)
    }
    @IBAction func Plus(_ sender: UIButton) {
        OPeration(operation: .Add)
    }
    @IBAction func Minus(_ sender: UIButton) {
    OPeration(operation: .Sub)
    }
    @IBAction func Mul(_ sender: UIButton) {
    OPeration(operation: .Multiply)
    }
    @IBAction func Divide(_ sender: UIButton) {
    OPeration(operation: .Divide)
    }
    
    
    @IBAction func Clear(_ sender: UIButton) {
        Runningnumber = ""
        Leftnumber = ""
        Rightnumber = ""
        Result = ""
        Currentoperation = .NULL
        Resultlbl.text = ""
    }
    
    func OPeration(operation : Operation)
    {
        if Currentoperation != .NULL {
            if Runningnumber != "" {
                Rightnumber = Runningnumber
                Runningnumber = ""
                if Currentoperation == .Add{
                    Result = "\(Double(Leftnumber)! + Double(Rightnumber)!)"
                }
                else if Currentoperation == .Sub{
                    Result = "\(Double(Leftnumber)!-Double(Rightnumber)!)"
                }
                else if Currentoperation == .Divide{
                    Result = "\(Double(Leftnumber)! / Double(Rightnumber)!)"
                }
                else if Currentoperation == .Multiply{
                    Result = "\(Double(Leftnumber)!*Double(Rightnumber)!)"
                }
                Leftnumber = Result
                if(Double(Result)!.truncatingRemainder(dividingBy: 1) == 0){
                    Result = "\(Int(Double(Result)!))"
                }
                Resultlbl.text = Result
            }
            Currentoperation = operation
            
        }
            
        else{
            Leftnumber = Runningnumber
            Runningnumber = ""
            Currentoperation = operation
            
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Putbackground()
        if Resultlbl.text == "0" {
            Resultlbl.text = ""
        }
        
       }
    
  
    func Putbackground() {
        
        let layer : CAGradientLayer = CAGradientLayer()
        layer.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        let Firstcolor = UIColor.init(red: 152/255, green: 53/255, blue:160/255 , alpha: 1).cgColor
        let Secondcolor =  UIColor.init(red: 85/255, green: 116/255, blue: 200/255, alpha: 1).cgColor
        layer.startPoint = CGPoint(x: 0, y: 0.2)
        layer.endPoint = CGPoint(x: 0, y: 0.7)
        layer.colors = [Firstcolor ,Secondcolor]
        self.view.layer.insertSublayer(layer, at: 0)
        
    }


}


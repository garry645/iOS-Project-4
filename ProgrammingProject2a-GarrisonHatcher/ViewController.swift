//
//  ViewController.swift
//  ProgrammingProject2a-GarrisonHatcher
//
//  Created by Garrison Hatcher on 6/21/20.
//  Copyright © 2020 Garrison Hatcher. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var amountTF: UITextField!
    @IBOutlet weak var interestPerPaymentTF: UITextField!
    @IBOutlet weak var amountOfPaymentsTF: UITextField!
    @IBOutlet weak var paymentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func calculatePaymentPerPeriod(_ sender: Any) {
        let amount: Double = Double(amountTF.text!) ?? 0.0
        let interest: Double = Double(interestPerPaymentTF.text!) ?? 0.0
        let amountOfPayments: Int = Int(amountOfPaymentsTF.text!) ?? 0
        
        let payment = mortgagePayment(amount, amountOfPayments, interest)
        
        paymentLabel.text = "$\(payment.format(f: ".2"))"
        
    }
    
   
    
}

func mortgagePayment(_ amount: Double, _ payments: Int, _ interestRate: Double) -> Double {
    let numerator = Double(amount) * interestRate * exponent(interestRate, payments)
    let denomenator = exponent(interestRate, payments) - 1
    return numerator / denomenator
}

func exponent(_ interestRate: Double,_ payments: Int) -> Double {
    let inside: Double = 1 + interestRate;
    return pow(inside, Double(payments))
}

extension Double {
    func format(f: String) -> String {
        return String(format: "%\(f)f", self)
    }
}

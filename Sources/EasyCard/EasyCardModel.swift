//
//  File.swift
//  
//
//  Created by Tushar Singh on 03/10/20.
//

#if canImport(UIKit)
import Foundation
import UIKit

struct EasyCardModel {
    var name:String?
    enum typeEnum:String {
        case debit = "DEBIT"
        case credit = "CREDIT"
    }
    var type:typeEnum?
    enum cardProviderImageEnum:String {
        case masterCard = "MasterCardLogo"
        case visa = "VisaLogo"
        case amex = "AmericanExpressLogo"
        case rupay = "RuPayLogo"
    }

    var cardImage:cardProviderImageEnum?
    var date:String?
    var cardNumber:String?
    
    var frame:CGRect = CGRect(x: 0, y: 0, width: 200, height: 100)
    
    var allColors = [[UIColor.orange.cgColor,UIColor.red.cgColor],[UIColor(red: 48/255, green: 207/255, blue: 208/255, alpha: 1).cgColor,UIColor(red: 51/255, green: 8/255, blue: 103/255, alpha: 1).cgColor],   [UIColor(red: 37/255, green: 117/255, blue: 252/255, alpha: 1).cgColor,UIColor(red: 106/255, green: 17/255, blue: 203/255, alpha: 1).cgColor],  [UIColor(red: 55/255, green: 236/255, blue: 186/255, alpha: 1).cgColor,UIColor(red: 114/255, green: 175/255, blue: 211/255, alpha: 1).cgColor],[UIColor(red: 196/255, green: 113/255, blue: 245/255, alpha: 1).cgColor,UIColor(red: 250/255, green: 113/255, blue: 205/255, alpha: 1).cgColor],[UIColor(red: 2/255, green: 80/255, blue: 197/255, alpha: 1).cgColor,UIColor(red: 212/255, green: 63/255, blue: 141/255, alpha: 1).cgColor],[UIColor(red: 128/255, green: 208/255, blue: 199/255, alpha: 1).cgColor, UIColor(red: 19/255, green: 84/255, blue: 122/255, alpha: 1).cgColor],[UIColor(red: 255/255, green: 8/255, blue: 68/255, alpha: 1).cgColor, UIColor(red: 255/255, green: 177/255, blue: 153/255, alpha: 1).cgColor],[UIColor(red: 67/255, green: 67/255, blue: 67/255, alpha: 1).cgColor, UIColor.black.cgColor],[UIColor(red: 230/255, green: 100/255, blue: 19/255, alpha: 1).cgColor,UIColor(red: 138/255, green: 23/255, blue: 159/255, alpha: 1).cgColor ],[UIColor(red: 229/255, green: 95/255, blue: 106/255, alpha: 1).cgColor, UIColor(red: 49/255, green: 133/255, blue: 185/255, alpha: 1).cgColor],[UIColor(red: 185/255, green: 16/255, blue: 208/255, alpha: 1).cgColor, UIColor(red: 95/255, green: 116/255, blue: 229/255, alpha: 1).cgColor]]
    
        
    var random:Int = 0
}


#endif

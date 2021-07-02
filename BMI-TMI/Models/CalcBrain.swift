//
//  File.swift
//  BMI-TMI
//
//  Created by C. Jordan Ball III on 7/1/21.
//

import UIKit


struct CalcBrain {
    
    var bmi: BMI?
    
    mutating func calculateBMI(_ height: Float, _ weight: Float) -> Void {
        let bmiValue = Float(weight / pow(height, 2.0) * 703);
        var bmiAdvice: String;
        var bmiColor: UIColor;
        
        switch(bmiValue) {
        case ..<18.5:
            bmiAdvice = "You may wish to consider increasing caloric intake.";
            bmiColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1);
        case 18.5..<25.0:
            bmiAdvice = "You are in a good zone. Keep it up!";
            bmiColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1);
        case 25...:
            bmiAdvice = "You may wish to consider a lifestyle change!";
            bmiColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1);
        default:
            bmiAdvice = "Error - not within range!";
            bmiColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
        
        bmi = BMI(value: bmiValue, advice: bmiAdvice, color: bmiColor);
    }
    
    func getBMIValue() -> String {
        return String(format: "%.1f", bmi?.value ?? 0.0);
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "Oops!";
    }
    
    func getBackground() -> UIColor {
        return bmi?.color ?? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}

//
//  ViewController.swift
//  BMI-TMI
//
//  Created by C. Jordan Ball III on 6/29/21.
//

import UIKit

class CalcViewController: UIViewController {
    
    var calcBrain = CalcBrain();

    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heightSlider.value = 60;
        weightSlider.value = 150;
        height.text = "5 ft, 0 in";
        weight.text = "150 lbs"
    }
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let newHeight = Int(sender.value.rounded());
        
        let feet = String(newHeight / 12);
        
        let inches = String(newHeight % 12);

        height.text = feet + " ft, " + inches + " in"
    }
    
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weight.text = "\(String(Int(sender.value))) lbs";
    }
    
    
    @IBAction func calcBMI(_ sender: UIButton) {
        let height = heightSlider.value;
        let weight = weightSlider.value;
        calcBrain.calculateBMI(height, weight);
        
        self.performSegue(withIdentifier: "goToResult", sender: self);
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToResult") {
            let destinationVC = segue.destination as! ResultViewController;
//            destinationVC.bmiValue = calcBrain.getBMIValue();
//            destinationVC.advice = calcBrain.getAdvice();
            destinationVC.view.backgroundColor = calcBrain.getBackground();
            destinationVC.adviceLabel.text = calcBrain.getAdvice();
            destinationVC.BMIResult.text = calcBrain.getBMIValue();
        }
    }
}


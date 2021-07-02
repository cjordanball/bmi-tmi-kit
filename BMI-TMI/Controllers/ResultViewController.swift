//
//  ResultViewController.swift
//  BMI-TMI
//
//  Created by C. Jordan Ball III on 7/1/21.
//

import UIKit

class ResultViewController: UIViewController {
    
    var bmiValue: String?
    var advice: String?
    var color: UIColor?
    
    @IBOutlet weak var BMIResult: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func recalcPressed(_ sender: UIButton) {
        self.dismiss(animated: true);
    }
}

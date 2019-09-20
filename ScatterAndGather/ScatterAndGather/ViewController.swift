//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Fabiola S on 9/20/19.
//  Copyright © 2019 Fabiola Saga. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isScattered: Bool?
    
    let letterEl = UILabel()
    let letterA = UILabel()
    let letterM = UILabel()
    let letterB = UILabel()
    let letterD = UILabel()
    let letterLastA = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabels()
    }

    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        
    }
    
    
    func configureLabels() {
        labelInit(label: letterEl)
        labelInit(label: letterA)
        labelInit(label: letterM)
        labelInit(label: letterB)
        labelInit(label: letterD)
        labelInit(label: letterLastA)
    }
    
    func labelInit(label: UILabel) {
        switch label {
        case letterEl:
            label.frame = CGRect(x: 5, y: 100, width: 80, height: 80)
            label.text = "L"
        case letterA:
            label.frame = CGRect(x: 65, y: 100, width: 80, height: 80)
            label.text = "A"
        case letterM:
            label.frame = CGRect(x: 135, y: 100, width: 80, height: 80)
            label.text = "M"
        case letterB:
            label.frame = CGRect(x: 200, y: 100, width: 80, height: 80)
            label.text = "B"
        case letterD:
            label.frame = CGRect(x: 260, y: 100, width: 80, height: 80)
            label.text = "D"
        case letterLastA:
            label.frame = CGRect(x: 320, y: 100, width: 80, height: 80)
            label.text = "A"
        
        default:
            print("Error")
        }
        
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.shadowColor = UIColor.gray.cgColor
        label.layer.shadowOffset = CGSize(width: 1, height: 3.0)
        label.layer.shadowRadius = 2.0
        label.layer.shadowOpacity = 0.5
        label.layer.masksToBounds = false
        label.font = UIFont.systemFont(ofSize: 80)
        label.textColor = .black
        label.textAlignment = .center
    }
   
    

}


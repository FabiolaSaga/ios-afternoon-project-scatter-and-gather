//
//  ViewController.swift
//  ScatterAndGather
//
//  Created by Fabiola S on 9/20/19.
//  Copyright © 2019 Fabiola Saga. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isScattered: Bool = false
    let lambdaLogo = UIImageView()
    let randomColor = UIColor.random
    
    let letterEl = UILabel()
    let letterA = UILabel()
    let letterM = UILabel()
    let letterB = UILabel()
    let letterD = UILabel()
    let letterLastA = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabels()
        configureImageView()
    }

    @IBAction func toggleButtonPressed(_ sender: UIBarButtonItem) {
        isScattered.toggle()
        
        if isScattered == true {
            scatterAnimation(label: letterEl)
            scatterAnimation(label: letterA)
            scatterAnimation(label: letterM)
            scatterAnimation(label: letterB)
            scatterAnimation(label: letterD)
            scatterAnimation(label: letterLastA)
            logoFadeOut()
        } else {
            logoFadeInt()
            gatherAnimation(label: letterEl)
            gatherAnimation(label: letterA)
            gatherAnimation(label: letterM)
            gatherAnimation(label: letterB)
            gatherAnimation(label: letterD)
            gatherAnimation(label: letterLastA)
        }
        
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
            label.frame = CGRect(x: 5, y: 100, width: 70, height: 80)
            label.text = "L"
        case letterA:
            label.frame = CGRect(x: 65, y: 100, width: 70, height: 80)
            label.text = "A"
        case letterM:
            label.frame = CGRect(x: 135, y: 100, width: 70, height: 80)
            label.text = "M"
        case letterB:
            label.frame = CGRect(x: 200, y: 100, width: 70, height: 80)
            label.text = "B"
        case letterD:
            label.frame = CGRect(x: 260, y: 100, width: 70, height: 80)
            label.text = "D"
        case letterLastA:
            label.frame = CGRect(x: 320, y: 100, width: 70, height: 80)
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
    
    func configureImageView() {
        view.addSubview(lambdaLogo)
        let logoImage = UIImage(named: "lambda_logo")
        lambdaLogo.image = logoImage
        lambdaLogo.frame = CGRect(x: 0, y: 250, width: 350, height: 100)
        lambdaLogo.center = view.center
        
    }
    
    func setRandomColor() -> UIColor {
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
    
    // MARK: Animations
    
    func logoFadeOut() {
        UIImageView.animate(withDuration: 3.0) {
            self.lambdaLogo.alpha = 0
        }
    }
    
    func logoFadeInt() {
        UIImageView.animate(withDuration: 3.0) {
            self.lambdaLogo.alpha = 100
        }
    }
    
    func scatterAnimation(label: UILabel) {
        UILabel.animate(withDuration: 3.0) {
            label.transform = CGAffineTransform(rotationAngle: CGFloat.random(in: 1...100))
            label.transform = CGAffineTransform(translationX: CGFloat.random(in: 1...700), y: CGFloat.random(in: 1...700))
            label.backgroundColor = self.setRandomColor()
            label.textColor = self.setRandomColor()
        }

    }
    
    func gatherAnimation(label: UILabel) {
        UILabel.animate(withDuration: 3.0) {
            label.transform = .identity
            label.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
            label.textColor = .black
        }
    }
   
    

}

extension CGFloat {
    static var random: CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random, green: .random, blue: .random, alpha: 1.0)
    }
}


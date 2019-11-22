//
//  DetailedColorController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Juan Ceballos on 11/22/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailedColorController: UIViewController {

    @IBOutlet weak var background: UIView!
    @IBOutlet weak var colorLabel: UILabel! //
    @IBOutlet weak var redLabel: UILabel! //
    @IBOutlet weak var greenLabel: UILabel! //
    @IBOutlet weak var blueLabel: UILabel! //
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaLabel: UILabel! //
    @IBOutlet weak var alphaStepper: UIStepper!
    @IBOutlet weak var resetButton: UIButton!
    
    var crayon = Crayon(name: "", red: 0, green: 0, blue: 0, hex: "")
    let doubleToCGFloatDenominator: Double = 255
    var alphaDefaultValue = Float(1)
    var realAlphaDefault = Float(1)
    
    lazy var updatedCrayon = crayon
    lazy var redValue = Float(((updatedCrayon.red / doubleToCGFloatDenominator) * 100).rounded(.toNearestOrAwayFromZero) / 100)
    lazy var greenValue = Float(((updatedCrayon.green / doubleToCGFloatDenominator) * 100).rounded(.toNearestOrAwayFromZero) / 100)
    lazy var blueValue = Float(((updatedCrayon.blue / doubleToCGFloatDenominator) * 100).rounded(.toNearestOrAwayFromZero) / 100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        configureSliders()
        configureStepper()
    }
    
    func updateUI() {
        
        redLabel.text = "R: \(redValue)"
        greenLabel.text = "G: \(greenValue)"
        blueLabel.text = "B: \(blueValue)"
        alphaLabel.text = "Alpha: \(alphaDefaultValue)"
        colorLabel.text = "\(updatedCrayon.name)"
        background.backgroundColor = UIColor(displayP3Red: CGFloat(redValue), green: CGFloat(greenValue), blue: CGFloat(blueValue), alpha: CGFloat(alphaDefaultValue))
    }
    
    func configureSliders() {
        redSlider.minimumValue = 0
        greenSlider.minimumValue = 0
        blueSlider.minimumValue = 0
        
        redSlider.maximumValue = 1
        greenSlider.maximumValue = 1
        blueSlider.maximumValue = 1
        
        redSlider.value = redValue
        greenSlider.value = greenValue
        blueSlider.value = blueValue
    }
    
    func configureStepper() {
        alphaStepper.minimumValue = 0
        alphaStepper.maximumValue = 1
        alphaStepper.value = Double(alphaDefaultValue)
        alphaStepper.stepValue = 0.1
    }
    
    func resetColor()   {
        redLabel.text = "R: \(((crayon.red / doubleToCGFloatDenominator) * 100).rounded(.toNearestOrEven) / 100)"
        greenLabel.text = "G: \(((crayon.green / doubleToCGFloatDenominator) * 100).rounded(.toNearestOrEven) / 100))"
        blueLabel.text = "B: \(((crayon.blue / doubleToCGFloatDenominator) * 100).rounded(.toNearestOrEven) / 100))"
        alphaLabel.text = "Alpha: \(realAlphaDefault)"
        colorLabel.text = "\(updatedCrayon.name)"
        background.backgroundColor = UIColor(displayP3Red: CGFloat(crayon.red), green: CGFloat(crayon.green), blue: CGFloat(crayon.blue), alpha: CGFloat(realAlphaDefault))
    }
    
    @IBAction func redSliderChanged(_ sender: UISlider) {
        redValue = sender.value
        redLabel.text = "R: \((redValue * 100).rounded(.toNearestOrAwayFromZero) / 100)"
        background.backgroundColor = UIColor(displayP3Red: CGFloat(redValue), green: CGFloat(greenValue), blue: CGFloat(blueValue), alpha: CGFloat(alphaDefaultValue))
    }
    
    @IBAction func greenSliderChanged(_ sender: UISlider) {
        greenValue = sender.value
        greenLabel.text = "R: \((greenValue * 100).rounded(.toNearestOrAwayFromZero) / 100)"
        background.backgroundColor = UIColor(displayP3Red: CGFloat(redValue), green: CGFloat(greenValue), blue: CGFloat(blueValue), alpha: CGFloat(alphaDefaultValue))
    }
    
    @IBAction func blueSliderChanged(_ sender: UISlider)   {
        blueValue = sender.value
        blueLabel.text = "R: \((blueValue * 100).rounded(.toNearestOrAwayFromZero) / 100)"
        background.backgroundColor = UIColor(displayP3Red: CGFloat(redValue), green: CGFloat(greenValue), blue: CGFloat(blueValue), alpha: CGFloat(alphaDefaultValue))
    }
    
    
    @IBAction func alphaStepperChanged(_ sender: UIStepper) {
        alphaDefaultValue = Float(sender.value)
        alphaLabel.text = "Alpha: \((alphaDefaultValue * 100) .rounded(.toNearestOrAwayFromZero) / 100)"
        background.backgroundColor = UIColor(displayP3Red: CGFloat(redValue), green: CGFloat(greenValue), blue: CGFloat(blueValue), alpha: CGFloat(alphaDefaultValue))
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        resetColor()
    }
    
}



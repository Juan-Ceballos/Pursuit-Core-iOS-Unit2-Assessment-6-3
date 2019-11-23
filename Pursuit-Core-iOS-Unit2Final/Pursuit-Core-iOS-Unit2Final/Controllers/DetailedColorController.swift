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
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaLabel: UILabel!
    @IBOutlet weak var alphaStepper: UIStepper!
    @IBOutlet weak var resetButton: UIButton!
    
   var crayon:Crayon = Crayon(name: "", red: 0, green: 0, blue: 0, hex: "")
    
    let doubleToCGFloatDenominator: Double = 255
    var alphaDefaultValue = Float(1)
    lazy var alphaValueUpdate = alphaDefaultValue
    
    lazy var updatedCrayon = crayon
    lazy var redValue = Float(((updatedCrayon.red / doubleToCGFloatDenominator) * 100).rounded(.toNearestOrAwayFromZero) / 100)
    lazy var greenValue = Float(((updatedCrayon.green / doubleToCGFloatDenominator) * 100).rounded(.toNearestOrAwayFromZero) / 100)
    lazy var blueValue = Float(((updatedCrayon.blue / doubleToCGFloatDenominator) * 100).rounded(.toNearestOrAwayFromZero) / 100)
    lazy var updateRed:Float = redValue
    lazy var updateBlue:Float = blueValue
    lazy var updateGreen:Float = greenValue
    
    
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
        redLabel.text = "R: \(redValue)"
        greenLabel.text = "G: \(greenValue)"
        blueLabel.text = "B: \(blueValue)"
        alphaLabel.text = "Alpha: \(alphaDefaultValue)"
        background.backgroundColor = UIColor(displayP3Red: CGFloat(redValue), green: CGFloat(greenValue), blue: CGFloat(blueValue), alpha: CGFloat(alphaDefaultValue))
        redSlider.value = redValue
        greenSlider.value = greenValue
        blueSlider.value = blueValue
        updateGreen = greenValue
        updateBlue = blueValue
        updateRed = redValue
        alphaValueUpdate = alphaDefaultValue
        alphaStepper.value = Double(alphaDefaultValue)
    }
    
    @IBAction func redSliderChanged(_ sender: UISlider) {
        updateRed = sender.value
        redLabel.text = "R: \((updateRed * 100).rounded(.toNearestOrAwayFromZero) / 100)"
        background.backgroundColor = UIColor(displayP3Red: CGFloat(updateRed), green: CGFloat(updateGreen), blue: CGFloat(updateBlue), alpha: CGFloat(alphaValueUpdate))
    }

    
    @IBAction func greenSliderChanged(_ sender: UISlider) {
        updateGreen = sender.value
        greenLabel.text = "G: \((updateGreen * 100).rounded(.toNearestOrAwayFromZero) / 100)"
        background.backgroundColor = UIColor(displayP3Red: CGFloat(updateRed), green: CGFloat(updateGreen), blue: CGFloat(updateBlue), alpha: CGFloat(alphaValueUpdate))
    }
    
    @IBAction func blueSliderChanged(_ sender: UISlider)   {
        updateBlue = sender.value
        blueLabel.text = "B: \((updateBlue * 100).rounded(.toNearestOrAwayFromZero) / 100)"
        background.backgroundColor = UIColor(displayP3Red: CGFloat(updateRed), green: CGFloat(updateGreen), blue: CGFloat(updateBlue), alpha: CGFloat(alphaValueUpdate))
    }
    
    @IBAction func alphaStepperChanged(_ sender: UIStepper) {
        alphaValueUpdate = Float(sender.value)
        alphaLabel.text = "Alpha: \((alphaValueUpdate * 100) .rounded(.toNearestOrAwayFromZero) / 100)"
        background.backgroundColor = UIColor(displayP3Red: CGFloat(updateRed), green: CGFloat(updateGreen), blue: CGFloat(updateBlue), alpha: CGFloat(alphaValueUpdate))
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        resetColor()
    }
}



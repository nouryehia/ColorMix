/* ViewController.swift
   ColorMix
   Created by Nour Yehia on 7/29/18.
   Copyright © 2018 Nour Yehia. All rights reserved. */

import UIKit

class ViewController: UIViewController {
    
    // Declare variables.
    var lastRed: Float = 1
    var lastGreen: Float = 1
    var lastBlue: Float = 1
    
    // Declare outlets.
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redSwitch: UISwitch!
    @IBOutlet weak var greenSwitch: UISwitch!
    @IBOutlet weak var blueSwitch: UISwitch!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!

    // Called once the view controller has loaded its view hierarchy into memory.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Round color view's corners.
        colorView.layer.cornerRadius = 20
        colorView.layer.borderWidth = 5
        // Create a border.
        colorView.layer.borderColor = UIColor.lightGray.cgColor
        
        // Update screen to default state.
        updateColor()
        updateControls()
    }

    // Makes appropriate changes when switches are turned on/off.
    @IBAction func switchChanged(_ sender: UISwitch) {
        updateControls()
        updateColor()
    
    }
    
    // Updates color view color when slider values are changed.
    @IBAction func sliderChanged(_ sender: Any) {
        updateColor()
    }
    
    // Resets the view when the reset button is tapped.
    @IBAction func resetButtonTapped(_ sender: Any) {
        redSlider.value = 0
        redSwitch.isOn = false
        greenSlider.value = 0
        greenSwitch.isOn = false
        blueSlider.value = 0
        blueSwitch.isOn = false
        lastRed = 1
        lastGreen = 1
        lastBlue = 1
        updateColor()
        updateControls()
    }
    
    // Updates color view based on states/values of switches/sliders.
    func updateColor() {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        // If red switch is on, update slider and corresponding value. Otherwise, reset to default.
        if redSwitch.isOn {
            //Change the hue of red.
            red = CGFloat(redSlider.value)
            // Subsequently update slider color and text color/value.
            redSlider.minimumTrackTintColor = UIColor(red: red, green: 0, blue: 0, alpha: 1)
            redLabel.textColor = UIColor(red: red, green: 0, blue: 0, alpha: 1)
            redLabel.text = String(Int(redSlider.value*255))
            // Update last held value
            lastRed = redSlider.value == 0 ? 1 : redSlider.value
        }
        else {
            redLabel.text = "0"
            redLabel.textColor = .red
        }
        // If green switch is on, update slider and corresponding value. Otherwise, reset to default.
        if greenSwitch.isOn {
            //Change the hue of green.
            green = CGFloat(greenSlider.value)
            // Subsequently update slider color and text color/value.
            greenSlider.minimumTrackTintColor = UIColor(red: 0, green: green, blue: 0, alpha: 1)
            greenLabel.text = String(Int(greenSlider.value*255))
            greenLabel.textColor = UIColor(red: 0, green: green, blue: 0, alpha: 1)
            // Update last held value
            lastGreen = greenSlider.value == 0 ? 1 : greenSlider.value
        }
        else {
            greenLabel.text = "0"
            greenLabel.textColor = .green
        }
        // If blue switch is on, update slider and corresponding value. Otherwise, reset to default.
        if blueSwitch.isOn {
            //Change the hue of blue.
            blue = CGFloat(blueSlider.value)
            // Subsequently update slider color and text color/value.
            blueSlider.minimumTrackTintColor = UIColor(red: 0, green: 0, blue: blue, alpha: 1)
            blueLabel.text = String(Int(blueSlider.value*255))
            blueLabel.textColor = UIColor(red: 0, green: 0, blue: blue, alpha: 1)
            // Update last held value
            lastBlue = blueSlider.value == 0 ? 1 : blueSlider.value
        }
        else {
            blueLabel.text = "0"
            blueLabel.textColor = .blue
        }
        // Update color view.
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
        colorView.backgroundColor = color
    }
    
    // Updates the state of the sliders.
    func updateControls() {
        // Enable/Disable sliders based on state of switches.
        redSlider.isEnabled = redSwitch.isOn
        blueSlider.isEnabled = blueSwitch.isOn
        greenSlider.isEnabled = greenSwitch.isOn
        
        // If it is the first time turning on switch the give slider the maximum value. Otherwise give it the last value it had.
        redSlider.value = redSwitch.isOn ? lastRed : 0
        greenSlider.value = greenSwitch.isOn ? lastGreen : 0
        blueSlider.value = blueSwitch.isOn ? lastBlue : 0
    }
}

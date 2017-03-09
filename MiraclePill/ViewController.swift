//
//  ViewController.swift
//  MiraclePill
//
//  Created by Piotr Piotrowski on 08/03/2017.
//  Copyright © 2017 Piotr Piotrowski. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var statePickerBtn: UIButton!
    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var countryText: UITextField!
    @IBOutlet weak var zipCodeLbl: UILabel!
    @IBOutlet weak var zipCodeText: UITextField!
    @IBOutlet weak var buyNowBtn: UIButton!
    @IBOutlet weak var successIndicatorImg: UIImageView!
    
    let states = ["Alaska", "Arkansas", "Alabama", "California", "Maine", "New York"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statePicker.dataSource = self
        statePicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func stateBtnPressed(_ sender: Any) {
        statePicker.isHidden = false
        countryLbl.isHidden = true
        countryText.isHidden = true
        zipCodeLbl.isHidden = true
        zipCodeText.isHidden = true
    }

    @IBAction func buyNowBtnPressed(_ sender: Any) {
        for view in self.view.subviews as [UIView] {
            view.isHidden = true
        }
        successIndicatorImg.isHidden = false
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        statePickerBtn.setTitle(states[row], for: UIControlState.normal)
        statePicker.isHidden = true
        countryLbl.isHidden = false
        countryText.isHidden = false
        zipCodeLbl.isHidden = false
        zipCodeText.isHidden = false
    }
}


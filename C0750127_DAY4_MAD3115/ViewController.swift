//
//  ViewController.swift
//  C0750127_DAY4_MAD3115
//
//  Created by Baturay Kayatürk on 2019-03-08.
//  Copyright © 2019 Lambton College. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var countryPicker: UIPickerView!
    
    //var array : [String] = ["Turkey","UK","USA","Canada","Brazil","China","India","Mexico","Japan","Spain","Holland"]
    
    //var cities : [String] = ["NYC","Toronto","LA","Chicago","Vancouver"]
    
    var countries = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.countryPicker.delegate = self
        self.countryPicker.dataSource = self
        countries.append(Country(name: "UK", cities: ["London","Manchester"]))
        countries.append(Country(name: "USA", cities: ["NYC","LA"]))
        countries.append(Country(name: "Turkey", cities: ["Istanbul","Ankara"]))
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func datePicker(_ sender: UIDatePicker) {
        print(sender.date)
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "MM/dd/yyyy"
        lblDate.text = inputFormatter.string(from: sender.date)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //return self.array.count
        //return self.cities.count
        if component == 0 {
            return countries.count
        } else if component == 1 {
            let selectedCountry = pickerView.selectedRow(inComponent: 0)
            return countries[selectedCountry].getCities().count
        } else {
            return 0
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //return self.array[row]
        //return self.cities[row]
        if component == 0 {
            return countries[row].getNames()
        } else if component == 1 {
            let selectedCountry = pickerView.selectedRow(inComponent: 0)
            return countries[selectedCountry].getCities()[row]
        } else {
            return ""
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerView.reloadComponent(0)
        pickerView.reloadComponent(1)
        let r = countryPicker.selectedRow(inComponent: 0)
        let c = countryPicker.selectedRow(inComponent: 1)
        lblDate.text = self.countries[r].getNames() + " " + self.countries[r].getCities()[c]
        //lblDate.text = self.cities[row]
    }
    
    
}


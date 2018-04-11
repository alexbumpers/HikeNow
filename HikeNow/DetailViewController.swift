//
//  DetailViewController.swift
//  mapSearch2
//
//  Created by Alex Bumpers on 4/9/18.
//  Copyright © 2018 Alex Bumpers. All rights reserved.
//

import Foundation
import UIKit
class DetailViewController: UIViewController {
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var tripLengthStepper: UIStepper!
    @IBOutlet weak var tripLengthLabel: UILabel!
    
    var place: Places? {
        let tripLength = Int(tripLengthStepper.value)
        //let descriptionLabel = detailPlaces?.searchItem.
        let descriptionLabel = detailDescriptionLabel.text ?? ""
//        let email = emailTextField.text ?? ""
//        let checkInDate = checkInDatePicker.date
//        let checkOutDate = checkOutDatePicker.date
//        let numberOfAdults = Int(numberOfAdultsStepper.value)
//        let numberOfChildren = Int(numberOfChildrenStepper.value)
//        let hasWifi = wifiSwitch.isOn
        
        return Places(searchItem: descriptionLabel,
                      tripLength: tripLength)
    }
    
    
    var detailPlaces: Places? {
        didSet {
            configureView()
        }
    }

    
    @objc func changeLabelText() {
        tripLengthLabel.text = "\(Int(tripLengthStepper.value))"
    }
    
    func updateTripLength() {
        // Convert String values of steppers to Integers and set the labels to those values
        tripLengthStepper.addTarget(self, action: #selector(DetailViewController.changeLabelText), for: .valueChanged)
    }
    
    func configureView() {
        if let detailPlaces = detailPlaces {
            if let detailDescriptionLabel = detailDescriptionLabel {
                detailDescriptionLabel.text = detailPlaces.searchItem
                updateTripLength()
                title = "\(detailPlaces.searchItem) Trip Info"
            }
        }
    }

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}

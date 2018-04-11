//
//  DetailViewController.swift
//  HikeNow
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
    @IBOutlet weak var leaveDateLabel: UILabel!
    @IBOutlet weak var leaveDatePicker: UIDatePicker!
    @IBOutlet weak var returnDateLabel: UILabel!
    @IBOutlet weak var returnDatePicker: UIDatePicker!
    
    var place: Places? {
        let tripLength = Int(tripLengthStepper.value)
        let descriptionLabel = detailDescriptionLabel.text ?? ""
        let leaveDate = leaveDatePicker.date
        let returnDate = returnDatePicker.date
        
        return Places(searchItem: descriptionLabel,
                      tripLength: tripLength,
                      leaveDate: leaveDate,
                      returnDate: returnDate
        )
    }
    
    var detailPlaces: Places? {
        didSet {
            configureView()
        }
    }

    @objc func changeLabelText() {
        tripLengthLabel.text = "\(Int(tripLengthStepper.value))"
    }
    
    func changeLeaveLabelText() {
        leaveDateLabel.text = "\(leaveDatePicker)"
    }
    
    func changeReturnLabelText() {
        returnDateLabel.text = "\(returnDatePicker.date)"
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
//                changeLeaveLabelText()
//                changeReturnLabelText()
                print(place?.leaveDate)
                print(place?.returnDate)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}

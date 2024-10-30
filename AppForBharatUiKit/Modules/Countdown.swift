//
//  CountdownViewController.swift
//  AppForBharatUiKit
//
//  Created by Bholanath Barik on 29/10/24.
//

import UIKit

class CountdownView: UIView {
    
    // Labels for days, hours, minutes, and seconds
    private let daysLabel = CountdownUnitView(unit: "Days")
    private let hoursLabel = CountdownUnitView(unit: "Hours")
    private let minutesLabel = CountdownUnitView(unit: "Mins")
    private let secondsLabel = CountdownUnitView(unit: "Sec")
    
    init() {
        super.init(frame: .zero)
        
        // Instruction label
        let instructionLabel = UILabel()
        instructionLabel.text = "Booking will close in :"
        instructionLabel.font = UIFont.systemFont(ofSize: 14)
        instructionLabel.textColor = .gray
        instructionLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(instructionLabel)
        
        // Stack view to hold countdown units
        let countdownStack = UIStackView(arrangedSubviews: [daysLabel, hoursLabel, minutesLabel, secondsLabel])
        countdownStack.axis = .horizontal
        countdownStack.spacing = 8
        countdownStack.alignment = .center
        countdownStack.distribution = .fillEqually
        countdownStack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(countdownStack)
        
        // Set constraints
        NSLayoutConstraint.activate([
            instructionLabel.topAnchor.constraint(equalTo: topAnchor),
            instructionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            countdownStack.topAnchor.constraint(equalTo: instructionLabel.bottomAnchor, constant: 8),
            countdownStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            countdownStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            countdownStack.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


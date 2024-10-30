//
//  CountdownUnitView.swift
//  AppForBharatUiKit
//
//  Created by Bholanath Barik on 29/10/24.
//

import UIKit

class CountdownUnitView: UIView {
    
    private let valueLabel = UILabel()
    private let unitLabel = UILabel()
    
    init(unit: String) {
        super.init(frame: .zero)
        
        // Setup value label
        valueLabel.text = "00"  // Initial value, can be updated
        valueLabel.font = UIFont.boldSystemFont(ofSize: 18)
        valueLabel.textColor = .systemPink
        valueLabel.textAlignment = .center
        
        // Setup unit label
        unitLabel.text = unit
        unitLabel.font = UIFont.systemFont(ofSize: 9)
        unitLabel.textColor = .systemPink
        unitLabel.textAlignment = .center
        
        // Stack view to hold value and unit
        let stackView = UIStackView(arrangedSubviews: [valueLabel, unitLabel])
        stackView.axis = .horizontal
        stackView.spacing = 2
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        // Set background and corner radius
        backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        layer.cornerRadius = 8
        layer.masksToBounds = true
        
        // Set constraints
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            widthAnchor.constraint(equalToConstant: 60),
            heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Method to update the value
    func updateValue(_ value: String) {
        valueLabel.text = value
    }
}


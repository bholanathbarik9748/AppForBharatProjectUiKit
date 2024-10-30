//
//  SectionTitle.swift
//  AppForBharatUiKit
//
//  Created by Bholanath Barik on 29/10/24.
//

import UIKit

class SectionTitleView: UIView {
    init(title: String) {
        super.init(frame: .zero)
        
        // Set up the view
        layer.borderColor = UIColor.blue.cgColor
        layer.borderWidth = 2
        layer.cornerRadius = 5
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        
        // Create the title label
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        titleLabel.textColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Add the label to the view
        addSubview(titleLabel)
        
        // Set constraints for the label within the container view
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  MovieInfoViewViewController.swift
//  AppForBharatUiKit
//
//  Created by Bholanath Barik on 29/10/24.
//

import UIKit

class MovieInfo: UIView {
    init() {
        super.init(frame: .zero)
        
        // Configure the main stack view
        let mainStackView = UIStackView()
        mainStackView.axis = .vertical
        mainStackView.spacing = 8
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(mainStackView)
        
        // Special Tag Label
        let tagLabel = UILabel()
        tagLabel.text = "SPECIAL TAG - BLOCKBUSTER"
        tagLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        tagLabel.textColor = .systemPink
        mainStackView.addArrangedSubview(tagLabel)
        
        // Separator line
        let separatorLine = UIView()
        separatorLine.backgroundColor = .systemPink
        separatorLine.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.addArrangedSubview(separatorLine)
        separatorLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        // Title Label
        let titleLabel = UILabel()
        titleLabel.text = "Title - Mad Max saga : Fury Road"
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        titleLabel.textColor = .black
        mainStackView.addArrangedSubview(titleLabel)
        
        // Body Text Label
        let bodyTextLabel = UILabel()
        bodyTextLabel.text = "Body text - When the world is taken by darkness, A hero will rise."
        bodyTextLabel.font = UIFont.systemFont(ofSize: 14)
        bodyTextLabel.textColor = .darkGray
        bodyTextLabel.numberOfLines = 0
        mainStackView.addArrangedSubview(bodyTextLabel)
        
        // Location and Time Stack
        let locationTimeStack = UIStackView()
        locationTimeStack.axis = .vertical
        locationTimeStack.spacing = 4
        locationTimeStack.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.addArrangedSubview(locationTimeStack)
        
        // Location Label with Icon
        let locationStack = UIStackView()
        locationStack.axis = .horizontal
        locationStack.spacing = 4
        
        let locationIcon = UIImageView(image: UIImage(systemName: "mappin.and.ellipse"))
        locationIcon.tintColor = .systemPink
        locationIcon.translatesAutoresizingMaskIntoConstraints = false
        locationIcon.widthAnchor.constraint(equalToConstant: 16).isActive = true
        locationIcon.heightAnchor.constraint(equalToConstant: 16).isActive = true
        locationStack.addArrangedSubview(locationIcon)
        
        let locationLabel = UILabel()
        locationLabel.text = "Cinephile, Bangalore"
        locationLabel.font = UIFont.systemFont(ofSize: 14)
        locationLabel.textColor = .gray
        locationStack.addArrangedSubview(locationLabel)
        
        locationTimeStack.addArrangedSubview(locationStack)
        
        // Time Label with Icon
        let timeStack = UIStackView()
        timeStack.axis = .horizontal
        timeStack.spacing = 4
        
        let timeIcon = UIImageView(image: UIImage(systemName: "calendar"))
        timeIcon.tintColor = .systemPink
        timeIcon.translatesAutoresizingMaskIntoConstraints = false
        timeIcon.widthAnchor.constraint(equalToConstant: 16).isActive = true
        timeIcon.heightAnchor.constraint(equalToConstant: 16).isActive = true
        timeStack.addArrangedSubview(timeIcon)
        
        let timeLabel = UILabel()
        timeLabel.text = "8:30 PM, 28th July, Wednesday"
        timeLabel.font = UIFont.systemFont(ofSize: 14)
        timeLabel.textColor = .gray
        timeStack.addArrangedSubview(timeLabel)
        
        locationTimeStack.addArrangedSubview(timeStack)
        
        // Set constraints for main stack view
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 1),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -1),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


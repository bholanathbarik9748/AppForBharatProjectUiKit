//
//  UserBooking.swift
//  AppForBharatUiKit
//
//  Created by Bholanath Barik on 30/10/24.
//

import UIKit

import UIKit

class UserBookingStatsView: UIView {

    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 4
        return stackView
    }()
    
    private let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = -8 // Negative spacing for overlapping effect
        stackView.alignment = .center
        return stackView
    }()

    private let bookingLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()

    init(users: [String], userCount: Int) {
        super.init(frame: .zero)
        setupView()
        configureView(users: users, userCount: userCount)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        addSubview(verticalStackView)
        
        verticalStackView.addArrangedSubview(horizontalStackView)
        verticalStackView.addArrangedSubview(bookingLabel)

        // Setup constraints for verticalStackView
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            verticalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            verticalStackView.topAnchor.constraint(equalTo: self.topAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

    private func configureView(users: [String], userCount: Int) {
        // Populate the horizontal stack view with user images (placeholder avatars here)
        for _ in 0..<6 {
            let imageView = createUserImageView()
            horizontalStackView.addArrangedSubview(imageView)
        }

        // Configure the booking label with attributed text
        let attributedText = NSMutableAttributedString(string: "Till now ")
        let boldText = NSAttributedString(
            string: "\(userCount)+ Users",
            attributes: [
                .font: UIFont.boldSystemFont(ofSize: 16),
                .foregroundColor: UIColor.systemPink
            ]
        )
        attributedText.append(boldText)
        attributedText.append(NSAttributedString(string: " have already booked tickets."))
        
        bookingLabel.attributedText = attributedText
    }

    private func createUserImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.fill")  // Use system image as placeholder
        imageView.tintColor = .white
        imageView.backgroundColor = .systemPink
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return imageView
    }
}

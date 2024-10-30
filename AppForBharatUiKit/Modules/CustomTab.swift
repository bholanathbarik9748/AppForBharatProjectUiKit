//
//  CustomTab.swift
//  AppForBharatUiKit
//
//  Created by Bholanath Barik on 30/10/24.
//

import UIKit

class CustomTabView: UIView {

    private let tabTitles = ["About", "Cast", "Timings", "Locations", "Production"]
    private var selectedTab: String = "About" {
        didSet {
            updateContent()
        }
    }

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private let tabStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.alignment = .center
        return stackView
    }()

    private let underlineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemPink
        return view
    }()

    private let contentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        label.numberOfLines = 0
        label.textAlignment = .left
        label.text = "Captain America: Civil War centers around the conflict between Captain America and Iron Man over governmental control of superheroes. As a result, the Avengers are divided into two opposing teams, leading to a powerful battle that tests friendships and alliances."
        return label
    }()

    // Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupScrollView()
        setupTabs()
        setupUnderline()
        setupContentLabel()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupScrollView()
        setupTabs()
        setupUnderline()
        setupContentLabel()
    }

    private func setupScrollView() {
        addSubview(scrollView)
        scrollView.addSubview(tabStackView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        tabStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 50),  // Set a fixed height for the tab area

            tabStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            tabStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            tabStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            tabStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            tabStackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
    }

    private func setupTabs() {
        // Add buttons for each tab
        for title in tabTitles {
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            button.setTitleColor(.systemPink, for: .normal)
            button.setTitleColor(.systemPink, for: .selected) // Prevent default blue highlight
            button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
            button.tintColor = .clear // Removes the blue tint color effect entirely
            button.adjustsImageWhenHighlighted = false // Disable highlight effect
            button.adjustsImageWhenDisabled = false
            button.addTarget(self, action: #selector(tabButtonTapped(_:)), for: .touchUpInside)
            button.isSelected = (title == selectedTab)
            tabStackView.addArrangedSubview(button)
        }

        // Set initial selected button appearance
        if let firstButton = tabStackView.arrangedSubviews.first as? UIButton {
            firstButton.isSelected = true
            firstButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        }
    }

    private func setupUnderline() {
        scrollView.addSubview(underlineView)

        // Position underline under the first tab
        underlineView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            underlineView.topAnchor.constraint(equalTo: tabStackView.bottomAnchor, constant: 4),
            underlineView.heightAnchor.constraint(equalToConstant: 2),
            underlineView.widthAnchor.constraint(equalTo: tabStackView.arrangedSubviews[0].widthAnchor),
            underlineView.leadingAnchor.constraint(equalTo: tabStackView.arrangedSubviews[0].leadingAnchor)
        ])
    }

    private func setupContentLabel() {
        addSubview(contentLabel)

        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentLabel.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 16),
            contentLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

    @objc private func tabButtonTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }

        selectedTab = title
        updateSelectedTabAppearance(selectedButton: sender)

        // Move underline to the selected tab
        UIView.animate(withDuration: 0.3) {
            self.underlineView.frame.origin.x = sender.frame.origin.x
        }
    }

    private func updateSelectedTabAppearance(selectedButton: UIButton) {
        // Reset all buttons to unselected state
        for case let button as UIButton in tabStackView.arrangedSubviews {
            button.isSelected = false
            button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
            button.setTitleColor(.gray, for: .normal)
        }

        // Set the selected button's appearance
        selectedButton.isSelected = true
        selectedButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        selectedButton.setTitleColor(.systemGray, for: .normal) // Keep color gray, without blue effect
    }

    private func updateContent() {
        // Update content based on selected tab
        switch selectedTab {
        case "About":
            contentLabel.text = "Captain America: Civil War centers around the conflict between Captain America and Iron Man over governmental control of superheroes. As a result, the Avengers are divided into two opposing teams, leading to a powerful battle that tests friendships and alliances."
        case "Cast":
            contentLabel.text = "Starring Chris Evans as Captain America, Robert Downey Jr. as Iron Man, Scarlett Johansson as Black Widow, and many more. The cast brings to life an intense and emotional story of divided loyalties."
        case "Timings":
            contentLabel.text = "Available showtimes: 12:00 PM, 3:30 PM, 6:00 PM, and 9:00 PM daily at selected theaters."
        case "Locations":
            contentLabel.text = "The movie is available in major theaters nationwide, including AMC, Regal, and Cinemark locations."
        case "Production":
            contentLabel.text = "Produced by Marvel Studios, directed by the Russo brothers, with high-octane action scenes and top-tier visual effects."
        default:
            contentLabel.text = "Select a tab to see more details."
        }
    }
}

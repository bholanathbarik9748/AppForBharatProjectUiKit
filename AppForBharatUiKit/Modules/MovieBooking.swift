//
//  ViewController.swift
//  AppForBharatUiKit
//
//  Created by Bholanath Barik on 29/10/24.
//

import UIKit

class MovieBookingController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the background color to white
        view.backgroundColor = .white

        // Initialize the carousel with image URLs
        let carouselController = Carousel()
        carouselController.imageUrls = [
            "https://images.alphacoders.com/785/thumb-1920-785945.jpg",
            "https://c4.wallpaperflare.com/wallpaper/430/331/687/movies-comics-captain-america-the-first-avenger-men-wallpaper-preview.jpg",
            "https://i.pinimg.com/originals/17/98/04/179804a740ff77021096fca3c7fbdc00.jpg",
        ]

        // Add the carousel as a child view controller
        addChild(carouselController)
        view.addSubview(carouselController.view)
        carouselController.didMove(toParent: self)

        // Set constraints for the carousel
        carouselController.view.translatesAutoresizingMaskIntoConstraints =
            false
        NSLayoutConstraint.activate([
            carouselController.view.topAnchor.constraint(
                equalTo: view.topAnchor, constant: 5),
            carouselController.view.leadingAnchor.constraint(
                equalTo: view.leadingAnchor, constant: 0),
            carouselController.view.trailingAnchor.constraint(
                equalTo: view.trailingAnchor, constant: 0),
            carouselController.view.heightAnchor.constraint(
                equalTo: view.heightAnchor, multiplier: 0.9),
        ])

        // Create the movie info view
        let movieInfoView = MovieInfo()
        view.addSubview(movieInfoView)

        // Set constraints for the movie info view
        movieInfoView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieInfoView.topAnchor.constraint(
                equalTo: carouselController.view.bottomAnchor, constant: -540),
            movieInfoView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor, constant: 20),
            movieInfoView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor, constant: -20),
        ])

        // Add the countdown view below the movie info view
        let countdownView = CountdownView()
        view.addSubview(countdownView)

        // Set constraints for the countdown view
        countdownView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            countdownView.topAnchor.constraint(
                equalTo: movieInfoView.bottomAnchor, constant: 10),
            countdownView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor, constant: 20),
            countdownView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor, constant: -20),
            countdownView.heightAnchor.constraint(equalToConstant: 80),  // Adjust height if needed
        ])

        let userBookingStatsView = UserBookingStatsView(
            users: ["User1", "User2", "User3", "User4", "User5", "User6"],
            userCount: 10000)
        view.addSubview(userBookingStatsView)

        userBookingStatsView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userBookingStatsView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor, constant: 20),
            userBookingStatsView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor, constant: -20),
            userBookingStatsView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 460),
        ])

        let customTabView = CustomTabView()
        view.addSubview(customTabView)

        customTabView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customTabView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor, constant: 20),
            customTabView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor, constant: -20),
            customTabView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 550),
        ])
    }
}

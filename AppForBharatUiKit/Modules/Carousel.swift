//
//  Carousel.swift
//  AppForBharatUiKit
//
//  Created by Bholanath Barik on 29/10/24.
//

import UIKit

class Carousel: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    private var pageViewController: UIPageViewController!
    private let pageControl = UIPageControl()
    
    // URLs to download images for the carousel
    var imageUrls: [String] = []
    private var images: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        
        // Load images from URLs
        loadImages()
        
        // Initialize the Page View Controller
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController.dataSource = self
        pageViewController.delegate = self
        
        // Set the initial page (will be updated after images load)
        if let firstViewController = viewControllerAtIndex(0) {
            pageViewController.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        
        // Add the Page View Controller to the current view
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageViewController.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            pageViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            pageViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            pageViewController.view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.20)
        ])
        
        // Setup Page Control
        pageControl.numberOfPages = imageUrls.count
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = .systemPink
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pageControl)
        NSLayoutConstraint.activate([
            pageControl.topAnchor.constraint(equalTo: pageViewController.view.bottomAnchor, constant: 8),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func loadImages() {
        for urlString in imageUrls {
            guard let url = URL(string: urlString) else { continue }
            let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
                guard let self = self, let data = data, error == nil, let image = UIImage(data: data) else { return }
                
                DispatchQueue.main.async {
                    self.images.append(image)
                    
                    // Reload the page view controller once all images are loaded
                    if self.images.count == self.imageUrls.count {
                        self.pageViewController.setViewControllers([self.viewControllerAtIndex(0)!], direction: .forward, animated: true, completion: nil)
                    }
                }
            }
            task.resume()
        }
    }
    
    // MARK: - Page View Controller Data Source
    
    func viewControllerAtIndex(_ index: Int) -> UIViewController? {
        guard index >= 0 && index < images.count else { return nil }
        
        let contentViewController = UIViewController()
        let imageView = UIImageView(image: images[index])
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 15  // Rounded corners
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        contentViewController.view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentViewController.view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentViewController.view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentViewController.view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentViewController.view.bottomAnchor)
        ])
        
        contentViewController.view.tag = index
        return contentViewController
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = viewController.view.tag
        index -= 1
        return viewControllerAtIndex(index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = viewController.view.tag
        index += 1
        return viewControllerAtIndex(index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed, let visibleViewController = pageViewController.viewControllers?.first {
            pageControl.currentPage = visibleViewController.view.tag
        }
    }
}

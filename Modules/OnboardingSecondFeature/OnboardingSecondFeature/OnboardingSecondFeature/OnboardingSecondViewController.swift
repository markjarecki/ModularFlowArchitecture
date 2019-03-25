//
//  OnboardingSecondViewController.swift
//  OnboardingSecondFeature
//
//  Created by Mark Jarecki on 25/2/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import FLXFlow

open class OnboardingSecondViewController: UIViewController {

    // MARK: - Flow interactors
    
    public var tapFlowInteractor: FlowInteractorProtocol?
    public var edgeSwipeFlowInteractor: FlowInteractorProtocol?
    
    // MARK: - Views
    
    let headerLabel = UILabel()
    let tapHintLabel = UILabel()
    let edgeSwipeHintLabel = UILabel()
    
    // MARK: - View lifecycle overrides
    
    override open func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        // Add the views
        view.addSubview(headerLabel)
        view.addSubview(tapHintLabel)
        view.addSubview(edgeSwipeHintLabel)
        
        // Set label text
        headerLabel.text = "Onboarding Second Feature"
        tapHintLabel.text = "Tap anywhere for Home First Feature"
        edgeSwipeHintLabel.text = "Swipe from the left edge to return to Onboarding First Feature"
        
        // Constraints
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        tapHintLabel.translatesAutoresizingMaskIntoConstraints = false
        edgeSwipeHintLabel.translatesAutoresizingMaskIntoConstraints = false

        // Header label properties
        headerLabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        headerLabel.textAlignment = .center
        headerLabel.textColor = .white
        headerLabel.lineBreakMode = .byWordWrapping
        headerLabel.numberOfLines = 2
        
        // Tap hint label properties
        tapHintLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        tapHintLabel.textAlignment = .center
        tapHintLabel.textColor = .white
        tapHintLabel.lineBreakMode = .byWordWrapping
        tapHintLabel.numberOfLines = 2
        
        // Edge swipe hint label properties
        edgeSwipeHintLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        edgeSwipeHintLabel.textAlignment = .center
        edgeSwipeHintLabel.textColor = .white
        edgeSwipeHintLabel.lineBreakMode = .byWordWrapping
        edgeSwipeHintLabel.numberOfLines = 2
        
        // Anchors
        headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        headerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        headerLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        headerLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        
        tapHintLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tapHintLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        tapHintLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        tapHintLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        
        edgeSwipeHintLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        edgeSwipeHintLabel.centerYAnchor.constraint(equalTo: tapHintLabel.centerYAnchor, constant: -120).isActive = true
        edgeSwipeHintLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        edgeSwipeHintLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
                
    }

}

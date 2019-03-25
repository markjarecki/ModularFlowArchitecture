//
//  HomeFirstViewController.swift
//  HomeFirstFeature
//
//  Created by Mark Jarecki on 25/2/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

import FLXFlow

open class HomeFirstViewController: UIViewController {
    
    // MARK: - Flow interactors
    
    public var tapFlowInteractor: FlowInteractorProtocol?
    
    // MARK: - Views
    
    let headerLabel = UILabel()
    let hintLabel = UILabel()
    
    // MARK: - View lifecycle overrides
    
    override open func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        // Add the views
        view.addSubview(headerLabel)
        view.addSubview(hintLabel)

        // Set label text
        headerLabel.text = "Home First Feature"
        hintLabel.text = "Tap anywhere for Modal Feature"
        
        // Constraints
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        hintLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Header label properties
        headerLabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        headerLabel.textAlignment = .center
        headerLabel.textColor = .black
        headerLabel.lineBreakMode = .byWordWrapping
        headerLabel.numberOfLines = 2
        
        // Hint label properties
        hintLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        hintLabel.textAlignment = .center
        hintLabel.textColor = .black
        hintLabel.lineBreakMode = .byWordWrapping
        hintLabel.numberOfLines = 2
        
        // Anchors
        headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        headerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        headerLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        headerLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        
        hintLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        hintLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        hintLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        hintLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
                
    }

}

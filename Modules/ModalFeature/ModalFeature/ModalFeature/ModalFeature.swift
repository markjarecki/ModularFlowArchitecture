//
//  ModalFeature.swift
//  ModalFeature
//
//  Created by Mark Jarecki on 25/2/19.
//  Copyright © 2019 Mark Jarecki. All rights reserved.
//

// Common
import FLXFlow
import SharedEntities

open class ModalFeature: UIViewController {

    // MARK: - Flow interactors
    
    public var tapFlowInteractor: FlowInteractorProtocol?
    
    // MARK: - Views
    
    let headerLabel = UILabel()
    let tapHintLabel = UILabel()
    
    // MARK: - View model
    
    public var viewModel: OriginEntity? {
        
        didSet {
            
            guard let featureName = viewModel?.featureName else { return }
            tapHintLabel.text = "Tap anywhere to return to \(featureName)"
            
        }
        
    }
    
    // MARK: - View lifecycle overrides
    
    override open func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        // Add the views
        view.addSubview(headerLabel)
        view.addSubview(tapHintLabel)
        
        // Set label text
        headerLabel.text = "Modal Feature"
        
       // Constraints
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        tapHintLabel.translatesAutoresizingMaskIntoConstraints = false
        
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
        
        // Anchors
        headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        headerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        headerLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        headerLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        
        tapHintLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tapHintLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        tapHintLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        tapHintLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true
        
    }

}

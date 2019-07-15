//
//  SpinnerViewController.swift
//  ActivityIndicatorExample
//
//  Created by Smith, Sam on 7/15/19.
//  Copyright © 2019 Smith, Sam. All rights reserved.
//

import UIKit

class SpinnerViewController: UIViewController {
    // Setting the spinner variable
    var spinner = UIActivityIndicatorView(style: .whiteLarge)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        // Setup the UIView to contain the spinner
        view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0.7)
        
        // Since we're setting this up in code, we need to set this to false
        // to match the default setting of elements added in a Storyboard
        spinner.translatesAutoresizingMaskIntoConstraints = false
        
        // Next we start the animation and add the spinner to the main view
        // of this view controller
        spinner.startAnimating()
        view.addSubview(spinner)
        
        // Finally, we can add the AutoLayout constraints so it's centered
        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

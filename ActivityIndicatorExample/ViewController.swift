//
//  ViewController.swift
//  ActivityIndicatorExample
//
//  Created by Smith, Sam on 7/15/19.
//  Copyright © 2019 Smith, Sam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var exampleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func doSomeCalculations(_ sender: Any) {
        // Create our spinner activity indicator
        let child = SpinnerViewController()
        
        // Display the view
        addChild(child)
        child.view.frame = view.frame
        view.addSubview(child.view)
        child.didMove(toParent: self)
        
        // Now some tricky stuff that gets covered in course 2
        // At this point the spinner is live, so we need to start
        // our calculations in the background, and then wait until
        // they're done to remove the spinner and change the label's
        // background
        DispatchQueue.main.async {
            self.lookBusy()
            
            child.willMove(toParent: nil)
            child.view.removeFromSuperview()
            child.removeFromParent()
            
            self.exampleLabel.backgroundColor = .green
        }
    }
    
    // This is mainly to simulate doing some work
    // It finds all the prime numbers between 3 and 20,000
    // (Terrible run time, but good for simulating work)
    func lookBusy() {
        var primes: [Int] = []
        
        for i in 3...20_000 {
            var isPrime = true
            
            for x in 2..<i {
                if i % x == 0 {
                    isPrime = false
                }
            }
            
            if isPrime {
                primes.append(i)
            }
        }
        
    }
}


//
//  ViewController.swift
//  BMICalculate
//
//  Created by Игорь Клевжиц on 09.01.2025.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI
    
    private lazy var backgroundImageView: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "")
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
    }


}


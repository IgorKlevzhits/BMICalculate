//
//  ViewController.swift
//  BMICalculate
//
//  Created by Игорь Клевжиц on 09.01.2025.
//

import UIKit

class CalculateViewController: UIViewController {
    
    // MARK: - UI
    
    private lazy var backgroundImageView: UIImageView = {
        let element = UIImageView()
        element.image = UIImage(named: "calculate_background")
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private var mainStackView = UIStackView()
    
    private var heightStackView = UIStackView()
    private let heightTitleLabel = UILabel(aligment: .left)
    private let heightNumberLabel = UILabel(aligment: .right)
    private let heightSlider = UISlider(maxValue: 3)
    
    private var weightStackView = UIStackView()
    private let weightTitleLabel = UILabel(aligment: .left)
    private let weightNumberLabel = UILabel(aligment: .right)
    private let weightSlider = UISlider(maxValue: 300)
    
    private lazy var titleLabel: UILabel = {
        let element = UILabel()
        element.font = .systemFont(ofSize: 40, weight: .bold)
        element.textColor = .darkGray
        element.textAlignment = .left
        element.numberOfLines = 0
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let calculateButton = UIButton(isBackgroundWhite: false)
    
    // MARK: - Private Properties
    
    private var calculatorBrain = CalculatorBrain()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViews()
        setupConstraints()
    }
    
    @objc private func heightSliderChanged(_ sender: UISlider){
        heightNumberLabel.text = String(format: "%.2f", sender.value) + " m"
    }
    
    @objc private func weightSliderChanged(_ sender: UISlider){
        weightNumberLabel.text = String(format: "%.0f", sender.value) + " Kg"
    }
    
    @objc private func calculateButtonTapped() {
        
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        let resultVC = ResultViewController()
        resultVC.modalTransitionStyle = .coverVertical
        resultVC.modalPresentationStyle = .fullScreen
        
        resultVC.bmiValue = calculatorBrain.getBMIValue()
        resultVC.advice = calculatorBrain.getAdvice()
        resultVC.color = calculatorBrain.getColor()
        
        present(resultVC, animated: true)
    }
}

extension CalculateViewController {
    
    private func setViews() {
        
        heightStackView = UIStackView(
            axis: .horizontal,
            distribution: .fillEqually,
            subViews: [heightTitleLabel, heightNumberLabel]
        )
        
        weightStackView = UIStackView(
            axis: .horizontal,
            distribution: .fillEqually,
            subViews: [weightTitleLabel, weightNumberLabel]
        )
        
        mainStackView = UIStackView(
            axis: .vertical,
            distribution: .fillProportionally,
            subViews: [
                titleLabel,
                heightStackView,
                heightSlider,
                weightStackView,
                weightSlider,
                calculateButton
            ]
        )
        
        view.addSubview(backgroundImageView)
        view.addSubview(mainStackView)
        
        titleLabel.text = "CALCULATE YOUR BMI"
        heightTitleLabel.text = "Height"
        heightNumberLabel.text = "1.5 m"
        
        weightTitleLabel.text = "Weight"
        weightNumberLabel.text = "100 kg"
        
        calculateButton.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        
        heightSlider.addTarget(self, action: #selector(heightSliderChanged), for: .valueChanged)
        weightSlider.addTarget(self, action: #selector(weightSliderChanged), for: .valueChanged)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            heightStackView.heightAnchor.constraint(equalToConstant: 21),
            heightSlider.heightAnchor.constraint(equalToConstant: 60),
            
            weightStackView.heightAnchor.constraint(equalToConstant: 21),
            weightSlider.heightAnchor.constraint(equalToConstant: 60),
            
            calculateButton.heightAnchor.constraint(equalToConstant: 51)
        ])
    }
}


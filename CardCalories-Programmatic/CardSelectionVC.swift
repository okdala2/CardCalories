//
//  CardSelectionVC.swift
//  CardCalories-Programmatic
//
//  Created by Dala  on 6/21/21.
//

import UIKit

class CardSelectionVC: UIViewController {
    
    let cardImageView = UIImageView()
    let stopButton = CCButton(backgroundColor: .systemRed, title: "Stop")
    let restartButton = CCButton(backgroundColor: .systemGreen, title: "Reset")
    let rulesButton = CCButton(backgroundColor: .systemBlue, title: "Rules")

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .blue
        
        configureUI()
    }
    
    func configureUI() {
        configureCardImageView()
    }
    
    func configureCardImageView() {
        view.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.image = UIImage(named: "AS")
        
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)
        ])
    }
    
    func configureStopButton() {
        
    }

}

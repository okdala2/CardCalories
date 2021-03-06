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
    let cardViewTitleLabel = UILabel()
    
    let cards: [UIImage] = CardDeck.allValues
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        configureUI()
        startTimer()
    }
    
     func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomCard), userInfo: nil, repeats: true)
     }
     
     @objc func stopTimer() {
         timer.invalidate()
     }
     
     @objc func resetTimer() {
         stopTimer()
         startTimer()
     }
     
     @objc func showRandomCard() {
         cardImageView.image = cards.randomElement()
     }
    
    func configureUI() {
        configureTitleLabel()
        configureCardImageView()
        configureStopButton()
        configureRestartButton()
        configureRulesButton()
    }
    
    func configureTitleLabel() {
        view.addSubview(cardViewTitleLabel)
        cardViewTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        cardViewTitleLabel.text = "Card Calories"
        cardViewTitleLabel.font = .systemFont(ofSize: 40, weight: .bold)
        cardViewTitleLabel.textAlignment = .center
        cardViewTitleLabel.textColor = .red
        
        NSLayoutConstraint.activate([
            cardViewTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            cardViewTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
          
        ])
    }
    
    func configureCardImageView() {
        view.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.isUserInteractionEnabled = true
        cardImageView.image = UIImage(named: "AS")
        
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)
        ])
    }
    
    func configureStopButton() {
        view.addSubview(stopButton)

        stopButton.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 260),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 30)
        ])
    }
    
    func configureRestartButton() {
        view.addSubview(restartButton)
        
        restartButton.addTarget(self, action: #selector(resetTimer), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            restartButton.widthAnchor.constraint(equalToConstant: 115),
            restartButton.heightAnchor.constraint(equalToConstant: 50),
            restartButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
            restartButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
        ])
    }
    
    func configureRulesButton() {
        view.addSubview(rulesButton)
        
        rulesButton.addTarget(self, action: #selector(rulesButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalToConstant: 115),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
            rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
        ])
    }
    
    @objc func rulesButtonTapped() {
       present(RulesVC(), animated: true, completion: nil)

    }
}

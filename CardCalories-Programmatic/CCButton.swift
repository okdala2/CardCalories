//
//  CCButton.swift
//  CardCalories-Programmatic
//
//  Created by Dala  on 6/21/21.
//

import UIKit

class CCButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        configure()
        self.backgroundColor = backgroundColor
        setTitle(title, for: .normal)
        
    }
    
    func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 8
        titleLabel?.font = UIFont.systemFont(ofSize: 19, weight: .bold)
        setTitleColor(.white, for: .normal)
        isUserInteractionEnabled = true
    }
}

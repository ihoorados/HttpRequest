//
//  MainView.swift
//  HttpRequest
//
//  Created by Hoorad on 6/29/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//

import UIKit

class MainView: UIViewController {
    
    lazy var CTAButton:UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.backgroundColor = #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), for: .highlighted)
        button.setTitle("Request", for: .normal)
        return button
    }()
    
    var viewModel : MainViewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        OptimizeUIlayout()
    }
    
    
    
    func OptimizeUIlayout(){
        
        view.addSubview(CTAButton)
        CTAButton.translatesAutoresizingMaskIntoConstraints = false
        CTAButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -46.0).isActive = true
        CTAButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 46.0).isActive = true
        CTAButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -86).isActive = true
        CTAButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        CTAButton.addTarget(self, action: #selector(makeRequest), for: .touchUpInside)
        
    }
    
    @objc private func makeRequest(){
        print("PressButton")
        viewModel.fetch()
    }

}

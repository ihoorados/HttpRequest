//
//  MainView.swift
//  HttpRequest
//
//  Created by Hoorad on 6/29/20.
//  Copyright © 2020 Hoorad. All rights reserved.
//
//
import UIKit

class MainView: UIViewController {
    
    lazy var URLTitle : UILabel = {
        let label = UILabel()
        label.text = "URL Address"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    lazy var URLTextField:UITextField = {
       let textFeild = UITextField()
        textFeild.borderStyle = .roundedRect
        textFeild.placeholder = "http://wwww.google.com/api"
        textFeild.font = UIFont.systemFont(ofSize: 14)
        return textFeild
    }()
    
    lazy var ResponseTextView:UITextView = {
       let textView = UITextView()
        return textView
    }()
        
    
    lazy var MethodSegmentControll: UISegmentedControl = {
        let methodSegment = UISegmentedControl(items: ["GET","POST"])
        return methodSegment
    }()
    
    lazy var SendRequestBtn:UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.backgroundColor = #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), for: .highlighted)
        button.setTitle("Start Request", for: .normal)
        return button
    }()
    
    lazy var CancelRequestBtn:UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        button.setTitleColor(#colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1), for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1), for: .highlighted)
        button.setTitle("Cancel Request", for: .normal)
        return button
    }()
    
    var viewModel : MainViewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        OptimizeUIlayout()
    }
    
    
    func OptimizeUIlayout(){
        
        view.addSubview(MethodSegmentControll)
        MethodSegmentControll.translatesAutoresizingMaskIntoConstraints = false
        MethodSegmentControll.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -46.0).isActive = true
        MethodSegmentControll.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 46.0).isActive = true
        MethodSegmentControll.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        MethodSegmentControll.selectedSegmentIndex = 0
        
        view.addSubview(URLTitle)
        URLTitle.translatesAutoresizingMaskIntoConstraints = false
        URLTitle.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32.0).isActive = true
        URLTitle.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32.0).isActive = true
        URLTitle.topAnchor.constraint(equalTo: MethodSegmentControll.bottomAnchor, constant: 32.0).isActive = true
        
        view.addSubview(URLTextField)
        URLTextField.translatesAutoresizingMaskIntoConstraints = false
        URLTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32.0).isActive = true
        URLTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32.0).isActive = true
        URLTextField.topAnchor.constraint(equalTo: URLTitle.bottomAnchor, constant: 16.0).isActive = true
        URLTextField.text = "https://www.cat-fact.herokuapp.com/facts"
        
        view.addSubview(ResponseTextView)
        ResponseTextView.translatesAutoresizingMaskIntoConstraints = false
        ResponseTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32.0).isActive = true
        ResponseTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32.0).isActive = true
        ResponseTextView.topAnchor.constraint(equalTo: URLTextField.bottomAnchor, constant: 16.0).isActive = true
        ResponseTextView.heightAnchor.constraint(equalToConstant: 400).isActive = true
        ResponseTextView.text = "Respnse OUTPUT"
        
        view.addSubview(CancelRequestBtn)
        CancelRequestBtn.translatesAutoresizingMaskIntoConstraints = false
        CancelRequestBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -46.0).isActive = true
        CancelRequestBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 46.0).isActive = true
        CancelRequestBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -86).isActive = true
        CancelRequestBtn.heightAnchor.constraint(equalToConstant: 60).isActive = true
        CancelRequestBtn.addTarget(self, action: #selector(CancelRequest), for: .touchUpInside)
        
        view.addSubview(SendRequestBtn)
        SendRequestBtn.translatesAutoresizingMaskIntoConstraints = false
        SendRequestBtn.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -46.0).isActive = true
        SendRequestBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 46.0).isActive = true
        SendRequestBtn.bottomAnchor.constraint(equalTo: CancelRequestBtn.topAnchor, constant: -16).isActive = true
        SendRequestBtn.heightAnchor.constraint(equalToConstant: 60).isActive = true
        SendRequestBtn.addTarget(self, action: #selector(SendRequest), for: .touchUpInside)
    }
    
    @objc private func SendRequest(){
        print("Press SendRequest Button")
        viewModel.fetch()
    }
    @objc private func CancelRequest(){
        print("Press CancelRequest Button")
        viewModel.cancelFetch()
    }

}

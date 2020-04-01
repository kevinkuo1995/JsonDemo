//
//  ViewController.swift
//  JsonDemo
//
//  Created by KUO Chin Wei on 2020/4/1.
//  Copyright © 2020 KUO Chin Wei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let textLabel:UILabel = {
        let tl = UILabel()
        tl.text = "Json Placeholder"
        tl.font = .systemFont(ofSize: 24)
        return tl
    }()
    
    let goToNextButton:UIButton = {
        let gtnb = UIButton()
        gtnb.setTitle("Request API", for: .normal)
        gtnb.setTitleColor(.black, for: .normal)
        gtnb.setTitleColor(.gray, for: .highlighted)
        gtnb.addTarget(self, action: #selector(goToNextView), for: .touchUpInside)
        return gtnb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    fileprivate func setupLayout() {
        // Do any additional setup after loading the view.
        view.addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        
        view.addSubview(goToNextButton)
        goToNextButton.translatesAutoresizingMaskIntoConstraints = false
        goToNextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        goToNextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50).isActive = true
    }
    
    @objc fileprivate func goToNextView() {
        let resultController = ResultViewController()
        navigationController?.pushViewController(resultController, animated: true)
    }


}


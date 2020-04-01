//
//  DetailViewController.swift
//  JsonDemo
//
//  Created by KUO Chin Wei on 2020/4/1.
//  Copyright © 2020 KUO Chin Wei. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    let imageData:JsonData
    
    let dataViewModel = DataViewModel()
    
    let detailImageView:UIImageView = {
       let div = UIImageView()
        div.contentMode = .scaleToFill
        div.clipsToBounds = true
        return div
    }()
    
    let detailIdLabel:UILabel = {
        let dil = UILabel()
        dil.textAlignment = .center
        dil.numberOfLines = 0
        dil.font = .systemFont(ofSize: 20)
        return dil
    }()
    
    let detailTitleLabel:UILabel = {
        let dtt = UILabel()
        dtt.textAlignment = .center
        dtt.numberOfLines = 0
        dtt.font = .systemFont(ofSize: 16)
        return dtt
    }()
    
    init(imageData:JsonData) {
        self.imageData = imageData
        
        self.detailIdLabel.text = String(imageData.id)
        self.detailTitleLabel.text = imageData.title
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
    }
    
    fileprivate func setupLayout() {
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        view.addSubview(detailImageView)
        detailImageView.translatesAutoresizingMaskIntoConstraints = false
        detailImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        detailImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        detailImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        detailImageView.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: 80).isActive = true
        
        view.addSubview(detailIdLabel)
        detailIdLabel.translatesAutoresizingMaskIntoConstraints = false
        detailIdLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        detailIdLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        detailIdLabel.topAnchor.constraint(equalTo: detailImageView.bottomAnchor).isActive = true
        detailIdLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        view.addSubview(detailTitleLabel)
        detailTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        detailTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        detailTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        detailTitleLabel.topAnchor.constraint(equalTo: detailIdLabel.bottomAnchor).isActive = true
//        detailTitleLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true

        dataViewModel.downloadImage(url: imageData.url) { (image) in
            if let image = image {
                DispatchQueue.main.async {
                    self.detailImageView.image = image
                }
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

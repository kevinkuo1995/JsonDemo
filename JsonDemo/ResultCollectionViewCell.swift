//
//  ResultCollectionViewCell.swift
//  JsonDemo
//
//  Created by KUO Chin Wei on 2020/4/1.
//  Copyright © 2020 KUO Chin Wei. All rights reserved.
//

import UIKit

class ResultCollectionViewCell: UICollectionViewCell {
    
    var imageData:JsonData?
    
    var resultController: ResultViewController?
    
    let resultImageView:UIImageView = {
       let riv = UIImageView()
        riv.contentMode = .scaleToFill
        riv.clipsToBounds = true
        riv.isUserInteractionEnabled = true
        return riv
    }()
    
    let resultIdLabel:UILabel = {
        let ril = UILabel()
        ril.textAlignment = .center
        ril.numberOfLines = 0
        ril.font = .systemFont(ofSize: 12)
        return ril
    }()
    
    let resultTitleLabel:UILabel = {
        let rtt = UILabel()
        rtt.textAlignment = .center
        rtt.numberOfLines = 0
        rtt.font = .systemFont(ofSize: 12)
        return rtt
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(resultImageView)
        resultImageView.translatesAutoresizingMaskIntoConstraints = false
        resultImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        resultImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        resultImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        resultImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        resultImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToDetail)))

        
        addSubview(resultIdLabel)
        resultIdLabel.translatesAutoresizingMaskIntoConstraints = false
        resultIdLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        resultIdLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        addSubview(resultTitleLabel)
        resultTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        resultTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        resultTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        resultTitleLabel.topAnchor.constraint(equalTo: centerYAnchor).isActive = true
        resultTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc fileprivate func goToDetail() {
        print("go now")
        if let imageData = imageData {
            self.resultController?.goToDetail(imageData: imageData)
        }
    }
    
}

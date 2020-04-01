//
//  ResultViewController.swift
//  JsonDemo
//
//  Created by KUO Chin Wei on 2020/4/1.
//  Copyright © 2020 KUO Chin Wei. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    let dataViewModel = DataViewModel()
    
    lazy var resultCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height), collectionViewLayout: layout)
    
    lazy var layout:UICollectionViewFlowLayout = {
        let l = UICollectionViewFlowLayout()
//        l.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
        l.minimumInteritemSpacing = 0
        l.minimumLineSpacing = 0
        
        l.itemSize = CGSize(width: CGFloat(view.frame.width)/4,height: CGFloat(view.frame.width)/4)
        
        return l
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

//        dataViewModel.downloadData { (data) in
//            print(data)
//        }
        dataViewModel.downloadData { (data) in
            if let data = data {
                self.dataViewModel.jsonData = data
                DispatchQueue.main.async {
                    self.resultCollectionView.reloadData()
                }
            }        }
        setupLayout()
    }
    
    fileprivate func setupLayout() {
        
        resultCollectionView.register(ResultCollectionViewCell.self, forCellWithReuseIdentifier: "resultCell")
        
        resultCollectionView.delegate = self
        resultCollectionView.dataSource = self
        
        view.addSubview(resultCollectionView)
        resultCollectionView.translatesAutoresizingMaskIntoConstraints = false
        resultCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        resultCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        resultCollectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        resultCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        resultCollectionView.backgroundColor = .white
        
        view.backgroundColor = .white
    }

    func goToDetail(imageData:JsonData) {
        print("go")
        let detailController = DetailViewController(imageData: imageData)
        navigationController?.pushViewController(detailController, animated: true)
    }

}

extension ResultViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataViewModel.jsonData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = resultCollectionView.dequeueReusableCell(withReuseIdentifier: "resultCell", for: indexPath) as! ResultCollectionViewCell
        
        let data = dataViewModel.jsonData[indexPath.row]
        cell.imageData = data
        cell.resultController = self
        cell.resultTitleLabel.text = data.title
        cell.resultIdLabel.text = String(data.id)
        
        
        
        dataViewModel.downloadImage(url: data.thumbnailUrl) { (image) in
            if let image = image {
                DispatchQueue.main.async {
                    cell.resultImageView.image = image
                }
            }
        }
        
        
        
        
        return cell
    }
    
    
}

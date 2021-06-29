//
//  CollectionViewCell.swift
//  TicTacToe
//
//  Created by DCS on 30/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
//    private let myImage:UIImageView = {
//
//        let img = UIImageView()
//        img.contentMode = .scaleAspectFit
//        img.clipsToBounds = true
//        return img
//    }()
//
//    func setupCell(with status:Int){
//        contentView.layer.borderWidth = 2
//        contentView.layer.borderColor = UIColor.lightGray.cgColor
//
//        contentView.addSubview(myImage)
//
//        myImage.frame = CGRect(x: 10, y: 10, width: 60, height: 60)
//
//        let name = status == 0 ? "O" : status == 1 ? "X" : ""
//
//         myImage.image = UIImage(named: name)
//    }
    
    
    private let myImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    func setupCell(with status:Int) {
        
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        
        contentView.addSubview(myImageView)
        
        myImageView.frame = CGRect(x: 10, y: 10, width: 60, height: 60)
        
        let name = status == 0 ? "O" : status == 1 ? "X" : ""
        
        myImageView.image = UIImage(named: name)
    }
}

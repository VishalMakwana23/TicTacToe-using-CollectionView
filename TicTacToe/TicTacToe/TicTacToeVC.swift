//
//  TicTacToeVC.swift
//  TicTacToe
//
//  Created by DCS on 30/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class TicTacToeVC: UIViewController {
    
    private var state = [2,2,2,2,
                         2,2,2,2,
                         2,2,2,2,
                         2,2,2,2]
    
    private let winningCombinations = [[0, 1, 2, 3], [4, 5, 6, 7], [8, 9, 10, 11], [12, 13, 14, 15], [0, 5, 10, 15], [3, 6, 9, 12], [0, 4, 8, 12], [1, 5, 9, 13], [2, 6, 10, 14], [3, 7, 11, 15]]
    
    private var  zeroFlag = false
    
    private let myCV : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 200, left: 10, bottom: 20, right: 10)
        layout.itemSize = CGSize(width: 80, height: 80)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
    }()
    
    
    
    private let myLabel:UILabel = {
        let label = UILabel()
        label.text = "Player : "
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.textColor = UIColor.black
        return label
    }()
    
    private let turnLabel:UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.textColor = UIColor.black
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        title = "TicTacToe"
        ////        //        self.view.backgroundColor = .brown
        //        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        //        backgroundImage.image = UIImage(named: "bg2.jpg")
        //        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        //        self.view.insertSubview(backgroundImage, at: 0)
        self.view.backgroundColor = .white
        view.addSubview(myCV)
        view.addSubview(myLabel)
        view.addSubview(turnLabel)
        myCV.backgroundColor = .white
        setupCV()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myLabel.frame = CGRect(x: 20, y: 140, width: view.width - 40, height: 40)
        turnLabel.frame = CGRect(x: 70, y: 140, width: view.width - 40, height: 40)
        myCV.frame = view.bounds
    }
    
    
    
}


extension TicTacToeVC : UICollectionViewDataSource,UICollectionViewDelegate {
    
    private func setupCV(){
        myCV.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        myCV.dataSource = self
        myCV.delegate = self
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.setupCell(with: state[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if state[indexPath.row] != 0 && state[indexPath.row] != 1 {
            state.remove(at: indexPath.row)
            
            if zeroFlag {
                turnLabel.text = "X"
                state.insert(0, at: indexPath.row)
            } else {
                turnLabel.text = "O"
                state.insert(1, at: indexPath.row)
            }
            
            zeroFlag = !zeroFlag
            collectionView.reloadData()
            checkWinner()
        }
    }
    
    private func checkWinner() {
        
        if !state.contains(2) {
            let alert = UIAlertController(title: "Game over!", message: "oops!. Try again", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { [weak self] _ in
                self?.resetState()
            }))
            DispatchQueue.main.async {
                self.present(alert, animated: true, completion: nil)
            }
        }
        
        for i in winningCombinations {
            if state[ i[0] ] == state[ i[1] ] && state[ i[1] ] == state[ i[2] ] && state[ i[2] ] == state[ i[3] ] && state[ i[0] ] != 2 {
                announceWinner(player: state[ i[0] ] == 0 ? "0" : "X")
                break
            }
        }
    }
    
    private func announceWinner(player: String) {
        let alert = UIAlertController(title: "Game over!", message: "\(player) won", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { [weak self] _ in
            self?.resetState()
        }))
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    private func resetState() {
        state = [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2]
        zeroFlag = false
        myCV.reloadData()
    }
    
}

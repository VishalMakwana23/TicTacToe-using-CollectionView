//
//  ViewController.swift
//  TicTacToe
//
//  Created by DCS on 28/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let logo : UIImageView = {
        let lg = UIImageView()
        lg.contentMode = .scaleAspectFit
        lg.image = UIImage(named: "tictactoe")
        return lg
    }()
    

    
    
//    public let myButton:UIButton = {
//        let button = UIButton()
//        button.setImage(UIImage(named: "play"), for: .normal)
//        button.tintColor = .black
//        button.alpha = 0
//        return button
//    }()
    
//    private let Continue_btn : UIButton = {
//        let con = UIButton()
//        con.setTitle("Continue", for: .normal)
//        con.addTarget(self, action: #selector(goto), for: .touchUpInside)
//        con.backgroundColor = .gray
//        con.setTitleColor(.white, for: .normal)
//        con.layer.cornerRadius = 25
//        return con
//    } ()
    private let play:UIButton = {
        let btn = UIButton()
        let imag = UIImage(named: "play")
        
        btn.setImage(imag, for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.imageEdgeInsets = UIEdgeInsets(top: 0,left: 10,bottom: 0,right: 10)
         btn.addTarget(self, action: #selector(goto), for: .touchUpInside)
        btn.setTitle("Play", for: .normal)
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
        
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.backgroundColor = UIColor.white
        btn.layer.cornerRadius = 25
        return btn
    }()
    
    private let google:UIButton = {
        let g = UIButton()
        let imag = UIImage(named: "search")
        
        g.setImage(imag, for: .normal)
        g.imageView?.contentMode = .scaleAspectFit
        g.imageEdgeInsets = UIEdgeInsets(top: 0,left: 10,bottom: 0,right: 10)
        
        g.setTitle("Google", for: .normal)
        g.titleEdgeInsets = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
        g.setTitleColor(UIColor.black, for: .normal)
        g.backgroundColor = UIColor.white
        g.layer.cornerRadius = 25
        return g
    }()
    
    private let fb:UIButton = {
        let fb = UIButton()
        let imag = UIImage(named: "facebook")
        
        fb.setImage(imag, for: .normal)
        fb.imageView?.contentMode = .scaleAspectFit
        fb.imageEdgeInsets = UIEdgeInsets(top: 0,left: 10,bottom: 0,right: 10)
        fb.setTitle("Facebook", for: .normal)
        fb.titleEdgeInsets = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
        fb.setTitleColor(UIColor.black, for: .normal)
        fb.backgroundColor = UIColor.white
        fb.layer.cornerRadius = 25
        return fb
    }()
    @objc func goto()
    {
        let tc = TicTacToeVC()
        navigationController?.pushViewController(tc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(logo)
        view.addSubview(play)
        view.addSubview(google)
        view.addSubview(fb)
        title = "Home"
        //        self.view.backgroundColor = .brown
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bg1.jpg")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)

        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        logo.frame = CGRect(x: 20, y: 190, width: view.width - 40, height: 120)
        play.frame = CGRect(x: 40, y: logo.bottom + 40, width: view.width - 60, height: 40)
        google.frame = CGRect(x: 40, y: play.bottom + 190, width: view.width - 60, height: 40)
        fb.frame = CGRect(x: 40, y: google.bottom + 20, width: view.width - 60, height: 40)
    }
    


}


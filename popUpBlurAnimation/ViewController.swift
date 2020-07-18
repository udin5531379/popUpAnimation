//
//  ViewController.swift
//  popUpBlurAnimation
//
//  Created by Udin Rajkarnikar on 10/5/18.
//  Copyright © 2018 Udin Rajkarnikar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var effect: UIVisualEffect!
    
    let backGroungImageView : UIImageView = {
    
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "background")
        return image
    
    }()
    
    let backGroungButton : UIButton = {
        
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("POP UP", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor(red: 28/255, green: 175/255, blue: 77/255, alpha: 1)
        
        button.addTarget(self, action: #selector(handleBackgroudButtonTapped), for: .touchUpInside)
        
        return button
        
    }()
    
    @objc func handleBackgroudButtonTapped(){
        
        view.addSubview(visualEffect)
        view.addSubview(popUPView)
        view.addSubview(popUPButton)
        
        popUPView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        popUPView.alpha = 0
        
        UIView.animate(withDuration: 0.3) {
            
            self.popUPView.alpha = 1
            self.popUPView.transform = CGAffineTransform.identity
            
        }
        
        popUPView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        popUPView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        popUPView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        popUPView.widthAnchor.constraint(equalToConstant: 200).isActive = true

        popUPButton.centerXAnchor.constraint(equalTo: popUPView.centerXAnchor).isActive = true
        popUPButton.centerYAnchor.constraint(equalTo: popUPView.centerYAnchor).isActive = true
        popUPButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        popUPButton.widthAnchor.constraint(equalToConstant: 100).isActive = true

        visualEffect.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        visualEffect.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        visualEffect.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        visualEffect.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
      }
    
    let popUPView : UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 10
        return view
    
    }()
    
    let popUPButton : UIButton = {
        
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 25
        button.backgroundColor = UIColor.lightGray
        button.setTitle("BACK", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleBackPOPUPBackButton), for: .touchUpInside)
        return button
    
    }()

    @objc func handleBackPOPUPBackButton() {
        
        UIView.animate(withDuration: 0.3, animations: {
            
            self.popUPView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.popUPView.alpha = 0
            
            self.popUPButton.removeFromSuperview()

            
        }) { (success : Bool) in
            
            self.visualEffect.removeFromSuperview()

            self.popUPView.removeFromSuperview()
            
        }
        
    }
    
    let visualEffect : UIVisualEffectView = {
        
        let blur = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blur)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        return blurEffectView
    
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    
        view.addSubview(backGroungImageView)
        view.addSubview(backGroungButton)
        
        backgroundImageAndButtonConstraints()
        
    }

    func backgroundImageAndButtonConstraints(){
        
        
        backGroungImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backGroungImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        backGroungImageView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        backGroungImageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        backGroungButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backGroungButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        backGroungButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        backGroungButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
       
        
     }
    
    
    

}


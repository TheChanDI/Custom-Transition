//
//  ViewController.swift
//  CustomTransition
//
//  Created by ENFINY INNOVATIONS on 12/20/20.
//

import UIKit

class FirstVC: UIViewController {
    
    
    //MARK: Properties
    
    // Define our custom transition delegate
    let transitionManager = TransitionManager()
    
    lazy var button: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("animate now", for: .normal)
        btn.backgroundColor = .orange
        return btn
    }()
    
    //MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = #colorLiteral(red: 1, green: 0.8654827517, blue: 0.554874665, alpha: 0.5364491637)
        
        
        //UI setup
        configureButton()
    }
    
    //MARK: UI Setup
    
    private func configureButton() {

        button.frame = CGRect(x: (view.frame.width / 2) - 150 / 2, y: view.frame.height / 2, width: 150, height: 50)
        view.addSubview(button)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        let vc = SecondVC()
        navigationController?.delegate = transitionManager
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}


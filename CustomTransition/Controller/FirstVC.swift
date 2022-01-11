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
    let transitionManager = TransitionManager(duration: 0.5)
    
    let customItem = CustomItem()
    

    
    //MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        
        //UI setup
        configureItem()
    }
    
    //MARK: UI Setup
    func configureItem() {
        view.addSubview(customItem)
        customItem.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
            make.height.equalTo(240)
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(itemTapped))
        customItem.addGestureRecognizer(tapGesture)
    }
    
    
    @objc func itemTapped() {
        let vc = SecondVC()
        navigationController?.delegate = transitionManager
        navigationController?.pushViewController(vc, animated: true)
    }
    
}


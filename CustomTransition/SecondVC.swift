//
//  SecondVC.swift
//  CustomTransition
//
//  Created by ENFINY INNOVATIONS on 12/20/20.
//

import UIKit

class SecondVC: UIViewController {
    
    //MARK: Properties
    lazy var yellowView: UIView = {
        let v = UIView()
        v.backgroundColor = .orange
        return v
    }()
    
    lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.text = "animate now"
        label.textColor = .blue
        return label
    }()
    
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 0.8654827517, blue: 0.554874665, alpha: 0.5364491637)
        
        //configureUI
        configureYellowView()
        configureTitleLabel()
    }
    
    //MARK: Setup
    
    private func configureYellowView() {
        view.addSubview(yellowView)
        yellowView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 150)
    }
    
    
    private func configureTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.frame = .init(x: (view.frame.width / 2) - 50, y: 150 / 2, width: 100, height: 30)
    }
    
}

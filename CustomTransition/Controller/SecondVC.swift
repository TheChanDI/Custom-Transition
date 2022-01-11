//
//  SecondVC.swift
//  CustomTransition
//
//  Created by ENFINY INNOVATIONS on 12/20/20.
//

import UIKit

class SecondVC: UIViewController {
    
    //MARK: - UI Elements
    lazy var grayView: UIView = {
       let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.1970187409, green: 0.5609255198, blue: 0.8630290212, alpha: 0.27)
        return v
    }()
    
    lazy var image: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "nike1")
        return image
    }()
    
    lazy var nameLabel: UILabel = {
       let label = UILabel()
        label.text = "Nike Air Max Deluxe"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = #colorLiteral(red: 0.1667585277, green: 0.1667585277, blue: 0.1667585277, alpha: 1)
        return label
    }()
    
    lazy var shoeGenderLabel: UILabel = {
        let label = UILabel()
        label.text = "Men's Shoe"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = #colorLiteral(red: 0.2383145973, green: 0.2580284224, blue: 0.2866677133, alpha: 1)
        return label
    }()
    
    lazy var priceLabel: UILabel = {
       let label = UILabel()
        label.text = "$119.50"
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        return label
    }()
    
    lazy var heartImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "heart.fill")?.withTintColor(UIColor.black.withAlphaComponent(0.5), renderingMode: .alwaysOriginal)
        return image
    }()

    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        //configuration
        configureGrayView()
        configureShoeImage()
        configureNameLabel()
        configureShoeGenderLabel()
        configurePriceLabel()
        configureHeartImage()
    }
    
    //MARK: - UI Setup
    private func configureGrayView() {
        view.addSubview(grayView)
//        grayView.frame = .init(x: 0, y: 90, width: view.frame.width, height: 240)
        grayView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(260)
        }
    }
    
    private func configureShoeImage() {
        grayView.addSubview(image)
//        image.frame = .init(x: 250 / 4, y: grayView.frame.origin.y - 160 / 3, width: 250, height: 160)
        image.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(20)
            make.height.equalTo(160)
            make.width.equalTo(250)
        
        }
    }
    
    private func configureNameLabel() {
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(grayView.snp.bottom).offset(30)
            make.leading.equalToSuperview().inset(20)
        }
    }
    
    private func configureShoeGenderLabel() {
        view.addSubview(shoeGenderLabel)
        shoeGenderLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(nameLabel.snp.bottom).offset(15)
            
        }
    }
    
    private func configurePriceLabel() {
        view.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(grayView.snp.bottom).offset(30)
            make.trailing.equalToSuperview().offset(-20)
        }

    }
    
    private func configureHeartImage() {
        view.addSubview(heartImage)
        heartImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalTo(grayView.snp.top).offset(-10)
            make.height.width.equalTo(30)
        }
    }
    
    
}

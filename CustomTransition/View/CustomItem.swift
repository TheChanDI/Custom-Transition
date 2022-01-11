//
//  CustomItem.swift
//  CustomTransition
//
//  Created by ENFINY INNOVATIONS on 1/11/22.
//

import UIKit
import SnapKit

class CustomItem: UIView {
    
    //MARK: - UI Elements
    lazy var image: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "nike1")
        return image
    }()
    
    lazy var nameLabel: UILabel = {
       let label = UILabel()
        label.text = "Nike Air Max Deluxe"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = #colorLiteral(red: 0.1667585277, green: 0.1667585277, blue: 0.1667585277, alpha: 1)
        return label
    }()
    
    lazy var shoeGenderLabel: UILabel = {
        let label = UILabel()
        label.text = "Men's Shoe"
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
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
    
    //MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.9523470998, green: 0.9524837136, blue: 0.9523171782, alpha: 1)
        layer.cornerRadius = 10
        configureImage()
        configureNameLabel()
        configureShoeGenderLabel()
        configurePriceLabel()
        configureHeartImage()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI Configuration
    
    private func configureImage() {
        addSubview(image)
        image.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalTo(130)
            make.width.equalTo(200)
            make.centerX.equalToSuperview()
        }
    }
    
    private func configureNameLabel() {
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(image.snp.bottom).offset(20)
            
        }
    }
    
    private func configureShoeGenderLabel() {
        addSubview(shoeGenderLabel)
        shoeGenderLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            
        }
    }
    
    private func configurePriceLabel() {
        addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(shoeGenderLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
        }
    }
    
    private func configureHeartImage() {
        addSubview(heartImage)
        heartImage.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(image.snp.bottom).offset(20)
            make.height.width.equalTo(30)
        }
    }

}

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

    lazy var descriptionLabel: UILabel = {
       let label = UILabel()
        label.text = "Description\n\nThe OG Air Max Deluxe made its debut in 2000 as an answer for runners seeking a great ride and durability for miles. Today, the Air Max Deluxe is back with the same lightweight cushioning and comfort—but with modern finishes, materials and colors. Tech mesh on the vamp and a subtle, two-tone sandwich mesh on the tongue give it a fresh feel, while various shades of gray reinterpret the classic Triple Black colorway."
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .darkGray
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.alpha = 0
        return label
    }()
    
    lazy var bottomStackView: UIStackView = {
       let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        
        let v1 = UIView()
        v1.backgroundColor = #colorLiteral(red: 0.06255983561, green: 0.1472784877, blue: 0.2344947457, alpha: 0.8271602605)
        
        let cartImage = UIImageView()
        cartImage.image = UIImage(systemName: "cart")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        v1.addSubview(cartImage)
        cartImage.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.width.equalTo(30)
        }
        
        let v2 = UIView()
        v2.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.52)
        
        let buyLabel = UILabel()
        buyLabel.text = "Buy"
        buyLabel.textColor = #colorLiteral(red: 0.06255983561, green: 0.1472784877, blue: 0.2344947457, alpha: 0.8271602605)
        buyLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        v2.addSubview(buyLabel)
        buyLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        sv.addArrangedSubview(v1)
        sv.addArrangedSubview(v2)
        
        
        
        return sv
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
        configureDescriptionLabel()
        configureBottomStackView()
        performAnimation()
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
    
    private func configureDescriptionLabel() {
        view.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(shoeGenderLabel.snp.bottom).offset(90)
            make.leading.trailing.equalToSuperview().inset(20)
       
            
        }
    }
    
    private func configureBottomStackView() {
        view.addSubview(bottomStackView)
        bottomStackView.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalToSuperview()
            make.height.equalTo(0)
        }
    }
    
    
    //MARK: - Other Methods
    
    
    private func performAnimation() {
        self.view.layoutIfNeeded()
        
        //for description text
        UIView.animate(withDuration: 1) {
            self.descriptionLabel.alpha = 1
            self.descriptionLabel.snp.updateConstraints { make in
                make.top.equalTo(self.shoeGenderLabel.snp.bottom).offset(25)
            }
            self.view.layoutIfNeeded()
        }
        
        //for bottom view
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseInOut) {
            self.bottomStackView.snp.updateConstraints { make in
                make.height.equalTo(70)
            }
            self.view.layoutIfNeeded()
        } completion: { _ in
            
        }

        
    }
    
    
}

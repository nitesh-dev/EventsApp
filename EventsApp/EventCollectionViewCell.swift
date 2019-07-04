//
//  EventCollectionViewCell.swift
//  EventsApp
//
//  Created by Cognizant Technology Solutions # 2 on 09/01/19.
//  Copyright © 2019 Cognizant Technology Solutions # 2. All rights reserved.
//

import UIKit

class EventCollectionViewCell: UICollectionViewCell {
    
    var eventNameLabel = UILabel()
    let eventImage = UIImageView()
    let nextButton = UIButton()
    let favoriteButton = UIButton()
    let categoryLabel = UILabel()
    override func layoutSubviews() {
        print("hello")
        self.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        configureLayout()
    }
    
    func configureLayout()
    {
        self.layer.cornerRadius = 7
        self.clipsToBounds = true
        let arrSubviews = [eventNameLabel, eventImage, nextButton, favoriteButton, categoryLabel]
        
        arrSubviews.forEach{self.addSubview($0)}
        eventImage.snp.makeConstraints {
            make in
            make.top.equalTo(self.snp.top).offset(10)
            make.left.equalTo(self.snp.left).offset(10)
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        eventImage.image = #imageLiteral(resourceName: "nitesh")
        eventImage.layer.cornerRadius = 5
        eventImage.clipsToBounds = true
        
        eventNameLabel.snp.makeConstraints {
            make in
            make.left.equalTo(eventImage.snp.right).offset(10)
            make.top.equalTo(eventImage.snp.top).offset(-10)
            make.height.equalTo(40)
            make.width.equalTo(150)
        }
        eventNameLabel.text = "Nitesh Singh"
        eventNameLabel.textColor = UIColor.black.withAlphaComponent(0.5)
        
        let offset = (self.bounds.height / 2) - 30
        nextButton.snp.makeConstraints {
            make in
            make.right.equalTo(self.snp.right)
            make.top.equalTo(self.snp.top).offset(offset)
            make.height.equalTo(60)
            make.width.equalTo(60)
        }
        let icon = UIImage(named: "icons8-double-right-50")!
        nextButton.setImage(icon, for: .normal)
        nextButton.imageView?.contentMode = .scaleAspectFit
        nextButton.tintColor = UIColor.white
        
        categoryLabel.snp.makeConstraints {
            make in
            make.left.equalTo(10)
            make.top.equalTo(eventImage.snp.bottom).offset(10)
            make.height.lessThanOrEqualTo(50)
            make.width.equalTo(150)
        }
        categoryLabel.text = "iOS Challenge"
        categoryLabel.textColor = UIColor.black.withAlphaComponent(0.5)
    }
    
    
}

//
//  DonationCollectionViewCell.swift
//  TriumphSwiftTest
//
//  Created by Tony Loehr on 9/1/21.
//

import UIKit
import Foundation

class DonationCollectionViewCell: UICollectionViewCell, UIActionSheetDelegate {
    
    // Views and labels
    var profileImageView = UIImageView()
    var organizationNameLabel = UILabel()
    var amountRaisedLabel = UILabel()
    var donateButton = UIButton()
    let profileCircleSize = 15
    
    var organization: Organization? {
        didSet {
            self.organizationNameLabel.text = organization?.name
            if let totalDonated = organization?.amountGiven {
                self.amountRaisedLabel.text = "$\(totalDonated)"
            }
            
//            self.profileImageView.image = UIImage(contentsOfFile: "")
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func setConstraints() {
        self.addSubview(profileImageView)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: CGFloat(profileCircleSize)).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: CGFloat(profileCircleSize)).isActive = true
        profileImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        self.profileImageView.layer.masksToBounds = true
        profileImageView.layer.cornerRadius = CGFloat(profileCircleSize/2)
        
        self.addSubview(organizationNameLabel)
        organizationNameLabel.translatesAutoresizingMaskIntoConstraints = false
        organizationNameLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor, constant: -30).isActive = true
        organizationNameLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 15).isActive = true
        organizationNameLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        organizationNameLabel.shadowOffset = CGSize(width: 0.1, height: 0.1)
        organizationNameLabel.shadowColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        organizationNameLabel.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        self.addSubview(amountRaisedLabel)
        amountRaisedLabel.translatesAutoresizingMaskIntoConstraints = false
        amountRaisedLabel.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor, constant: 10).isActive = true
        amountRaisedLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 15).isActive = true
        amountRaisedLabel.font = UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.light)
        amountRaisedLabel.shadowOffset = CGSize(width: 0.1, height: 0.1)
        amountRaisedLabel.shadowColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        amountRaisedLabel.textColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        self.addSubview(donateButton)
        donateButton.translatesAutoresizingMaskIntoConstraints = false
        donateButton.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor, constant: 30).isActive = true
        donateButton.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 15).isActive = true
        donateButton.setTitle("Donate", for: .normal)
        donateButton.setTitleColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), for: .normal)
        donateButton.setTitleShadowColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        donateButton.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        
    }
    
    @objc func pressed(_ sender: AnyObject) {
        let actionSheet = UIAlertController(title: nil, message: "Select amount to donate", preferredStyle: .actionSheet)
        
        let donate1 = UIAlertAction(title: "Donate $1", style: .default, handler: {
            alert in
            
        })
        let donate5 = UIAlertAction(title: "Donate $5", style: .default, handler: {
            alert in
            
        })
        let donate10 = UIAlertAction(title: "Donate $10", style: .default, handler: {
            alert in
            
        })
        let donate100 = UIAlertAction(title: "Donate $100", style: .default, handler: {
            alert in
            
        })
        
        actionSheet.addAction(donate1)
        actionSheet.addAction(donate5)
        actionSheet.addAction(donate10)
        actionSheet.addAction(donate100)
        
        actionSheet.present(actionSheet, animated: true, completion: nil)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

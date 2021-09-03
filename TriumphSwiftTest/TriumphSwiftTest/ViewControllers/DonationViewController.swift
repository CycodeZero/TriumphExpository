//
//  DonationViewController.swift
//  TriumphSwiftTest
//
//  Created by Tony Loehr on 9/1/21.
//

import UIKit
import SwiftSpinner

class DonationViewController: UIViewController {

    var collectionView: UICollectionView?
    
    var allOrganizations: [Organization] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Dark mode for everything
        if #available(iOS 13.0, *) {
            UIWindow.appearance().overrideUserInterfaceStyle = .dark
        }
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: view.frame.width/2 - 20, height: 100)
        constrainCollectionView(layout: layout)
        
        DispatchQueue.global(qos: .userInitiated).async {
            Api.Organization.getAllOrganizations(completion: {
                organizations in
                
                if let organizations = organizations {
                    self.allOrganizations = organizations
                }
                
                self.collectionView?.reloadData()
                
                
            })
            
            sleep(1)
            DispatchQueue.main.async {
                SwiftSpinner.hide()
            }
        }
        DispatchQueue.main.async {
            SwiftSpinner.show("Loading...")
        }
        
        
    }
    

    func constrainCollectionView(layout: UICollectionViewFlowLayout) {
        let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        view.addSubview(collectionView)
        collectionView.register(DonationCollectionViewCell.self, forCellWithReuseIdentifier: "DonationCollectionViewCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        collectionView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        collectionView.isScrollEnabled = true
        collectionView.dataSource = self
        collectionView.delegate = self
        self.collectionView = collectionView
    }
    

}

extension DonationViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allOrganizations.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DonationCollectionViewCell", for: indexPath) as! DonationCollectionViewCell
        cell.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        let org = allOrganizations[indexPath.row]
        cell.organization = org
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected: \(indexPath.row)")
    }
}

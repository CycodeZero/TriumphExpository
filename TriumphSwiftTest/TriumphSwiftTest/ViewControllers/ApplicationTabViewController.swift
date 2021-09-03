//
//  ApplicationTabViewController.swift
//  TriumphSwiftTest
//
//  Created by Tony Loehr on 9/1/21.
//

import UIKit

class ApplicationTabViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self

        // Dark mode for everything
        if #available(iOS 13.0, *) {
            UIWindow.appearance().overrideUserInterfaceStyle = .dark
        }
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let goodViewController = GoodViewController()
        let donationViewController = DonationViewController()
        let icon1 = UITabBarItem(title: "User", image: UIImage(named: "userImage.png"), selectedImage: UIImage(named: "selectedUserImage.png"))
        let icon2 = UITabBarItem(title: "Org", image: UIImage(named: "orgImage.png"), selectedImage: UIImage(named: "orgImage.png"))
        goodViewController.tabBarItem = icon1
        donationViewController.tabBarItem = icon2
        let controllers = [goodViewController, donationViewController]
        self.viewControllers = controllers
        self.selectedIndex = 0
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }

}

//
//  DonationsApi.swift
//  TriumphSwiftTest
//
//  Created by Jared Geller on 8/25/21.
//

import Foundation
import FirebaseDatabase

class DonationsApi {
    
    func getMyDonations(completion: @escaping ([Donation]?) -> Void) {
        var userDonations: [String] = []
        var donations = [Donation]()
        
        Database.database().reference().child("myDonations").child("uid1").observe(.value, with: {
            snapshot in
            if let values = snapshot.value as? [String: Any] {
                for each in values {
                    userDonations.append(each.key)
                }
            }
        })
        
        Database.database().reference().child("donations").observe(.value, with: {
            snapshot in
                                                                    
                                                                
            if let donationIdDict = snapshot.value as? [String: Any] {
                for donationId in donationIdDict {
                    if userDonations.contains(donationId.key) {
                        
                        Database.database().reference().child("donations").child("\(donationId.key)").observe(.value, with: {
                            snapshot in
                            if let donationData = snapshot.value as? [String: Any] {
                                let donation = Donation.transformDonation(dict: donationData, key: snapshot.key)
                                donations.append(donation)
                            }
                            completion(donations)
                        })
                    }
                }
            } else if !snapshot.exists() {
                completion(donations)
            }
        })
    }
    
    // TODO: Write function to increment the amount donated node under an organization with Id orgId by amount
    func addDonationToOrg(orgId: String, amount: Int, uid: String="uid1") {        
        Database.database().reference().child("organization").child("\(orgId)").child("amountGiven").observeSingleEvent(of: .value, with: {
            snapshot in
            if let amountGiven = snapshot.value as? Int {
                Database.database().reference().child("organization").child("\(orgId)").child("amountGiven").setValue((amountGiven + amount))
            }
        })
        
    }
    
}

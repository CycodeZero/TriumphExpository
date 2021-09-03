//
//  OrganizationApi.swift
//  TriumphSwiftTest
//
//  Created by Jared Geller on 8/25/21.
//

import Foundation
import FirebaseDatabase

class OrganizationApi {
    func getOrganizationFromId(orgId: String, completion: @escaping (Organization?) -> Void) {
        Database.database().reference().child("organization").child(orgId).observeSingleEvent(of: .value, with: {
            snapshot in
            if let orgData = snapshot.value as? [String: Any] {
                let org = Organization.transformOrganization(dict: orgData, key: snapshot.key)
                completion(org)
            } else {
                completion(nil)
            }
        })
    }
    
    func getAllOrganizations(completion: @escaping ([Organization]?) -> Void) {
        var organizations = [Organization]()
        
        Database.database().reference().child("organization").observe(.value, with: {
            snapshot in
            if let value = snapshot.value as? [String: Any] {
                for each in value {
                    self.getOrganizationFromId(orgId: each.key, completion: {
                        organization in
                        if let organization = organization {
                            organizations.append(organization)
                        }
                        completion(organizations)
                    })
                }
            } else if !snapshot.exists() {
                completion(organizations)
            }
        })
    }
}

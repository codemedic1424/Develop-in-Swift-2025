//
//  ProfileStore.swift
//  Profile
//
//  Created by Christopher Wilshusen on 12/24/25.
//

import Foundation
import Combine

final class ProfileStore: ObservableObject {
    let nameKey = "profile.name"
    let birthdayKey = "profile.birthday"
    
    @Published var myProfile: Profile
    
    // MARK: - Education Note: Long hand version of above.
    //    var myProfile: Profile
    //    init() {
    //        self.myProfile = Profile(name: "Christopher Wilshusen", birthday: Date.now)
    //    }
    //}
    
    init() {
        // 1. Decide what name to use
        let savedName = UserDefaults.standard.string(forKey: nameKey)
        let chosenName = savedName ?? "Christopher Wilshusen"
        
        // 2. Decide what birthday to use
        let savedBirthday = UserDefaults.standard.object(forKey: birthdayKey) as? Date
        let chosenBirthday = savedBirthday ?? Date.now
        
        // 3. Build the profile ONCE
        myProfile = Profile(name: chosenName, birthday: chosenBirthday)
    }
    
    func save() {
        let defaults = UserDefaults.standard
        defaults.set(myProfile.name, forKey: nameKey)
        defaults.set(myProfile.birthday, forKey: birthdayKey)
    }
}

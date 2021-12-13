//
//  ProfileSummary.swift
//  landmarks
//
//  Created by Vincent Cloutier on 2021-12-12.
//

import SwiftUI

struct ProfileSummary: View {
    // The profile summary takes a Profile value rather than a binding to the profile because the parent view, ProfileHost, manages the state for this view.
    var profile: Profile

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)

                Text("Notifications: \(profile.prefersNotifications ? "On": "Off" )")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
    }
}


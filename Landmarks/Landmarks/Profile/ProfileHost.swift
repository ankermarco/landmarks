//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Ke Ma on 13/10/2020.
//  Copyright © 2020 Ke. All rights reserved.
//

import SwiftUI

struct ProfileHost: View {
    
    //use this property to read and write the current edit scope.
    @Environment(\.editMode) var mode
    @EnvironmentObject var userData: UserData
    
    @State var draftProfile = Profile.default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack{
                if mode?.wrappedValue == .active {
                    Button("Cancel") {
                        draftProfile = userData.profile
                        mode?.animation().wrappedValue = .inactive
                    }
                }
                Spacer()
                
                EditButton()
            }
            
            if self.mode?.wrappedValue == .inactive {
                ProfileSummary(profile: userData.profile)
            } else {
                ProfileEditor(profile: $draftProfile).onAppear {
                    draftProfile = userData.profile
                }.onDisappear {
                    userData.profile = draftProfile
                }
            }

        }.padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost().environmentObject(UserData())
    }
}

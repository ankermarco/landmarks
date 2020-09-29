//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Ke Ma on 27/09/2020.
//  Copyright © 2020 Ke. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        
        List {
            Toggle(isOn: $userData.showFavouritesOnly) {
                Text("Favourites only")
            }
            
            ForEach(userData.landmarks) { landmark in
                if !self.userData.showFavouritesOnly || landmark.isFavourite {
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
        }
        .navigationBarTitle(Text("Landmarks"))
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LandmarkList().environmentObject(UserData())
        }
    }
}

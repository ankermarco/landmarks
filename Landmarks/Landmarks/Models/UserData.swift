//
//  UserData.swift
//  Landmarks
//
//  Created by Ke Ma on 28/09/2020.
//  Copyright © 2020 Ke. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    @Published var showFavouritesOnly = false
    @Published var landmarks = landmarkData
}

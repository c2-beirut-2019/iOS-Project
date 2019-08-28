//
//  File.swift
//  Animal House
//
//  Created by Roy Geagea on 8/28/19.
//  Copyright © 2019 Roy Geagea. All rights reserved.
//

import Foundation
import Combine

class Entry: ObservableObject {
    var isDoctor = false
    var credentialsType: CredentialsPageType = .doctorLogin
    var accessToken: String = ""
}

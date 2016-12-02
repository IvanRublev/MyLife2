/*
    Copyright (C) 2016 Apple Inc. All Rights Reserved.
    See LICENSE.txt for this sample’s licensing information
    
    Abstract:
    A Person class contains the data to that is stored for each person displayed in the app.
     
    Customizations: Whenever you want to add new data about a Person, you will need to create new variables here to store that data. To learn more you can check out the the README file included in the app.
*/

import UIKit

/// This class defines the data that is stored for each person.
struct Person {
    // MARK: Properties
    var name: String?
    var image: UIImage?
    /// How much do they like dogs on a scale from 0 to 10.
    var dogPreference: Float?
}

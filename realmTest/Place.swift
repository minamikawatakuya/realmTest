import UIKit
import RealmSwift
import Foundation
 
class Place: Object {
 
    dynamic var id: Int? = nil
    dynamic var name: String? = nil
    dynamic var address: String? = nil
    dynamic var latitude: Double? = nil
    dynamic var longitude: Double? = nil
    dynamic var identifier: String? = nil
    dynamic var note: String? = nil
        
}

import UIKit

final class ObjectInfoViewModel: ObservableObject {
    
    // MARK: - Properties

    let factory: BusinessHourFactory
    @Published var object: Object
    @Published var workingDays: [[String]]
    
    // MARK: - Init

    init(object: Object) {
        self.factory = BusinessHourFactory()
        self.object = object
        self.workingDays = self.factory.buildWorkingDays(from: object.businessHours)
    }
    
    // MARK: - Public methods

    func showRoute() {
        guard let geo = DataCaretaker.loadGeo(),
              let dGisAppDeeplink = URL(string: Constants.dGisAppDeeplink)
        else { return }
        
        if UIApplication.shared.canOpenURL(dGisAppDeeplink) {
            guard let routeDeeplink = URL(string: "dgis://2gis.ru/routeSearch/rsType/car/from/\(geo.longitude),\(geo.latitude)/to/\(object.longitude),\(object.latitude)")
            else { return }
            
            UIApplication.shared.open(routeDeeplink)
        } else {
            guard let dGisAppStoreDeeplink = URL(string: Constants.dGisAppStoreDeeplink)
            else { return }
            
            UIApplication.shared.open(dGisAppStoreDeeplink)
        }
    }
}

// MARK: - Constants

extension ObjectInfoViewModel {
    enum Constants {
        static let dGisAppDeeplink = "dgis://"
        static let dGisAppStoreDeeplink = "https://apps.apple.com/ru/app/2gis-map-navigation/id481627348?l=en"
    }
}

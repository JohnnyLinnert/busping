import Foundation
import UIKit

protocol Router {
    var rootViewController: UINavigationController? { get set }
    func showRootViewController()
    func showBusStopTableViewController()
}

class NavigationRouter: Router {
    var rootViewController: UINavigationController?
    
    func showRootViewController() {
        let viewCtrl = SelectBusLineTableViewController(router: self)
        let navCtrl = UINavigationController()
        navCtrl.setViewControllers([viewCtrl], animated: true)
        rootViewController = navCtrl
    }
    
    func showBusStopTableViewController() {
        let http = KuruyoHTTP()
        let repo = TokyuBusStopRepository(http: http)
        let newTableViewCtrl = SelectBusStopTableViewController(busStopRepo: repo)
        rootViewController?.pushViewController(
            newTableViewCtrl,
            animated: true
        )
    }
}
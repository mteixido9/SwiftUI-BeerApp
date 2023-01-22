import Foundation

class BeerApiManager {
    public static let shared = BeerApiManager()
    //I kept this class In order to be able to use getRandomBeer as I wasn't able to find out how to use combine in this case.
    func getRandomBeer(success:@escaping (([Beer])-> Void), fail: @escaping (()-> Void)) {
        ServiceManager.shared.callService(urlString: "https://api.punkapi.com/v2/beers/random") {response in
            success(response)
        } fail: {
            fail()
        }
    }
}

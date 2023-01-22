import SwiftUI
import Combine

class BeersViewModel: ObservableObject {
    @Published var beerList: [Beer] = []
    @Published var randomBeer: Beer?
    @Published var beerListPage: Int = 1
    @Published var searchText: String = String()
    
    private var task: AnyCancellable?
    var subscription: Set<AnyCancellable> = []
    
    init() {
        $searchText
            .debounce(for: .milliseconds(800), scheduler: RunLoop.main)
            .removeDuplicates()
            .map({ (string) -> String? in
                if string.count < 1 {
                    return nil
                }
                return string
            })
            .compactMap{ $0 }
            .sink { (_) in
            } receiveValue: { [self] (searchField) in
                retrieveBeersBy(food: searchField)
            }.store(in: &subscription)
    }
    
    @MainActor
    func retrieveBeers(page: Int? = nil) {
        let url = "https://api.punkapi.com/v2/beers?page=\(page ?? 1)"
        task = URLSession.shared.dataTaskPublisher(for: URL(string: url)!)
            .map { $0.data }
            .decode(type: [Beer].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main).sink{value in
                self.beerList.append(contentsOf: value)
            }
    }
    
    func retrieveBeersBy(food: String){
        let replacedFood = food.replacingOccurrences(of: " ", with: "_")
        let url = "https://api.punkapi.com/v2/beers?food=\(replacedFood)"
        task = URLSession.shared.dataTaskPublisher(for: URL(string: url)!)
            .map { $0.data }
            .decode(type: [Beer].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .assign(to: \BeersViewModel.beerList, on: self)
    }
    
    
    func getRandomBeer(_ completionHandler:@escaping (()-> Void)){
        BeerApiManager.shared.getRandomBeer(success: { [weak self] response in
            self?.randomBeer = response.first
            completionHandler()
        }, fail: {
        })
    }
    
    func hasReachedEnd(of beer: Beer)-> Bool{
        beerList.last?.name == beer.name
    }
}


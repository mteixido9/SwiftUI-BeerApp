import SwiftUI

struct BeersView: View {
    
    @StateObject var viewModel = BeersViewModel()
    
    var body: some View {
        NavigationView{
        VStack{
            SearchBarView(viewModel: viewModel)
            ZStack(alignment: .bottom) {
                    BeerListView(viewModel: viewModel)
                        RandomBeerButton(viewModel: viewModel)
                }.navigationTitle("BeerPedia")
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            BeersView(viewModel: BeersViewModel())
        }
    }
}

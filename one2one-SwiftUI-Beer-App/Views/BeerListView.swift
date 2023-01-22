import SwiftUI

struct BeerListView: View {
    
    @ObservedObject var viewModel: BeersViewModel
    
    var body: some View {
        VStack {
            List(viewModel.beerList, id: \.name){beer in
                NavigationLink(destination: BeerDetailView(beer: beer)){
                    BeerRowView(beer: beer)}.frame(maxWidth: .infinity)
                    .task {
                        if viewModel.hasReachedEnd(of: beer){
                            viewModel.beerListPage += 1
                            viewModel.retrieveBeers(page: viewModel.beerListPage)
                        }
                    }
            }.onAppear{
                viewModel.retrieveBeers()
            }
        }.frame(maxWidth: .infinity).edgesIgnoringSafeArea(.all)
            .listStyle(PlainListStyle())
    }
}

struct BeerListView_Previews: PreviewProvider {
    static var previews: some View {
        BeerListView(viewModel: BeersViewModel())
    }
}

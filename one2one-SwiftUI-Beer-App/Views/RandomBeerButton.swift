import SwiftUI

struct RandomBeerButton: View {
    
    @State private var isShowingDetailView = false
    @ObservedObject var viewModel: BeersViewModel
    
    var body: some View {
        if(isShowingDetailView){
            NavigationLink(destination: BeerDetailView(beer: viewModel.randomBeer!),isActive: $isShowingDetailView){EmptyView()}
        }
        Button("Get a random beer!🍻"){
            viewModel.getRandomBeer {
                isShowingDetailView = true
            }
        }.frame(maxWidth:.infinity, maxHeight: 60).background(.blue).foregroundColor(Color.white).cornerRadius(8).padding(8).buttonStyle(.borderedProminent)
    }
}

struct RandomBeerButton_Previews: PreviewProvider {
    static var previews: some View {
        RandomBeerButton(viewModel: BeersViewModel())
    }
}

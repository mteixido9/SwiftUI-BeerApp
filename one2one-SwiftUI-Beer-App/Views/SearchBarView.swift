import SwiftUI
import Combine

struct SearchBarView: View {
    
    @ObservedObject var viewModel: BeersViewModel
    
    var body: some View {
        VStack {
            HStack {
                TextField("Search by matching food", text: $viewModel.searchText)
                    .padding(.horizontal, 40)
                    .frame(width: UIScreen.main.bounds.width - 16, height: 45, alignment: .center)
                    .background(Color(#colorLiteral(red: 0.9294475317, green: 0.9239223003, blue: 0.9336946607, alpha: 1)))
                    .clipped()
                    .cornerRadius(10)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 16)
                        }
                    )
            }.padding(.top, 8)
        }
    }
    
    struct NewSearchBarView_Previews: PreviewProvider {
        static var previews: some View {
            SearchBarView(viewModel: BeersViewModel())
        }
    }
}

import SwiftUI

struct BeerDetailView: View {
    var beer: Beer
    @State var width: CGFloat? = nil
    
    var body: some View {
        ScrollView {
            VStack{
                Text(beer.name ?? "").font(.title).frame(alignment: Alignment.leading)
                Text(beer.tagline ?? "").font(.title2).foregroundColor(.blue).frame(alignment: Alignment.leading)
                
                kingFisherImageView(url: beer.imageUrl ?? "").resizable().aspectRatio(contentMode: .fit).frame(maxHeight:184)
                VStack{
                    Text(beer.description ?? "").font(.system(size:16)).padding()
                    Text("Matching food: \(beer.foodPairing?.joined(separator: ", ") ?? "")") .font(.system(size:16)).padding()
                }.padding(8)
                
                HStack{
                    Text(Helper.app.getGraduation(abv: beer.abv ?? 0)).foregroundColor(.white).padding()
                    Text(Helper.app.getGraduation(ibu: beer.ibu ?? 0)).foregroundColor(.white).padding()
                }.frame(maxWidth: .infinity, maxHeight: 60).background(.blue).cornerRadius(8).padding(8)
            }
        }
        
    }
}

struct BeerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BeerDetailView(beer: Beer(name: "Sample Beer", tagline: "It's just a sample", description: "Most common sample ever", imageUrl: "https://images.punkapi.com/v2/keg.png", abv: 5.0, ibu: 3.0, foodPairing: ["chicken","spicy"]))
    }
}

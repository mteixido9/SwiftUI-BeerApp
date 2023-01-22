import SwiftUI

struct BeerRowView: View {
    
    var beer: Beer
    
    var body: some View {
        HStack{
            kingFisherImageView(url: beer.imageUrl ?? "").resizable().aspectRatio(contentMode: .fit)
                .frame(width: 84, height: 84)
            VStack(alignment: .leading){
                Text(beer.name ?? "").font(.title2).truncationMode(.tail).lineLimit(0).padding(2)
                Text(beer.tagline ?? "")
                    .font(.subheadline).truncationMode(.tail).lineLimit(0)
                HStack{
                    Text(Helper.app.getGraduation(abv: beer.abv ?? 0)).font(.subheadline)
                        .dynamicTypeSize(DynamicTypeSize.small).truncationMode(.tail).lineLimit(0)
                    Text(Helper.app.getGraduation(ibu: beer.ibu ?? 0)).font(.subheadline).dynamicTypeSize(DynamicTypeSize.small).truncationMode(.tail).lineLimit(0)
                }
            }
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct BeerRowView_Previews: PreviewProvider {
    static var previews: some View {
        BeerRowView(beer: Beer(name: "Sample Beer", tagline: "It's just a sample", description: "Most common sample ever", imageUrl: "https://images.punkapi.com/v2/keg.png", abv: 5.0, ibu: 3.0, foodPairing: ["chicken","spicy"]))
    }
}

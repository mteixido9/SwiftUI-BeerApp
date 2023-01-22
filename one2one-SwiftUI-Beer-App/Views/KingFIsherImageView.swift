import SwiftUI
import struct Kingfisher.KFImage

@ViewBuilder
func kingFisherImageView(url:String) -> KFImage {
    KFImage(URL(string: url))
}

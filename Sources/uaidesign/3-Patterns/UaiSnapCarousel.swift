import SwiftUI

//

public struct UaiSnapCarousel: View {
    
    @ObservedObject var viewModel: ImagesViewModel
    var url: String
    
    init(viewModel: ImagesViewModel, url: String) {
        self.viewModel = viewModel
        self.url = url
    }
    
    @State var currentIndex: Int = 0
    
    public var body: some View {
        
        SnapCarousel(index: $currentIndex, items: viewModel.images, content: { image in
            
            GeometryReader { proxy in
                let size = proxy.size
                
                UaiImageCard(aspect: .square) {
                    AsyncImage(url: image.url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        VStack (alignment: .center) {
                            Spacer()
                            ProgressView()
                            Spacer()
                        }
                    }
                }
                .frame(width: size.width)
            }
        })
        .onAppear{
            ImagesViewModel(apiURL: url).getImages()
        }
    }
}

//

//struct UaiSnapCarousel_Previews: PreviewProvider {
//    static var previews: some View {
//        UaiSnapCarousel(viewModel: ImagesViewModel(apiURL: "https://my-json-server.typicode.com/jeffersongreco/uaiplaceholderapi/photos"))
//
//    }
//}

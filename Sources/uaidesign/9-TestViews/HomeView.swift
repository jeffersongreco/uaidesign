import SwiftUI

//

struct HomeView: View {
    
    @State var photos: [Photo] = []
    
    var body: some View {
        ScrollView {
            LazyVStack {
                
                UaiHeader {
                    Image.uaiPlaceholderAvatarBig.resizable().aspectRatio(contentMode: .fill)
                } contentBottom: {
                    
                } contentTop: {
                    
                }
                
            }
        }
        .ignoresSafeArea()
    }
}

//

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

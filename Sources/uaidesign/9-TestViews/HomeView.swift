import SwiftUI




struct HomeView: View {
    
    @State var photos: [Photo] = []
    @State var posts: [Post] = []
    
    var body: some View {
        
        ScrollView {
            
            UaiHeader {
                Image.uaiPlaceholderAvatarBig.resizable().aspectRatio(contentMode: .fill)
            } contentBottom: {
                
            } contentTop: {
                
            }
            
            List(posts) { post in
                //AsyncImage(url: photo.url)
                Text(post.title)
            }
            .onAppear{
                Api().getPhotos { (photos) in
                    self.photos = photos
                }
                
                Api().getPosts { (posts) in
                    self.posts = posts
                }
            }
            
            
        }
        .ignoresSafeArea()
        
    }
    
}






struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

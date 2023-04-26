import Foundation


struct Image: Codable, Identifiable {
    let id = UUID()
    var url: URL
}



class API {
    func getImages(completion: @escaping ([Image]) -> () ) {
        guard let url = URL(string: "https://my-json-server.typicode.com/jeffersongreco/uaiplaceholderapi/photos") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            let images = try! JSONDecoder().decode([Image].self, from: data!)
            
            DispatchQueue.main.async {
                completion(images)
            }
        }
        .resume()
    }
}


class ImagesViewModel: ObservableObject {
    @Published var images: [Image] = []
    let apiURL: String
    
    init(apiURL: String) {
        self.apiURL = apiURL
    }
    
    func getImages() {
        guard let url = URL(string: apiURL) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            let images = try! JSONDecoder().decode([Image].self, from: data!)
            
            DispatchQueue.main.async {
                self.images = images
            }
        }
        .resume()
    }
}

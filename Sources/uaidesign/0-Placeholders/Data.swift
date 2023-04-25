import Foundation


struct Photo: Codable, Identifiable {
    let id = UUID()
    var url: String
}

struct Post: Codable, Identifiable {
    let id = UUID()
    var title: String
}

class Api {
    func getPhotos(completion: @escaping ([Photo]) -> () ) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            let photos = try! JSONDecoder().decode([Photo].self, from: data!)
            
            DispatchQueue.main.async {
                completion(photos)
            }
        }
        .resume()
    }
    
    func getPosts(completion: @escaping ([Post]) -> () ) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            let posts = try! JSONDecoder().decode([Post].self, from: data!)
            
            DispatchQueue.main.async {
                completion(posts)
            }
        }
        .resume()
    }
}

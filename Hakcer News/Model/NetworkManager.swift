//
//  NetworkManager.swift
//  Hakcer News
//
//  Created by PhuongDo on 30/07/2023.
//

/*  Để sử dụng ObservableObject, bạn cần làm hai bước:
Tạo một class hoặc struct thỏa mãn ObservableObject protocol bằng cách khai báo @Published trước mỗi thuộc tính mà bạn muốn theo dõi.
Sử dụng @ObservedObject hoặc @StateObject để gắn kết đối tượng ObservableObject với view trong SwiftUI.
 */
import Foundation

class NetworkManager: ObservableObject{
    
    @Published var posts = [Post]() //posts = hits in struct Result
    
    func fetchData(){
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil{
                    let decoder = JSONDecoder()
                    if let safeData = data{
                        do{
                           let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async { // makse sure to fetch the main thread
                                self.posts = results.hits
                            }
                        }
                        catch{
                            print(error)
                        }
                    }
                  
                }
            }
            task.resume() 
        }
    }
}

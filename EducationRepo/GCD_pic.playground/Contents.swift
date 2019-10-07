import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

var view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
var eiffelImage = UIImageView(frame: CGRect(x:0, y: 0, width: 200, height: 200))

eiffelImage.backgroundColor = UIColor.blue
eiffelImage.contentMode = .scaleAspectFit
view.addSubview(eiffelImage)

PlaygroundPage.current.liveView = view

let imageURL = URL(string: "http://www.planetware.com/photos-large/F/france-paris-eiffel-tower.jpg")!
//Classic way
func fetchImage() {
    let queue = DispatchQueue.global(qos: .utility)
    queue.async{
        if let data = try? Data(contentsOf: imageURL){
            DispatchQueue.main.async {
                eiffelImage.image = UIImage(data: data)
            }
        }
    }
}
//fetchImage()


// Using async API
func fetchImage2(){
    let task = URLSession.shared.dataTask(with: imageURL){
        (data, response, error) in
        if let imageData = data {
            DispatchQueue.main.async {
                print("Show image data")
                eiffelImage.image = UIImage( data: imageData)
            }
            print("Did download image data")
        }
    }
    task.resume()
}
//fetchImage2()

//Way 3

func asyncLoadImage(imageURL: URL, runQueue: DispatchQueue, completionQueue: DispatchQueue, completion: @escaping (UIImage?, Error?)-> ()){
    runQueue.async {
        do{
            let data = try Data(contentsOf: imageURL)
            completionQueue.async {
                completion(UIImage(data: data),nil)
                
            }
        }
        catch let error {
            completionQueue.async {
                completion(nil, error)}
        }
    }
}

func fetchImage3(){
    asyncLoadImage(imageURL: imageURL, runQueue: DispatchQueue.global(), completionQueue: DispatchQueue.main){
        result, error in
        guard let image = result else {return}
        eiffelImage.image = image
    }
}
fetchImage3()

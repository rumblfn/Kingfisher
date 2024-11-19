import UIKit

class ImageLoader {
    static let shared = ImageLoader()
    
    private let cache = NSCache<NSString, UIImage>()
    private let session = URLSession.shared
    
    private init() {}
    
    func loadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        // Проверяем, есть ли изображение в кэше
        let cacheKey = NSString(string: url.absoluteString)
        if let cachedImage = cache.object(forKey: cacheKey) {
            completion(cachedImage)
            return
        }
        
        // Загружаем изображение из сети
        let task = session.dataTask(with: url) { data, response, error in
            guard let data = data, let image = UIImage(data: data), error == nil else {
                DispatchQueue.main.async { completion(nil) }
                return
            }
            
            // Сохраняем изображение в кэше
            self.cache.setObject(image, forKey: cacheKey)
            
            DispatchQueue.main.async { completion(image) }
        }
        task.resume()
    }
}

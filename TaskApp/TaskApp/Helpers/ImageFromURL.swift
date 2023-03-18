//
//  ImageFromURL.swift
//  TaskApp
//
//  Created by Secrieru Andrei on 18.03.2023.
//

import Foundation
import SwiftUI
import URLImage

class URLImageCache {
    static let shared = URLImageCache()
    private let cache = NSCache<NSString, UIImage>()
    
    func getImage(for url: URL) -> UIImage? {
        return cache.object(forKey: url.absoluteString as NSString)
    }
    
    func setImage(_ image: UIImage, for url: URL) {
        cache.setObject(image, forKey: url.absoluteString as NSString)
    }
}

class URLImageService {
    static let shared = URLImageService()
    private let cache = URLImageCache.shared
    private let downloader = URLSession.shared
    
    func downloadImage(_ url: URL, completion: @escaping (Result<UIImage, Error>) -> Void) {
        if let cachedImage = cache.getImage(for: url) {
            completion(.success(cachedImage))
            return
        }
        
        downloader.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data, let image = UIImage(data: data) else {
                completion(.failure(NSError(domain: "com.example.URLImageService", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to decode image data"])))
                return
            }
            
            self.cache.setImage(image, for: url)
            completion(.success(image))
        }.resume()
    }
}

struct URLImage<Content>: View where Content: View {
    @StateObject private var loader: URLImageLoader
    private let content: (Image) -> Content
    
    init(url: URL, @ViewBuilder content: @escaping (Image) -> Content) {
        _loader = StateObject(wrappedValue: URLImageLoader(url: url))
        self.content = content
    }
    
    var body: some View {
        if let image = loader.image {
            content(Image(uiImage: image))
        } else {
            content(Image(systemName: "photo"))
                .onAppear(perform: loader.load)
        }
    }
    
    private class URLImageLoader: ObservableObject {
        @Published var image: UIImage?
        private let url: URL
        private let service = URLImageService.shared
        
        init(url: URL) {
            self.url = url
        }
        
        func load() {
            service.downloadImage(url) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let image):
                        self.image = image
                    case .failure(let error):
                        print("Failed to download image: \(error)")
                    }
                }
            }
        }
    }
}

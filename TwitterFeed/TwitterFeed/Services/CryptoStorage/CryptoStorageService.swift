import Foundation

protocol CryptoStorageService {
    
    func put(key: String, value: String)
    func get(key: String) -> String
    
}

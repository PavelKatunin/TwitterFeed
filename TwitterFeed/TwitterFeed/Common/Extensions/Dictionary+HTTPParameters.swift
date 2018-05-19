import Foundation

extension Dictionary where Key == String, Value == String {
    
    func toHTTPParameters() -> String {
        var count = 1
        return self.reduce("", { (result, keyValue) -> String in
            let lastChar = count == self.count ? "" : "&"
            count += 1
            return result + keyValue.key + "=" + keyValue.value + lastChar
        })
    }
    
}

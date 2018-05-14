import Foundation

class LoadTweetsOperation: RemoteOperation {
    
    //MARK: - input
    var twitsCount: Int = 1
    
    //MARK: - output
    var result: Result<[Tweet]>?
    
}

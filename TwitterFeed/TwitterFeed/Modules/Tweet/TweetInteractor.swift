import UIKit

final class TweetInteractor: TweetInteractorProtocol {
    
    weak var presenter: TweetInteractorPresenter?
    
    let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func downloadUserImage(url: URL) {
        httpClient.downloadData(fromUrl: url) { (result) in
            switch result {
            case .success(let imageData):
                if let userImage = UIImage(data: imageData) {
                    self.presenter?.didDownload(userImage: userImage)
                }

            case .failure(let _):
                print("Download image error, nothing much to do")
            }
        }
    }
    
}

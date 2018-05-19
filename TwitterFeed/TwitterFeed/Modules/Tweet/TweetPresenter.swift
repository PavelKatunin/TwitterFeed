//
//  TweetPresenter.swift
//  TwitterFeed
//
//  Created Pavel Katunin on 5/19/18.
//  Copyright © 2018 PavelKatunin. All rights reserved.
//
//

import UIKit

final class TweetPresenter {

    fileprivate weak var view: TweetViewProtocol!
    fileprivate let interactor: TweetInteractorProtocol
    fileprivate let router: TweetWireframeProtocol
    
    weak var output: TweetOutput?

    init(view: TweetViewProtocol, interactor: TweetInteractorProtocol, router: TweetWireframeProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension TweetPresenter: TweetViewPresenter {
    func viewLoaded() {
        view?.title = "Tweet"
    }
}

extension TweetPresenter: TweetInteractorPresenter {
    
}

extension TweetPresenter: TweetIO {
    
}

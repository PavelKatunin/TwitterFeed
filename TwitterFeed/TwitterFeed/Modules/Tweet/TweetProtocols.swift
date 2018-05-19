//
//  TweetProtocols.swift
//  TwitterFeed
//
//  Created Pavel Katunin on 5/19/18.
//  Copyright © 2018 PavelKatunin. All rights reserved.
//
//

import Foundation

// MARK: - Wireframe

protocol TweetWireframeProtocol: class {

}

// MARK: - Presenter

protocol TweetViewPresenter: class {
    func viewLoaded()
}

protocol TweetInteractorPresenter: class {
    
}

typealias TweetPresenterProtocol = TweetViewPresenter & TweetInteractorPresenter

// MARK: - Interactor

protocol TweetInteractorProtocol: class {
    
}

// MARK: - View

protocol TweetViewProtocol: class {
    var title: String? { set get }
}

// MARK: - IO

protocol TweetInput: class {
    
}

protocol TweetOutput: class {
    
}

protocol TweetIO: TweetInput {
    weak var output: TweetOutput? { set get }
}

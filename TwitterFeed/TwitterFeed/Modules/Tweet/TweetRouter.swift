//
//  TweetRouter.swift
//  TwitterFeed
//
//  Created Pavel Katunin on 5/19/18.
//  Copyright © 2018 PavelKatunin. All rights reserved.
//
//

import UIKit

final class TweetRouter: TweetWireframeProtocol {
    
    fileprivate weak var view: (UIViewController & TweetViewProtocol)?
    
    static func createModule(output: TweetOutput? = nil) throws -> ViperModule<UIViewController, TweetIO> {
        let view = TweetViewController(nibName: nil, bundle: nil)
        let interactor = TweetInteractor()
        let router = TweetRouter()
        let presenter = TweetPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.view = view
        presenter.output = output
        
        return ViperModule(view: view, input: presenter)
    }
}

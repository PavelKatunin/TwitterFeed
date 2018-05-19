//
//  TweetViewController.swift
//  TwitterFeed
//
//  Created Pavel Katunin on 5/19/18.
//  Copyright © 2018 PavelKatunin. All rights reserved.
//
//

import UIKit

final class TweetViewController: UIViewController, TweetViewProtocol {

	var presenter: TweetViewPresenter!

	override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewLoaded()
    }

}

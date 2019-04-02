//
//  RootRouter.swift
//  UnitBeanTestIOs
//
//  Created by Admin on 29.03.2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

final class RootRouter {
    func root(_ window: inout UIWindow?, rootViewController: UIViewController) {
        let frame = UIScreen.main.bounds
        window = UIWindow(frame: frame)
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }
}

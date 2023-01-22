//
//  one2one_SwiftUI_Beer_AppApp.swift
//  one2one-SwiftUI-Beer-App
//
//  Created by Marc  Teixidó Carrera on 16/1/23.
//

import SwiftUI

@main
struct one2one_SwiftUI_Beer_AppApp: App {
    var body: some Scene {
        WindowGroup {
            BeersView(viewModel: BeersViewModel())
        }
    }
}

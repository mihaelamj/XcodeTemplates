//___FILEHEADER___

import SwiftUI

@main
struct ___PARENTPACKAGENAME:identifier___App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

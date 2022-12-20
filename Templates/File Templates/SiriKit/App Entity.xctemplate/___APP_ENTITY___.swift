//___FILEHEADER___

import Foundation
___IMPORTS___

@available(iOS 16.0, macOS 13.0, watchOS 9.0, tvOS 16.0, *)
struct ___APP_ENTITY___: AppEntity {
    static var typeDisplayRepresentation = TypeDisplayRepresentation(name: "___APP_ENTITY_DISPLAY_NAME___")
___APP_ENTITY_PROPERTIES___
    struct ___APP_ENTITY_QUERY___: ___APP_ENTITY_QUERY_TYPE___ {
        func entities(for identifiers: [___APP_ENTITY___.ID]) async throws -> [___APP_ENTITY___] {
            // TODO: return ___APP_ENTITY___ entities with the specified identifiers here.
            return []
        }
___APP_ENTITY_STRING_QUERY_FUNCTION___
        func suggestedEntities() async throws -> [___APP_ENTITY___] {
            // TODO: return likely ___APP_ENTITY___ entities here.
            // This method is optional; the default implementation returns an empty array.
            return []
        }
    }
    static var defaultQuery = ___APP_ENTITY_QUERY___()

    var id: String // if your identifier is not a String, conform the entity to EntityIdentifierConvertible.
    var displayString: String
    var displayRepresentation: DisplayRepresentation {
        DisplayRepresentation(title: "\(displayString)")
    }

    init(id: String, displayString: String) {
        self.id = id
        self.displayString = displayString
    }
}
___AUXILIARY_CONTENT___

//___FILEHEADER___

import NetworkExtension

class ___FILEBASENAME___: NEFilterPacketProvider {

    override func startFilter(completionHandler: @escaping (Error?) -> Void) {

		packetHandler = { (context, interface, direction, packetBytes, packetLength) in
			return .allow
		}
		completionHandler(nil)
    }
    
    override func stopFilter(with reason: NEProviderStopReason, completionHandler: @escaping () -> Void) {

		// Add code here to tear down the filter
        completionHandler()
    }
}

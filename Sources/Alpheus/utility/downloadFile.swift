
import PerfectCURL

extension Utility {

    static func downloadFile(url: String, _ callback: @escaping ([UInt8]) -> Void) {
        CURLRequest(url).perform {
        	confirmation in
        	do {
        		let response = try confirmation()
						callback(response.bodyBytes)
        	} catch let error as CURLResponse.Error {
        		print("Failed: response code \(error.response.responseCode)")
          } catch {
        		print("Fatal error \(error)")
        	}
        }
    }
}

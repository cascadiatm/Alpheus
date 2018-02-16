import PerfectHTTP

extension Handlers {
    /// API endpoint for handling the deletion of a record
    static func fileIngest(data: [String:Any]) throws -> RequestHandler {
        return {
        request, response in

            let file = File()

            if let id = request.urlVariables["id"] {
        				do {
        					try file.get(Int(id) ?? 0)
        				} catch {
        					// Return an informative error
        					Handlers.error(request, response, error: "Incorrect ID", code: .badRequest)
        					return
        				}
        		}

            if file.id > 0 {
      				do {
      					// Attempt deletion
      					try file.ingest()

      					// Success
      					let _ = try? response.setBody(json: ["error": "none"])
      				} catch {
      					// Return an informative error
      					Handlers.error(request, response, error: "\(error)", code: .badRequest)
      					return
      				}
      			} else {
      				// Return an error specifying ID fetch failed
      				Handlers.error(request, response, error: "Incorrect ID", code: .badRequest)
      				return
      			}

            response.completed()
        }
    }
}

import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import PerfectRequestLogger
import PerfectLogger
import SQLiteStORM
import PerfectSession

SQLiteConnector.db = "./alpheus.db"

var HTTPport = 8181
config()

let httplogger = RequestLogger()
RequestLogFile.location = "./alpheus.log"

// Configure Server
var confData: [String:[[String:Any]]] = [
	"servers": [
		[
			"name":"localhost",
			"port":HTTPport,
			"routes":[],
			"filters":[]
		]
	]
]


SessionConfig.name = "Alpheus"
SessionConfig.idle = 3600

SessionConfig.cookieDomain = "localhost"
SessionConfig.IPAddressLock = true
SessionConfig.userAgentLock = true
SessionConfig.CSRF.checkState = true

SessionConfig.CORS.enabled = true
// Array of acceptable hostnames for incoming requests
// To enable CORS on all, have a single entry, *
SessionConfig.CORS.acceptableHostnames = ["*"]
// However if you wish to enable specific domains:
//SessionConfig.CORS.acceptableHostnames.append("http://www.test-cors.org")
// Array of acceptable methods
//public var methods: [HTTPMethod] = [.get, .post, .put]
SessionConfig.CORS.maxAge = 60

var sessionDriver = SessionMemoryDriver()

Utility.initializeObjects()

// Load Filters
confData["servers"]?[0]["filters"] = filters()

// Load Routes
confData["servers"]?[0]["routes"] = mainRoutes()


do {
	// Launch the servers based on the configuration data.
	try HTTPServer.launch(configurationData: confData)
} catch {
	 // fatal error launching one of the servers
	fatalError("\(error)")
}

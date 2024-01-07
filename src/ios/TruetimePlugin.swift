import TrueTime

@objc(TruetimePlugin) class TruetimePlugin : CDVPlugin {
  @objc(getTime:)
  func getTime(command: CDVInvokedUrlCommand) {
      var pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR)
        let client = TrueTimeClient.sharedInstance
        // ntp url received from the javascript interface
        let ntpUrl = command.arguments![0] as! String?;
    
        if(ntpUrl == "" || ntpUrl == nil){
            print("Invalid ntp url, value of npt url passed : ", ntpUrl!)
            return
        }
    
        let urlString = ntpUrl ?? "pool.ntp.org"
    
//        client.pause()
        client.start(pool: [urlString])
      client.fetchIfNeeded(completion:  { result in
          switch result {
          case let .success(referenceTime):
              let now = referenceTime.now()
              let T = referenceTime.response()       //offsetValues
              let offset = referenceTime.offset()    //offset
              let delay = (T[3] - T[0]) - (T[2] - T[1])
              let timestamp = T[3] + offset
              pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs:["callback" :timestamp, "t0" : T[0], "t1" : T[1], "t2" : T[2], "t3" : T[3], "delay" : delay])
              self.commandDelegate.send(pluginResult, callbackId: command.callbackId)
          case let .failure(error):
              print("Error! \(error)")
          }
      })
    }
}

extension Date {
    var millisecondsSince1970:Int64 {
        Int64((self.timeIntervalSince1970 * 1000.0))
    }
    
    init(milliseconds:Int64) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
}

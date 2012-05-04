class AltimeterViewController < UIViewController

  attr_accessor :locationManager

  def init
    self.locationManager = CLLocationManager.new.tap do |lm|
      lm.delegate = self
      # How do I access kConstants in RM?
      # lm.desired_accuracy = kCLLocationAccuracyBest
      lm.startUpdatingLocation
    end
    self
  end

  def loadView
    self.view = UILabel.new.tap do |v|
      v.font = UIFont.systemFontOfSize 34
      v.centersHorizontally = true
    end
  end

  module LocationManagerDelegate
    def locationManager manager, didUpdateToLocation:newLoc, fromLocation:_
      setAltitude newLoc.altitude
    end

    def locationManager manager, didFailWithError:error
    end
  end; include LocationManagerDelegate

  def setAltitude altitude
    view.text = "Altitude: #{altitude}"
  end

end

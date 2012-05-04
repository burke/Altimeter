class AppDelegate

  attr_accessor :window

  # I wouldn't normally use #tap so much here, but it seemed like a fun way to
  # play with the normal Obj-C way of doing things here.
  def application application, didFinishLaunchingWithOptions:launchOptions
    self.window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds).tap do |w|
      w.rootViewController = AltimeterViewController.new.tap do |vc|
        vc.wantsFullScreenLayout = true
      end
      w.makeKeyAndVisible
    end
    true
  end

end

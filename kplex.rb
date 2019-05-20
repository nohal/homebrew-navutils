class Kplex < Formula
  desc "NMEA 0183 multiplexer"
  homepage "http://www.stripydog.com/kplex/"
  url "https://github.com/stripydog/kplex/archive/v1.4.tar.gz"
  sha256 "ebe3dc810e90531dc80fa70935a88dc9db1d5b1a9e259b16a688ad4f5b09842c"
  head "https://github.com/stripydog/kplex.git", :branch => "develop"

  def install
    # kplex's make install target tries chowning and chmodding the binary,
    # so just make and then copy the binary into place ourselves.
    system "make"
    bin.install "kplex"

    # Copy the example config file into the prefix so the user can copy it.
    prefix.install "kplex.conf.ex"

    # Install the manpage
    man1.install "kplex.1"
  end

  def caveats; <<~EOS
    A sample config file can be found at "#{prefix}/kplex.conf.ex".
    Kplex will look for per-user config at "~/Library/Preferences/kplex.ini"
    or a system-wide config file at "/etc/kplex.conf".

    You can copy the example config file to your user directory with the
    following command:
    $ cp #{prefix}/kplex.conf.ex ~/Library/Preferences/kplex.ini

    See http://www.stripydog.com/kplex/configuration.html for config details.

    If you want to run kplex as a service, you will need to create a config
    file before starting the service.
  EOS
  end

  plist_options :manual => "kplex"

  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>KeepAlive</key>
      <true/>
      <key>Label</key>
      <string>#{plist_name}</string>
      <key>ProgramArguments</key>
      <array>
        <string>#{opt_bin}/kplex</string>
      </array>
      <key>RunAtLoad</key>
      <true/>
    </dict>
    </plist>
  EOS
  end

  test do
    system "#{bin}/kplex", "-V"
  end
end

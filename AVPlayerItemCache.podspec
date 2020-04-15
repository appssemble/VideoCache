Pod::Spec.new do |s|
  # Version
  s.version       = "1.2.1"
  s.swift_version = '5'

  # Meta
  s.name         = "AVPlayerItemCache"
  s.summary      = "Video caching for AVPlayer"
  s.homepage     = "https://github.com/appssemble/VideoCache"
  s.license      = "MIT"
  s.authors      = { "Razvan Chelemen" => "razvan@appssemble.com" }
  s.description  = <<-DESC
                    Easily cache your AVPlayer video and audio.
                   DESC

  # Compatibility & Sources
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/appssemble/VideoCache.git", :tag => s.version.to_s }
  s.source_files = 'Sources/**/*.swift'
  s.requires_arc = true

end

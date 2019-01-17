Pod::Spec.new do |s|

  s.name         = "APLiOSFrameworkExtensions"
  s.version      = "0.0.8"
  s.summary      = "A collection of extensions, helper methods and functions etc."

  s.description  = <<-DESC
			A collection of extensions, helper methods and functions etc. made with Swift. This is meant to serve as basic toolbox for app projects.
                   DESC

  s.homepage     = "https://github.com/apploft/APLiOSFrameworkExtensions"

  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.swift_version = '4.2'

  s.authors             = { "Carsten Schlobohm" => "carsten.schlobohm@apploft.de", "Tino Rachui" => "tino.rachui@apploft.de", "Stephan Lerner" => "stephan.lerner@apploft.de" }

  s.platform     = :ios, "11.0"

  s.source       = { :git => "https://github.com/apploft/APLiOSFrameworkExtensions.git", :tag => s.version.to_s }

  s.source_files  = "Classes", "Classes/**/*"
  s.exclude_files = "Classes/Exclude"

  s.requires_arc = true

end

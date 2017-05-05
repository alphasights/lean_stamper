# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.authors       = ["DeLynn Berry", "Tadas Tamosauskas"]
  gem.email         = ["delynn@gmail.com", "tadas@alphasights.com"]
  gem.description   = %q{A stripped down version of original userstamp plugin}
  gem.summary       = %q{A stripped down version of original userstamp plugin. References the stamper object itself, not the id. Only creator and updater.}
  gem.homepage      = "https://github.com/alphasights/lean_stamper"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "lean_stamper"
  gem.require_paths = ["lib"]
  gem.version       = "0.0.5"
end

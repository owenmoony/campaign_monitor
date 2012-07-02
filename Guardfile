guard "bundler" do
  watch("Gemfile")
end

group "test" do
  guard "spin", notify: false, rspec: false do
    watch(%r{^(?:app|config)/.*?([^\/]*)/([^\/]*)\.rb$}) { |m| Dir["test/unit/#{m[1]}/#{m[2]}_test.rb"] }
    watch(%r{^lib/(.+)\.rb$}) { |m| Dir["test/*/lib/#{m[1]}_test.rb"] }
    watch(%r{^app/controllers/(.*)\.rb$}) { |m| "test/functional/#{m[1]}_test.rb" }
    watch(%r{^app/views/(.*)/[^\/]+$}) { |m| "test/functional/#{m[1]}_controller_test.rb" }
    watch(%r{^test/.+_test\.rb$})
  end
end

group "livereload" do
  guard 'livereload', :watch_root => true, :apply_js_live => false, :apply_css_live => false do
    watch(%r{app/.+\.(rb|erb|haml|scss|rep)})
    watch(%r{app/helpers/.+\.rb})
    watch(%r{public/.+\.(css|js|html)})
    watch(%r{config/.+\.(yml|json)})

    watch(%r{app/assets/javascripts/(.+)\.(js\.coffee|js)})
    watch(%r{spec/javascripts/(.+)_spec\.(js\.coffee|js)})
    watch(%r{spec/javascripts/spec\.(js\.coffee|js)})
  end
end

group 'jasmine' do
  guard 'jasmine' do
    watch(%r{app/assets/javascripts/(.+)\.(js\.coffee|js)}) { |m| "spec/javascripts/#{m[1]}_spec.#{m[2]}" }
    watch(%r{spec/javascripts/(.+)_spec\.(js\.coffee|js)})  { |m| "spec/javascripts/#{m[1]}_spec.#{m[2]}" }
    watch(%r{spec/javascripts/spec\.(js\.coffee|js)})       { "spec/javascripts" }
  end
end

# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "script_detector"
  gem.homepage = "http://github.com/jpatokal/script_detector"
  gem.license = "MIT"
  gem.summary = %Q{Utility library for determining if string is traditional Chinese, simplified Chinese, Japanese or Korean}
  gem.description = %Q{Utility library for determining if string is traditional Chinese, simplified Chinese, Japanese or Korean}
  gem.email = "jpatokal@iki.fi"
  gem.authors = ["Jani Patokallio"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core/rake_task'
namespace :spec do
  desc "Run all specs and check coverage afterwards"
  task "covered" => ["spec:spec", "spec:coverage"]

  desc "Run all specs"
  RSpec::Core::RakeTask.new do |t|
    t.rspec_opts = File.read(Rails.root.join('spec', 'spec.opts')).chomp rescue ''
    t.pattern = 'spec/*_spec.rb'
  end

  task "coverage" do
    # TODO This is a nasty hack until SimpleCov gets its act together, see https://github.com/colszowka/simplecov/issues/96
    ensure_test_coverage 100
  end
end

require 'nokogiri'
def ensure_test_coverage(threshold)
  coverage_report = "target/reports/coverage/index.html"
  doc = Nokogiri::HTML File.read(coverage_report)
  node = doc.css("h2:first .covered_percent").first
  covered = node.content.to_f
  raise "The test coverage #{covered}% is below the threshold of #{threshold}%. See #{coverage_report} for details." if covered < threshold
end

task :default => :spec

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "script_detector #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end


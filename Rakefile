$:.unshift File.expand_path("../lib", __FILE__)
# -*- ruby -*-

require 'rubygems'
require 'hoe'
require 'irc_teams'

task :run_bot do
  puts 'bot started'
  i = IrcTeams.new
  i.start
end

# Hoe.plugin :compiler
# Hoe.plugin :gem_prelude_sucks
# Hoe.plugin :inline
# Hoe.plugin :racc
# Hoe.plugin :rcov
# Hoe.plugin :rubyforge

Hoe.spec 'irc_teams' do
  # HEY! If you fill these out in ~/.hoe_template/Rakefile.erb then
  # you'll never have to touch them again!
  # (delete this comment too, of course)

  developer('tyler', 'tyler@example.com')

  # self.rubyforge_name = 'irc_teamsx' # if different than 'irc_teams'

  # license 'MIT' # this should match the license in the README
end

# vim: syntax=ruby

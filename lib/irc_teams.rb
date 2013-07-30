require 'irc_teams/bot'
require 'cinch'

class Interface
  include Cinch::Plugin

  match /(.+)/, use_prefix: false

  def initialize(bot=Bot.new)
    super
    @bot = bot
  end
  
  def execute(m, message)
    m.reply(@bot.process(m.user.nick,message))
  end
end

class IrcTeams
  VERSION = '1.0.0'

  def initialize(bot = Interface,
                 server="hobana.freenode.net",
                 nick="team-manager-bot",
                 channel="#super-duper")
      @bot = Cinch::Bot.new do
      configure do |c|
        c.server = server
        c.nick = nick
        c.channels = [channel]
        c.plugins.plugins = [bot]
      end
    end
  end

  def start
    @bot.start
  end
  
end

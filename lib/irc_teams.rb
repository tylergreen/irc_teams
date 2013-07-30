require 'irc_teams/bot'
require 'cinch'

class Interface
  include Cinch::Plugin

  match /(.+)/, use_prefix: false

  def initialize(arg)
    super(arg)
    @bot = Bot.new
  end
  
  def execute(m, message)
    m.reply(@bot.handle(m.user.nick, message))
  end
end

class IrcTeams
  VERSION = '1.0.0'

  def initialize(server="hobana.freenode.net",
                 nick="team-manager-bot",
                 channel="#super-duper")
      @cinch = Cinch::Bot.new do
      configure do |c|
        c.server = server
        c.nick = nick
        c.channels = [channel]
        c.plugins.plugins = [Interface]
      end
    end
  end

  def start
    @cinch.start
  end
  
end

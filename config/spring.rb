Spring.after_fork do
  FactoryBot.reload if defined?(FactoryBot)
  MessageBus.after_fork if defined?(MessageBus)
end

%w(
  .ruby-version
  .rbenv-vars
  tmp/restart.txt
  tmp/caching-dev.txt
).each { |path| Spring.watch(path) }

export RUBYLIB=lib

proto:
	ruby bin/yapura examples/protobuf_tutorial.rb proto
dump:
	ruby bin/yapura examples/protobuf_tutorial.rb dump
simple:
	ruby bin/yapura examples/simple_definition.rb ruby

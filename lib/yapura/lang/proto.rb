module Yapura
  module Lang
    module Proto
      class Generator
        attr_accessor :level

        def initialize
          self.level = 0
        end

        def call(nodes)
          nodes.each do |node|
            dispatch node
          end
        end

        def namespace(node)
          if self.level == 0
            puts "package #{node.name};"
          else
            puts "#{indent} #namespace #{node.name.capitalize}"
          end
          self.level += 1
          node.children.each do |node|
            dispatch node
          end
          self.level -= 1
        end

        def structure(node)
          puts "#{indent}message #{node.name} {"
          #puts "#{indent}  ##{node.inspect}"
          self.level += 1
          node.children.each do |node|
            dispatch node
          end
          node.fields.each do |node|
            dispatch node
          end
          self.level -= 1
          puts "#{indent}}"
        end

        def enum(node)
          puts "#{indent}module #{node.name.capitalize}"
          self.level += 1
          node.children.each do |name, value|
            puts "#{indent}#{name} = #{value}"
          end
          self.level -= 1
          puts "#{indent}end"
        end

        def field(node)
          puts "#{indent}#{node.qual} #{node.typeid} #{node.name} = #{node.id};"
        end

        def indent
          '  '*level
        end

        private

        def dispatch(node)
          send(node.class.name.split('::').last.downcase.to_sym, node)
        end
      end
    end
  end
end

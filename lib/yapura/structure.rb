module Yapura
  class Structure
    attr_accessor :name, :children, :recent_list, :fields

    def initialize(name, &block)
      self.name = name
      self.children = []
      self.fields = []
      instance_eval(&block)
    end

    def list
      self.recent_list = List.new
    end

    def NO_method_missing(method, *args, &block)
      add_list
      item = DataType.new(method)
      if !(children.last.respond_to? '<')
        self.children << item
      end
      item
    end

    private

    def add_list
      unless recent_list.nil?
        self.children << recent_list
      end
      self.recent_list = nil
    end

    def add_field(field)
      self.fields << field
    end
    def required(*args); field(:required, *args); end
    def optional(*args); field(:optional, *args); end
    def repeated(*args); field(:repeated, *args); end
    def field(qual, typeid, *args)
      scoped = typeid #get_scoped(typeid)
      field = Field.new(self, scoped, qual)
      add_field(field)
      return field
    end
  end

  class Field
    attr_accessor :parent, :typeid, :id, :name, :qual, :options
    def inspect
      return "(#{self.id}, :#{self.typeid}, '#{self.name}', :#{self.qual}, #{self.options.inspect})"
    end
    def initialize(parent, typeid, qual)
      self.parent = parent
      self.typeid = typeid
      self.qual = qual
    end
    def []=(id, called, options = {})
      self.id = id
      self.name = called
      self.options = options
    end
    def [](id, called)
      self[id, called] = {}
    end
  end
end

module Riml
  class ClassNotFound < NameError; end

  class ClassMap
    def initialize
      @map = {}
    end

    def [](key)
      ensure_key_is_string!(key)
      klass = @map[key]
    end

    def []=(key, val)
      ensure_key_is_string!(key)
      @map[key] = val
    end

    def superclass(key)
      ensure_key_is_string!(key)
      super_key = @map[key].superclass_name
      raise ClassNotFound.new(super_key) unless @map[super_key]
      @map[super_key]
    end

    def classes
      @map.values
    end

    def class_names
      @map.keys
    end

    def clear
      @map.clear
    end

    protected
    def ensure_key_is_string!(key)
      unless key.is_a?(String)
        raise ArgumentError, "key must be name of class (String)"
      end
    end

  end
end

module ForkHandle
  def version
    '0.0.2'
  end

  def description
    "a teeny library / design pattern for managing connections in a process and thread safe fashion"
  end

  @handles = Hash.new
  @pid = Process.pid
  @tid = Thread.current.object_id

  attr_accessor :handles
  attr_accessor :pid
  attr_accessor :tid

  class Key
    def for(*args)
      case
        when args.size == 1 && args.first.is_a?(Key)
          args.first
        else
          new(*args)
      end
    end

    def initialize(pid, tid, key)
      @pid = pid
      @tid = tid
      @key = key
    end
  end

  def key_for(key)
    Key.for(@pid, @tid, key)
  end

  def get(key, &block)
    @handles.fetch(key_for(key)) do
      clear!
      block.call
    end
  end

  alias_method :fetch, :get

  def set(key, value)
    @handles[key_for(key)] = value
  end

  def clear!
    each do |key, val|
      next if key.pid == pid

      begin
        val.close
      rescue
        nil
      end
    end
  end

  extend(ForkHandle)
end

Forkhandle = ForkHandle

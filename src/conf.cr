require "toml"

class Conf

  @table = uninitialized TOML::Table

  def initialize(@file : String | Path)
    reload
  end

  def reload
    @table = TOML.parse_file @file
  end

  def []=(key : String, value : TOML::Type)
    @table[key] = value
  end

  def [](key : String)
    @table[key]
  end

  def as_s(key : String)
    @table[key].as(String)
  end

  def as_b(key : String)
    @table[key].as(Bool)
  end

  def as_i(key : String)
    @table[key].as(Int64)
  end

  def as_f(key : String)
    @table[key].as(Float64)
  end

  def as_t(key : String)
    @table[key].as(Time)
  end

  def as_a(key : String)
    @table[key].as(Array(TOML::Type))
  end

  def as_h(key : String)
    @table[key].as(TOML::Table)
  end

  def as_s?(key : String, default : String = "")
    if @table.has_key?(key) && @table[key].is_a?(String)
      @table[key]
    else
      default
    end
  end

  def as_b?(key : String, default : Bool = false)
    if @table.has_key?(key) && @table[key].is_a?(Bool)
      @table[key]
    else
      default
    end
  end

  def as_i?(key : String, default : Int64 = 0)
    if @table.has_key?(key) && @table[key].is_a?(Int64)
      @table[key]
    else
      default
    end
  end

  def as_f?(key : String, default : Float64 = 0)
    if @table.has_key?(key) && @table[key].is_a?(Float64)
      @table[key]
    else
      default
    end
  end

  def as_t?(key : String, default : Time)
    if @table.has_key?(key) && @table[key].is_a?(Time)
      @table[key]
    else
      default
    end
  end

  def as_a?(key : String, default : Array(TOML::Type) = [] of Array(TOML::Type))
    if @table.has_key?(key) && @table[key].is_a?(Array(TOML::Type))
      @table[key]
    else
      default
    end
  end

  def as_h?(key : String, default : TOML::Table)
    if @table.has_key?(key) && @table[key].is_a?(TOML::Table)
      @table[key]
    else
      default
    end
  end
end
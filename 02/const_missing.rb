class Object
  def self.const_missing(const)
    return nil if @calling

    @calling = true
    @const_loaded ||= {} 
    klass = @const_loaded.fetch(const, false) 

    if klass
      @calling = false
      return klass
    end

    require_relative const.to_s.downcase
    @const_loaded[const] = Object.const_get(const) 
    @calling = false

    @const_loaded[const]
  end
end

EuExisto.new

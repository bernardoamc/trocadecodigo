class InstanceEval
end

InstanceEval.instance_eval do
  def diga_oi
    puts "Oi!"
  end
end

ie = InstanceEval.new
InstanceEval.diga_oi
ie.diga_oi #undefined method `diga_oi' for #<InstanceEval:0x8c22a74>

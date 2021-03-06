class Ref
	attr_accessor :getter, :setter
	def initialize getter = nil, setter = nil
		self.getter = getter || lambda{}
		self.setter = setter || lambda{|v|}
	end
	def set value
		setter.call value
	end
	def get 
		getter.call
	end
	alias []  get
	alias []= set
end

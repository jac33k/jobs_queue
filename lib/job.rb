class Job
  class << self

    def build(input)
      parse(input).map do |pair|
        new(pair.shift, pair.last)
      end
    end

    private

    def parse(input)
      input = input.split("\n")
      input.map! do |j|
        a = j.split('=>')
        a.map(&:strip)
      end
    end
  end

  attr_reader :name, :parent

  def initialize(name, parent = nil)
    @name = name
    @parent = parent
  end

  def to_s
    self.name.to_s
  end

  def has_parent?
    !parent.nil?
  end
end

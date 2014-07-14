require 'pry'

class Queue

  attr_reader :jobs

  def initialize(input)
    @jobs = parse(input)
    sanitize!
  end

  private

  def parse(input)
    input = input.split("\n")
    input.map! do |j|
      a = j.split('=>')
      a.map(&:strip)
    end
  end

  def sanitize!
    @jobs.flatten!
    @jobs -= [nil, ""]
  end

end

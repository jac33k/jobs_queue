require 'pry'

class Queue

  attr_accessor :jobs, :input

  def initialize(input)
    self.jobs = parse(input)
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
    self.jobs.flatten!
    self.jobs -= [nil, ""]
  end

end

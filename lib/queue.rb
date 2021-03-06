require "job"

class Queue

  def initialize(input)
    @jobs = Job.build(input).sort!
    validate
  end

  def jobs
    @jobs.map(&:to_s)
  end

  private

  def validate
    validate_circular_dependencies
    validate_self_dependencies
  end

  def validate_circular_dependencies
    visited = []
    copy = @jobs.dup
    while job = copy.shift
      succ = job
      while !succ.nil?
        visited << succ
        succ = @jobs.find{|j| j.name == succ.parent}
        unless visited.detect{ |e| visited.count(e) > 1 }.nil?
          raise "Jobs can't have circular dependencies."
        end
      end
      visited = []
    end
  end

  def validate_self_dependencies
    if @jobs.any?{|j| j.name == j.parent}
      raise "Jobs can't depend on themselves"
    end
  end
end

class List < ApplicationRecord
  has_many :tasks

  def complete_all_tasks!
    tasks.update_all(complete: true)
  end

  def snooze_all_tasks!
    tasks.each { |task| task.snooze_hour! }
  end

  def total_duration
    tasks.reduce(0) { |total, task| total + task.duration }
  end

  def incomplete_tasks
    tasks.select { |task| !task.complete }
  end

  def favorite_tasks
    tasks.select { |task| task.favorite }
  end
end

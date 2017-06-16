require 'rails_helper'

RSpec.describe Task, type: :model do
  
  describe "#toggle_complete" do
		it "should make complete turn from true to false" do
			task = Task.new({complete: false})
			task.toggle_complete!
			expect(task.complete).to eq(true)
		end
	end

	describe "#toggle_favorite" do
		it "should toggle toggle :favorite from false to true" do 
			task = Task.new({favorite: false})
			task.toggle_favorite!
			expect(task.favorite).to eq(true)
		end
	end

	describe "#overdue" do
		it "should return true if it is currently past deadline time" do
			task = Task.new({deadline: Time.now-1.hour})
			expect(task.overdue?).to eq(true)
		end
	end

	describe "#increment_priority" do
		it "should increment priority by 1" do
			task = Task.new({priority: 9})
			task.increment_priority!
			expect(task.priority).to eq(10)
		end
	end

	describe "#decrement_priority" do
		it "should drop priority by 1" do 
			task = Task.new({priority:10})
			task.decrement_priority!
			expect(task.priority).to eq(9)
		end
	end

	describe "#snooze_hour!" do
		it "should push the deadline forward by an hour" do
			time = Time.now
			task = Task.new({deadline: time})
			task.snooze_hour!
			expect(task.deadline).to eq(time+1.hour)
		end
	end



end
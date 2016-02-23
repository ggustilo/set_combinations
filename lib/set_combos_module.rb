# require "set_combos/version.rb" #testing
require "./set_combos/version.rb" #run app

module SetCombos
  def get_all_permutations(set)
  	permutations = set.permutation.to_a
  	#try for all possible lengths?
  end

  def get_sum_of_all_permutations(set)
  	permutations = get_all_permutations(set)
  	sums = []
  	permutations.each do |permutation|
  		sums << permutation.reduce(:+)
  	end
  	sums
  end

end


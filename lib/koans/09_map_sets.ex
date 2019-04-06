defmodule MapSets do
  use Koans

  @intro "My name is Set, MapSet."

  @set MapSet.new([1, 2, 3, 4, 5])

  koan "I am very similar to a list" do
    assert Enum.fetch(@set, 0) === {:ok, 1}
  end

  koan "However, I do not allow duplication" do
    new_set = MapSet.new([1, 1, 2, 3, 3, 3])
    assert MapSet.size(new_set) === 3
  end

  def sorted?(set) do
    list = MapSet.to_list(set)
    sorted = Enum.sort(list)
    list == sorted
  end

  koan "You cannot depend on my order" do
    # Note: The number "33" is actually special here. Erlang uses a different
    # implementation for maps after 32 elements which does not maintain order.
    # http://stackoverflow.com/a/40408469

    # What do you think this answer to this assertion is?
    assert sorted?(@set)
    assert sorted?(MapSet.new(1..32))
    refute sorted?(MapSet.new(1..33))
  end

  koan "Does this value exist in the map set?" do
    assert MapSet.member?(@set, 3)
    refute MapSet.member?(@set, 99)
  end

  koan "I am merely another collection, but you can perform some operations on me" do
    three_times = MapSet.new(@set, fn x -> 3 * x end)
    assert MapSet.member?(three_times, 15)
    refute MapSet.member?(three_times, 1)
  end

  koan "Add this value into a map set" do
    with_six = MapSet.put(@set, 6)
    assert MapSet.member?(with_six, 6)
  end

  koan "Delete this value from the map set" do
    without_one = MapSet.delete(@set, 1)
    refute MapSet.member?(without_one, 1)
  end

  koan "Are these maps twins?" do
    new_set = MapSet.new([1, 2, 3])
    refute MapSet.equal?(@set, new_set)
    new_set_ = MapSet.new([4, 5] ++ [1, 2, 3])
    assert MapSet.equal?(@set, new_set_)
  end

  koan "I want only the common values in both sets" do
    assert MapSet.intersection(@set, MapSet.new([5, 6, 7])) === MapSet.new([5])
  end

  koan "Unify my sets" do
    assert MapSet.size(MapSet.union(@set, MapSet.new([1, 5, 6, 7]))) === 7
  end

  koan "I want my set in a list" do
    assert MapSet.to_list(@set) === [1, 2, 3, 4, 5]
  end
end

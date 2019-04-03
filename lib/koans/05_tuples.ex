defmodule Tuples do
  use Koans

  @intro "Tuples"

  koan "Tuples can contain different things" do
    {atom, integer, string} = {:a, 1, "hi"}
    assert atom === :a
    assert integer === 1
    assert string === "hi"
  end

  koan "Tuples have a size" do
    assert tuple_size({:a, :b, :c}) === 3
  end

  koan "You can pull out individual elements" do
    assert elem({:a, "hi"}, 1) === "hi"
  end

  koan "You can change individual elements of a tuple" do
    assert put_elem({:a, "hi"}, 1, "bye") === {:a, "bye"}
  end

  koan "You can also simply extend a tuple with new stuff" do
    assert Tuple.insert_at({:a, "hi"}, 1, :new_thing) === {:a, :new_thing, "hi"}
  end

  koan "Add things at the end" do
    assert Tuple.append({"Huey", "Dewey"}, "Louie") === {"Huey", "Dewey", "Louie"}
  end

  koan "Or remove them" do
    assert Tuple.delete_at({:this, :is, :not, :awesome}, 2) === {:this, :is, :awesome}
  end

  koan "Turn it into a list in case you need it" do
    list = {:this, :can, :be, :a, :list}
    |> Tuple.delete_at(1)
    |> Tuple.delete_at(1)
    |> Tuple.insert_at(1, :is)
    |> Tuple.to_list
    assert list === [:this, :is, :a, :list]
  end
end

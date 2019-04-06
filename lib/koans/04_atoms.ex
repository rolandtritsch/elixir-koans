defmodule Atoms do
  use Koans

  @intro "Atoms"

  koan "Atoms are constants where their name is their own value" do
    adam = :human
    assert adam === :human
  end

  koan "It is surprising to find out that booleans are atoms" do
    assert is_atom(true)
    assert is_boolean(false)
  end

  koan "Like booleans, the nil value is also an atom" do
    assert is_atom(nil)
  end
end

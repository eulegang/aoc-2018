defmodule Day1Test do
  use ExUnit.Case

  test "extract" do
    assert Day1.extract_item("-12") == { :neg, 12 }
    assert Day1.extract_item("+10") == { :pos, 10 }
  end


  test "redux" do
    assert Day1.redux({:pos, 10}, 4) == 14
    assert Day1.redux({:neg, 2}, 4) == 2
  end

  test "mod_redux" do
    assert Day1.mod_redux({:pos, 4}, [2, 5, 1]) == [6, 2, 5, 1]
  end

  test "freq" do
    assert Day1.find_dup_freq([1,2,3,5,6,7,8,3, 4, 3,5,2], []) == 3
  end
end

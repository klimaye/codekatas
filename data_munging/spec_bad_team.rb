require 'minitest/autorun'
require_relative 'bad_team'

class TestBadTeam < MiniTest::Unit::TestCase

  def test_index_hash
    hash = index_hash
    assert_kind_of Hash, hash
    assert_equal(0, hash["Num"])
    assert_equal(6, hash["F"])
    assert_equal(8, hash["A"])
  end

  def test_legit_line
    fine = "   1. Arsenal         38    26   9   3    79  -  36    87 "
    not_fine = "Team            P     W    L   D    F      A     Pts"

    assert(legit_line?(split(fine)))
    refute(legit_line?(split(not_fine)))
  end

  def test_abs_diff
    assert_equal(5,abs_diff(10,5))
    assert_equal(5,abs_diff(5,10))
  end

  def test_goals_differential
    line = "   1. Arsenal         38    26   9   3    79  -  36    87 "
    differential = goals_differential(split(line),index_hash)
    assert_equal(43, differential)
  end

  def test_find_bad_team
    bad_team_hash = find_bad_team_redux
    bad_team = bad_team_hash[:item]
    assert_equal("Aston_Villa", bad_team)
  end
end

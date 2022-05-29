import gleam/io
import gleam/bool
import gleam/int
import gleam/string
import gleam/list
import gleam/erlang/os
import gleam/result

pub fn main() {
  io.println("[determine_last_digit_of_id!] START")
  let winning_nums =
    os.get_env("winning_nums")
    |> result.unwrap("1,2,3,4,5")
  let card_id_list = [
    12300, 12301, 12302, 12303, 12304, 12305, 12306, 12307, 12308, 12309,
  ]
  let results =
    card_id_list
    |> list.map(can_win(_, winning_nums))
  results
  io.println("[determine_last_digit_of_id!] END")
}

pub fn can_win(card_id: Int, winning_nums: String) -> Bool {
  let num = card_id % 10
  let num_s = int.to_string(num)
  let result = string.contains(does: winning_nums, contain: num_s)
  let result_str = bool.to_string(result)
  let msg =
    string.concat([
      "Can I win with this cardId [",
      int.to_string(num),
      "] ? : [",
      result_str,
      "]",
    ])
  io.debug(msg)
  result
}

defmodule Chunky.Sequence.OEIS.Repr do
  @moduledoc """
  Sequences from the [Online Encyclopedia of Integer Sequences](https://oeis.org) dealing with number
  representations, like alternate bases, digit contents, and patterns of digits.

  ## Available Sequences

   - [A000788 - Total number of 1's in binary expansions of 0, ..., n.](https://oeis.org/A000788) - `:a000788` - `create_sequence_a000788/1`
   - [A004176 - Omit 1's from n.](https://oeis.org/A004176) - `:a004176` - `create_sequence_a004176/1`
   - [A004177 - Omit 2's from n.](https://oeis.org/A004177) - `:a004177` - `create_sequence_a004177/1`
   - [A004178 - Omit 3's from n.](https://oeis.org/A004178) - `:a004178` - `create_sequence_a004178/1`
   - [A004179 - Omit 4's from n.](https://oeis.org/A004179) - `:a004179` - `create_sequence_a004179/1`
   - [A004180 - Omit 5's from n.](https://oeis.org/A004180) - `:a004180` - `create_sequence_a004180/1`
   - [A004181 - Omit 6's from n.](https://oeis.org/A004181) - `:a004181` - `create_sequence_a004181/1`
   - [A004182 - Omit 7's from n.](https://oeis.org/A004182) - `:a004182` - `create_sequence_a004182/1`
   - [A004183 - Omit 8's from n.](https://oeis.org/A004183) - `:a004183` - `create_sequence_a004183/1`
   - [A004184 - Omit 9's from n.](https://oeis.org/A004184) - `:a004184` - `create_sequence_a004184/1`
   - [A004719 - Delete all 0's from n.](https://oeis.org/A004719) - `:a004719` - `create_sequence_a004719/1`
   - [A004720 - Delete all digits '1' from the sequence of nonnegative integers.](https://oeis.org/A004720) - `:a004720` - `create_sequence_a004720/1`
   - [A004721 - Delete all 2's from the sequence of nonnegative integers.](https://oeis.org/A004721) - `:a004721` - `create_sequence_a004721/1`
   - [A004722 - Delete all digits 3 from the terms of the sequence of nonnegative integers.](https://oeis.org/A004722) - `:a004722` - `create_sequence_a004722/1`
   - [A004723 - Delete all 4's from the sequence of nonnegative integers.](https://oeis.org/A004723) - `:a004723` - `create_sequence_a004723/1`
   - [A004724 - Delete all 5's from the sequence of nonnegative integers.](https://oeis.org/A004724) - `:a004724` - `create_sequence_a004724/1`
   - [A004725 - Delete all 6's from the sequence of nonnegative integers.](https://oeis.org/A004725) - `:a004725` - `create_sequence_a004725/1`
   - [A004726 - Delete all 7's from the sequence of nonnegative integers.](https://oeis.org/A004726) - `:a004726` - `create_sequence_a004726/1`
   - [A004727 - Delete all 8's from the sequence of nonnegative integers.](https://oeis.org/A004727) - `:a004727` - `create_sequence_a004727/1`
   - [A004728 - Delete all 9's from the sequence of nonnegative integers.](https://oeis.org/A004728) - `:a004728` - `create_sequence_a004728/1`
   - [A005823 - Numbers whose ternary expansion contains no 1's.](https://oeis.org/A005823) - `:a005823` - `create_sequence_a005823/1`
   - [A005836 - Numbers n whose base 3 representation contains no 2.](https://oeis.org/A005836) - `:a005836` - `create_sequence_a005836/1`
   - [A007088 - The binary numbers (or binary words, or binary vectors): numbers written in base 2.](https://oeis.org/A007088) - `:a007088` - `create_sequence_a007088/1`
   - [A007089 - Numbers in base 3.](https://oeis.org/A007089) - `:a007089` - `create_sequence_a007089/1`
   - [A007090 - Numbers in base 4.](https://oeis.org/A007090) - `:a007090` - `create_sequence_a007090/1`
   - [A007091 - Numbers in base 5.](https://oeis.org/A007091) - `:a007091` - `create_sequence_a007091/1`
   - [A007092 - Numbers in base 6.](https://oeis.org/A007092) - `:a007092` - `create_sequence_a007092/1`
   - [A007093 - Numbers in base 7.](https://oeis.org/A007093) - `:a007093` - `create_sequence_a007093/1`
   - [A007094 - Numbers in base 8.](https://oeis.org/A007094) - `:a007094` - `create_sequence_a007094/1`
   - [A007095 - Numbers in base 9.](https://oeis.org/A007095) - `:a007095` - `create_sequence_a007095/1`
   - [A007953 - Digital sum (i.e., sum of digits) of n; also called digsum(n).](https://oeis.org/A007953) - `:a007953` - `create_sequence_a007953/1`
   - [A007954 - Product of decimal digits of n.](https://oeis.org/A007954) - `:a007954` - `create_sequence_a007954/1`
   - [A011531 - Numbers that contain a digit 1 in their decimal representation.](https://oeis.org/A011531) - `:a011531` - `create_sequence_a011531/1`
   - [A011532 - Numbers that contain a 2.](https://oeis.org/A011532) - `:a011532` - `create_sequence_a011532/1`
   - [A011533 - Numbers that contain a 3.](https://oeis.org/A011533) - `:a011533` - `create_sequence_a011533/1`
   - [A011534 - Numbers that contain a 4.](https://oeis.org/A011534) - `:a011534` - `create_sequence_a011534/1`
   - [A011535 - Numbers that contain a 5.](https://oeis.org/A011535) - `:a011535` - `create_sequence_a011535/1`
   - [A011536 - Numbers that contain a 6.](https://oeis.org/A011536) - `:a011536` - `create_sequence_a011536/1`
   - [A011537 - Numbers that contain at least one 7.](https://oeis.org/A011537) - `:a011537` - `create_sequence_a011537/1`
   - [A011538 - Numbers that contain an 8.](https://oeis.org/A011538) - `:a011538` - `create_sequence_a011538/1`
   - [A011539 - "9ish numbers": decimal representation contains at least one nine.](https://oeis.org/A011539) - `:a011539` - `create_sequence_a011539/1`
   - [A011540 - Numbers that contain a digit 0.](https://oeis.org/A011540) - `:a011540` - `create_sequence_a011540/1`   
   - [A014263 - Numbers that contain even digits only.](https://oeis.org/A014263) - `:a014263` - `create_sequence_a014263/1`
   - [A023692 - Numbers with a single 1 in their ternary expansion.](https://oeis.org/A023692) - `:a023692` - `create_sequence_a023692/1`
   - [A023693 - Numbers with exactly 2 1's in ternary expansion.](https://oeis.org/A023693) - `:a023693` - `create_sequence_a023693/1`
   - [A023694 - Numbers with exactly 3 1's in ternary expansion.](https://oeis.org/A023694) - `:a023694` - `create_sequence_a023694/1`
   - [A023695 - Numbers with exactly 4 1's in ternary expansion.](https://oeis.org/A023695) - `:a023695` - `create_sequence_a023695/1`
   - [A023696 - Numbers with exactly 5 1's in ternary expansion.](https://oeis.org/A023696) - `:a023696` - `create_sequence_a023696/1`
   - [A023697 - Numbers with exactly 6 1's in ternary expansion.](https://oeis.org/A023697) - `:a023697` - `create_sequence_a023697/1`
   - [A023698 - Numbers with exactly 7 1's in ternary expansion.](https://oeis.org/A023698) - `:a023698` - `create_sequence_a023698/1`
   - [A023699 - Numbers with a single 2 in their ternary expansion.](https://oeis.org/A023699) - `:a023699` - `create_sequence_a023699/1`
   - [A023700 - Numbers with exactly 2 2's in ternary expansion.](https://oeis.org/A023700) - `:a023700` - `create_sequence_a023700/1`
   - [A023701 - Numbers with exactly 3 2's in their ternary expansion.](https://oeis.org/A023701) - `:a023701` - `create_sequence_a023701/1`
   - [A023702 - Numbers with exactly 4 2's in ternary expansion of n.](https://oeis.org/A023702) - `:a023702` - `create_sequence_a023702/1`
   - [A023703 - Numbers with exactly 5 2's in ternary expansion.](https://oeis.org/A023703) - `:a023703` - `create_sequence_a023703/1`
   - [A023704 - Numbers with exactly 6 2's in ternary expansion.](https://oeis.org/A023704) - `:a023704` - `create_sequence_a023704/1`
   - [A023706 - Numbers with a single 0 in their base 4 expansion.](https://oeis.org/A023706) - `:a023706` - `create_sequence_a023706/1`
   - [A023707 - Numbers with exactly 2 0's in base 4 expansion.](https://oeis.org/A023707) - `:a023707` - `create_sequence_a023707/1`
   - [A023708 - Numbers with exactly 3 0's in base 4 expansion.](https://oeis.org/A023708) - `:a023708` - `create_sequence_a023708/1`
   - [A023709 - Numbers with no 1's in base 4 expansion.](https://oeis.org/A023709) - `:a023709` - `create_sequence_a023709/1`
   - [A023710 - Numbers with a single 1 in their base 4 expansion.](https://oeis.org/A023710) - `:a023710` - `create_sequence_a023710/1`
   - [A023711 - Numbers with exactly 2 1's in base 4 expansion.](https://oeis.org/A023711) - `:a023711` - `create_sequence_a023711/1`
   - [A023712 - Numbers with exactly 3 1's in base 4 expansion.](https://oeis.org/A023712) - `:a023712` - `create_sequence_a023712/1`
   - [A023713 - Numbers with no 2's in base 4 expansion.](https://oeis.org/A023713) - `:a023713` - `create_sequence_a023713/1`
   - [A023714 - Numbers with a single 2 in their base 4 expansion.](https://oeis.org/A023714) - `:a023714` - `create_sequence_a023714/1`
   - [A023715 - Numbers with exactly 2 2's in base 4 expansion.](https://oeis.org/A023715) - `:a023715` - `create_sequence_a023715/1`
   - [A023716 - Numbers with exactly 3 2's in base 4 expansion.](https://oeis.org/A023716) - `:a023716` - `create_sequence_a023716/1`
   - [A023717 - Numbers with no 3's in base 4 expansion.](https://oeis.org/A023717) - `:a023717` - `create_sequence_a023717/1`
   - [A023718 - Numbers with a single 3 in their base 4 expansion.](https://oeis.org/A023718) - `:a023718` - `create_sequence_a023718/1`
   - [A023719 - Numbers with exactly two 3's in base 4 expansion.](https://oeis.org/A023719) - `:a023719` - `create_sequence_a023719/1`
   - [A023720 - Numbers with exactly 3 3's in base 4 expansion.](https://oeis.org/A023720) - `:a023720` - `create_sequence_a023720/1`
   - [A023721 - Numbers with no 0's in their base-5 expansion.](https://oeis.org/A023721) - `:a023721` - `create_sequence_a023721/1`
   - [A023722 - Numbers with a single 0 in their base 5 expansion.](https://oeis.org/A023722) - `:a023722` - `create_sequence_a023722/1`
   - [A023723 - Numbers with exactly 2 0's in base 5 expansion.](https://oeis.org/A023723) - `:a023723` - `create_sequence_a023723/1`
   - [A023724 - Numbers with exactly 3 0's in base 5 expansion.](https://oeis.org/A023724) - `:a023724` - `create_sequence_a023724/1`
   - [A023725 - Numbers with no 1's in their base-5 expansion.](https://oeis.org/A023725) - `:a023725` - `create_sequence_a023725/1`
   - [A023726 - Numbers with a single 1 in their base 5 expansion.](https://oeis.org/A023726) - `:a023726` - `create_sequence_a023726/1`
   - [A023727 - Numbers with exactly 2 1's in their base 5 expansion.](https://oeis.org/A023727) - `:a023727` - `create_sequence_a023727/1`
   - [A023728 - Numbers with exactly 3 1's in base 5 expansion.](https://oeis.org/A023728) - `:a023728` - `create_sequence_a023728/1`
   - [A023729 - Numbers with no 2's in their base-5 expansion.](https://oeis.org/A023729) - `:a023729` - `create_sequence_a023729/1`
   - [A023730 - Numbers with a single 2 in their base 5 expansion.](https://oeis.org/A023730) - `:a023730` - `create_sequence_a023730/1`
   - [A023731 - Numbers with exactly two 2's in base 5 expansion.](https://oeis.org/A023731) - `:a023731` - `create_sequence_a023731/1`
   - [A023732 - Numbers with exactly 3 2's in base 5 expansion.](https://oeis.org/A023732) - `:a023732` - `create_sequence_a023732/1`
   - [A023733 - Numbers with no 3's in base-5 expansion.](https://oeis.org/A023733) - `:a023733` - `create_sequence_a023733/1`
   - [A023734 - Numbers with a single 3 in their base-5 expansion.](https://oeis.org/A023734) - `:a023734` - `create_sequence_a023734/1`
   - [A023735 - Numbers with exactly 2 3's in their base-5 expansion.](https://oeis.org/A023735) - `:a023735` - `create_sequence_a023735/1`
   - [A023736 - Numbers with exactly 3 3's in their base-5 expansion.](https://oeis.org/A023736) - `:a023736` - `create_sequence_a023736/1`
   - [A023738 - Numbers with a single 4 in their base 5 expansion.](https://oeis.org/A023738) - `:a023738` - `create_sequence_a023738/1`
   - [A023739 - Numbers with exactly 2 4's in base 5 expansion.](https://oeis.org/A023739) - `:a023739` - `create_sequence_a023739/1`
   - [A023740 - Numbers with exactly 3 4's in base 5 expansion.](https://oeis.org/A023740) - `:a023740` - `create_sequence_a023740/1`
   - [A023745 - Plaindromes: numbers whose digits in base 3 are in nondecreasing order.](https://oeis.org/A023745) - `:a023745` - `create_sequence_a023745/1`
   - [A023746 - Plaindromes: numbers whose digits in base 4 are in nondecreasing order.](https://oeis.org/A023746) - `:a023746` - `create_sequence_a023746/1`
   - [A023747 - Plaindromes: numbers whose digits in base 5 are in nondecreasing order.](https://oeis.org/A023747) - `:a023747` - `create_sequence_a023747/1`
   - [A023748 - Plaindromes: numbers whose digits in base 6 are in nondecreasing order.](https://oeis.org/A023748) - `:a023748` - `create_sequence_a023748/1`
   - [A023749 - Plaindromes: numbers whose digits in base 7 are in nondecreasing order.](https://oeis.org/A023749) - `:a023749` - `create_sequence_a023749/1`
   - [A023750 - Plaindromes: numbers whose digits in base 8 are in nondecreasing order.](https://oeis.org/A023750) - `:a023750` - `create_sequence_a023750/1`
   - [A023751 - Plaindromes: numbers whose digits in base 9 are in nondecreasing order.](https://oeis.org/A023751) - `:a023751` - `create_sequence_a023751/1`
   - [A023752 - Plaindromes: numbers whose digits in base 11 are in nondecreasing order.](https://oeis.org/A023752) - `:a023752` - `create_sequence_a023752/1`
   - [A023753 - Plaindromes: numbers whose digits in base 12 are in nondecreasing order.](https://oeis.org/A023753) - `:a023753` - `create_sequence_a023753/1`
   - [A023754 - Plaindromes: numbers whose digits in base 13 are in nondecreasing order.](https://oeis.org/A023754) - `:a023754` - `create_sequence_a023754/1`
   - [A023755 - Plaindromes: numbers whose digits in base 14 are in nondecreasing order.](https://oeis.org/A023755) - `:a023755` - `create_sequence_a023755/1`
   - [A023756 - Plaindromes: numbers whose digits in base 15 are in nondecreasing order.](https://oeis.org/A023756) - `:a023756` - `create_sequence_a023756/1`
   - [A023757 - Plaindromes: numbers whose digits in base 16 are in nondecreasing order.](https://oeis.org/A023757) - `:a023757` - `create_sequence_a023757/1`
   - [A043321 - Numbers n such that number of 0's in base 3 is 1.](https://oeis.org/A043321) - `:a043321` - `create_sequence_a043321/1`
   - [A052382 - Numbers without 0 as a digit, a.k.a. zeroless numbers.](https://oeis.org/A052382) - `:a052382` - `create_sequence_a052382/1`
   - [A052383 - Numbers without 1 as a digit.](https://oeis.org/A052383) - `:a052383` - `create_sequence_a052383/1`
   - [A052404 - Numbers without 2 as a digit.](https://oeis.org/A052404) - `:a052404` - `create_sequence_a052404/1`
   - [A052405 - Numbers without 3 as a digit.](https://oeis.org/A052405) - `:a052405` - `create_sequence_a052405/1`
   - [A052406 - Numbers without 4 as a digit.](https://oeis.org/A052406) - `:a052406` - `create_sequence_a052406/1`
   - [A052413 - Numbers without 5 as a digit.](https://oeis.org/A052413) - `:a052413` - `create_sequence_a052413/1`
   - [A052414 - Numbers without 6 as a digit.](https://oeis.org/A052414) - `:a052414` - `create_sequence_a052414/1`
   - [A052419 - Numbers without 7 as a digit.](https://oeis.org/A052419) - `:a052419` - `create_sequence_a052419/1`
   - [A052421 - Numbers without 8 as a digit.](https://oeis.org/A052421) - `:a052421` - `create_sequence_a052421/1`
   - [A099542 - Rhonda numbers to base 10.](https://oeis.org/A099542) - `:a099542` - `create_sequence_a099542/1`
   - [A010872 - a(n) = n mod 3.](https://oeis.org/A010872) - `:a010872` - `create_sequence_a010872/1`
   - [A023416 - Number of 0's in binary expansion of n.](https://oeis.org/A023416) - `:a023416` - `create_sequence_a023416/1`
   - [A023705 - Numbers with no 0's in base 4 expansion.](https://oeis.org/A023705) - `:a023705` - `create_sequence_a023705/1`
   - [A032924 - Numbers whose ternary expansion contains no 0.](https://oeis.org/A032924) - `:a032924` - `create_sequence_a032924/1`
   - [A052040 - Numbers n such that n^2 lacks the digit zero in its decimal expansion.](https://oeis.org/A052040) - `:a052040` - `create_sequence_a052040/1`
   - [A055640 - Number of nonzero digits in decimal expansion of n.](https://oeis.org/A055640) - `:a055640` - `create_sequence_a055640/1`
   - [A055641 - Number of zero digits in n.](https://oeis.org/A055641) - `:a055641` - `create_sequence_a055641/1`
   - [A055642 - Number of digits in decimal expansion of n.](https://oeis.org/A055642) - `:a055642` - `create_sequence_a055642/1`
   - [A059015 - Total number of 0's in binary expansions of 0, ..., n.](https://oeis.org/A059015) - `:a059015` - `create_sequence_a059015/1`
   - [A062756 - Number of 1's in ternary (base 3) expansion of n.](https://oeis.org/A062756) - `:a062756` - `create_sequence_a062756/1`
   - [A067251 - Numbers with no trailing zeros in decimal representation.](https://oeis.org/A067251) - `:a067251` - `create_sequence_a067251/1`
   - [A071858 - (Number of 1's in binary expansion of n) mod 3.](https://oeis.org/A071858) - `:a071858` - `create_sequence_a071858/1`
   - [A074940 - Numbers having at least one 2 in their ternary representation.](https://oeis.org/A074940) - `:a074940` - `create_sequence_a074940/1`
   - [A077267 - Number of zeros in base 3 expansion of n.](https://oeis.org/A077267) - `:a077267` - `create_sequence_a077267/1`
   - [A081603 - Number of 2's in ternary representation of n.](https://oeis.org/A081603) - `:a081603` - `create_sequence_a081603/1`
   - [A081605 - Numbers having at least one 0 in their ternary representation.](https://oeis.org/A081605) - `:a081605` - `create_sequence_a081605/1`
   - [A081606 - Numbers having at least one 1 in their ternary representation.](https://oeis.org/A081606) - `:a081606` - `create_sequence_a081606/1`
   - [A097251 - Numbers whose set of base 5 digits is {0,4}.](https://oeis.org/A097251) - `:a097251` - `create_sequence_a097251/1`
   - [A097252 - Numbers whose set of base 6 digits is {0,5}.](https://oeis.org/A097252) - `:a097252` - `create_sequence_a097252/1`
   - [A097253 - Numbers whose set of base 7 digits is {0,6}.](https://oeis.org/A097253) - `:a097253` - `create_sequence_a097253/1`
   - [A097254 - Numbers whose set of base 8 digits is {0,7}.](https://oeis.org/A097254) - `:a097254` - `create_sequence_a097254/1`
   - [A097255 - Numbers whose set of base 9 digits is {0,8}.](https://oeis.org/A097255) - `:a097255` - `create_sequence_a097255/1`
   - [A097256 - Numbers whose set of base 10 digits is {0,9}.](https://oeis.org/A097256) - `:a097256` - `create_sequence_a097256/1`
   - [A097257 - Numbers whose set of base 11 digits is {0,A}, where A base 11 = 10 base 10.](https://oeis.org/A097257) - `:a097257` - `create_sequence_a097257/1`
   - [A097258 - Numbers whose set of base 12 digits is {0,B}, where B base 12 = 11 base 10.](https://oeis.org/A097258) - `:a097258` - `create_sequence_a097258/1`
   - [A097259 - Numbers whose set of base 13 digits is {0,C}, where C base 13 = 12 base 10.](https://oeis.org/A097259) - `:a097259` - `create_sequence_a097259/1`
   - [A097260 - Numbers whose set of base 14 digits is {0,D}, where D base 14 = 13 base 10.](https://oeis.org/A097260) - `:a097260` - `create_sequence_a097260/1`
   - [A097261 - Numbers whose set of base 15 digits is {0,E}, where E base 15 = 14 base 10.](https://oeis.org/A097261) - `:a097261` - `create_sequence_a097261/1`
   - [A097262 - Numbers whose set of base 16 digits is {0,F}, where F base 16 = 15 base 10.](https://oeis.org/A097262) - `:a097262` - `create_sequence_a097262/1`
   - [A100968 - Integers n that are Rhonda numbers to base 4.](https://oeis.org/A100968) - `:a100968` - `create_sequence_a100968/1`
   - [A100969 - Integers n that are Rhonda numbers to base 6.](https://oeis.org/A100969) - `:a100969` - `create_sequence_a100969/1`
   - [A100970 - Integers n that are Rhonda numbers to base 8.](https://oeis.org/A100970) - `:a100970` - `create_sequence_a100970/1`
   - [A100973 - Integers that are Rhonda numbers to base 9.](https://oeis.org/A100973) - `:a100973` - `create_sequence_a100973/1`
   - [A100971 - Integers n that are Rhonda numbers to base 12.](https://oeis.org/A100971) - `:a100971` - `create_sequence_a100971/1`
   - [A100972 - Integers that are Rhonda numbers to base 14.](https://oeis.org/A100972) - `:a100972` - `create_sequence_a100972/1`
   - [A100974 - Integers that are Rhonda numbers to base 15.](https://oeis.org/A100974) - `:a100974` - `create_sequence_a100974/1`
   - [A100975 - Integers that are Rhonda numbers to base 16.](https://oeis.org/A100975) - `:a100975` - `create_sequence_a100975/1`
   - [A100987 - Integers that are Rhonda numbers to some base.](https://oeis.org/A100987) - `:a100987` - `create_sequence_a100987/1`
   - [A100988 - Integers that are Rhonda numbers to more than one base.](https://oeis.org/A100988) - `:a100988` - `create_sequence_a100988/1`
   - [A102669 - Number of digits >= 2 in decimal representation of n.](https://oeis.org/A102669) - `:a102669` - `create_sequence_a102669/1`
   - [A102670 - Number of digits >= 2 in the decimal representations of all integers from 0 to n.](https://oeis.org/A102670) - `:a102670` - `create_sequence_a102670/1`
   - [A102671 - Number of digits >= 3 in decimal representation of n.](https://oeis.org/A102671) - `:a102671` - `create_sequence_a102671/1`
   - [A102672 - Number of digits >= 3 in the decimal representations of all integers from 0 to n.](https://oeis.org/A102672) - `:a102672` - `create_sequence_a102672/1`
   - [A102673 - Number of digits >= 4 in decimal representation of n.](https://oeis.org/A102673) - `:a102673` - `create_sequence_a102673/1`
   - [A102674 - Number of digits >= 4 in the decimal representations of all integers from 0 to n.](https://oeis.org/A102674) - `:a102674` - `create_sequence_a102674/1`
   - [A102675 - Number of digits >= 5 in decimal representation of n.](https://oeis.org/A102675) - `:a102675` - `create_sequence_a102675/1`
   - [A102676 - Number of digits >= 5 in the decimal representations of all integers from 0 to n.](https://oeis.org/A102676) - `:a102676` - `create_sequence_a102676/1`
   - [A102677 - Number of digits >= 6 in decimal representation of n.](https://oeis.org/A102677) - `:a102677` - `create_sequence_a102677/1`
   - [A102678 - Number of digits >= 6 in the decimal representations of all integers from 0 to n.](https://oeis.org/A102678) - `:a102678` - `create_sequence_a102678/1`
   - [A102679 - Number of digits >= 7 in decimal representation of n.](https://oeis.org/A102679) - `:a102679` - `create_sequence_a102679/1`
   - [A102680 - Number of digits >= 7 in the decimal representations of all integers from 0 to n.](https://oeis.org/A102680) - `:a102680` - `create_sequence_a102680/1`
   - [A102681 - Number of digits >= 8 in decimal representation of n.](https://oeis.org/A102681) - `:a102681` - `create_sequence_a102681/1`
   - [A102682 - Number of digits >= 8 in the decimal representations of all integers from 0 to n.](https://oeis.org/A102682) - `:a102682` - `create_sequence_a102682/1`
   - [A102683 - Number of digits 9 in decimal representation of n.](https://oeis.org/A102683) - `:a102683` - `create_sequence_a102683/1`
   - [A102684 - Number of times the digit 9 appears in the decimal representations of all integers from 0 to n.](https://oeis.org/A102684) - `:a102684` - `create_sequence_a102684/1`
   - [A121022 - Even numbers containing a 2 in their decimal representation.](https://oeis.org/A121022) - `:a121022` - `create_sequence_a121022/1`
   - [A122840 - a(n) is the number of 0s at the end of n when n is written in base 10.](https://oeis.org/A122840) - `:a122840` - `create_sequence_a122840/1`
   - [A160093 - Number of digits in n, excluding any trailing zeros.](https://oeis.org/A160093) - `:a160093` - `create_sequence_a160093/1`
   - [A179868 - (Number of 1's in binary expansion of n) mod 4.](https://oeis.org/A179868) - `:a179868` - `create_sequence_a179868/1`
   - [A193238 - Number of prime digits in decimal representation of n.](https://oeis.org/A193238) - `:a193238` - `create_sequence_a193238/1`
   - [A196563 - Number of even digits in decimal representation of n.](https://oeis.org/A196563) - `:a196563` - `create_sequence_a196563/1`
   - [A248910 - Numbers with no zeros in base-6 representation.](https://oeis.org/A248910) - `:a248910` - `create_sequence_a248910/1`
   - [A255732 - Rhonda numbers in vigesimal number system.](https://oeis.org/A255732) - `:a255732` - `create_sequence_a255732/1`
   - [A255736 - Integers that are Rhonda numbers to base 30.](https://oeis.org/A255736) - `:a255736` - `create_sequence_a255736/1`
   - [A255731 - Rhonda numbers in sexagesimal number system.](https://oeis.org/A255731) - `:a255731` - `create_sequence_a255731/1`
   - [A255735 - Integers that are Rhonda numbers to base 18.](https://oeis.org/A255735) - `:a255735` - `create_sequence_a255735/1`   
   - [A255805 - Numbers with no zeros in base-8 representation.](https://oeis.org/A255805) - `:a255805` - `create_sequence_a255805/1`
   - [A255808 - Numbers with no zeros in base-9 representation.](https://oeis.org/A255808) - `:a255808` - `create_sequence_a255808/1`


  """

  import Chunky.Sequence, only: [sequence_for_function: 1]

  alias Chunky.Math
  alias Chunky.Math.Predicates

  @doc """
  OEIS Sequence `A004176` - Omit 1's from n.

  From [OEIS A004176](https://oeis.org/A004176):

  > Omit 1's from n.
  > (Formerly )

  **Sequence IDs**: `:a004176`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a004176) |> Sequence.take!(75)
      [0,0,2,3,4,5,6,7,8,9,0,0,2,3,4,5,6,7,8,9,20,2,22,23,24,25,26,27,28,29,30,3,32,33,34,35,36,37,38,39,40,4,42,43,44,45,46,47,48,49,50,5,52,53,54,55,56,57,58,59,60,6,62,63,64,65,66,67,68,69,70,7,72,73,74]


  """
  @doc offset: 0,
       sequence: "Omit 1's from n.",
       references: [{:oeis, :a004176, "https://oeis.org/A004176"}]
  def create_sequence_a004176(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a004176/1)
  end

  @doc offset: 0
  def seq_a004176(idx) do
    Math.remove_digits!(idx, [1])
  end

  @doc """
  OEIS Sequence `A004177` - Omit 2's from n.

  From [OEIS A004177](https://oeis.org/A004177):

  > Omit 2's from n.
  > (Formerly )

  **Sequence IDs**: `:a004177`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a004177) |> Sequence.take!(75)
      [0,1,0,3,4,5,6,7,8,9,10,11,1,13,14,15,16,17,18,19,0,1,0,3,4,5,6,7,8,9,30,31,3,33,34,35,36,37,38,39,40,41,4,43,44,45,46,47,48,49,50,51,5,53,54,55,56,57,58,59,60,61,6,63,64,65,66,67,68,69,70,71,7,73,74]


  """
  @doc offset: 0,
       sequence: "Omit 2's from n.",
       references: [{:oeis, :a004177, "https://oeis.org/A004177"}]
  def create_sequence_a004177(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a004177/1)
  end

  @doc offset: 0
  def seq_a004177(idx) do
    Math.remove_digits!(idx, [2])
  end

  @doc """
  OEIS Sequence `A004178` - Omit 3's from n.

  From [OEIS A004178](https://oeis.org/A004178):

  > Omit 3's from n.
  > (Formerly )

  **Sequence IDs**: `:a004178`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a004178) |> Sequence.take!(75)
      [0,1,2,0,4,5,6,7,8,9,10,11,12,1,14,15,16,17,18,19,20,21,22,2,24,25,26,27,28,29,0,1,2,0,4,5,6,7,8,9,40,41,42,4,44,45,46,47,48,49,50,51,52,5,54,55,56,57,58,59,60,61,62,6,64,65,66,67,68,69,70,71,72,7,74]


  """
  @doc offset: 0,
       sequence: "Omit 3's from n.",
       references: [{:oeis, :a004178, "https://oeis.org/A004178"}]
  def create_sequence_a004178(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a004178/1)
  end

  @doc offset: 0
  def seq_a004178(idx) do
    Math.remove_digits!(idx, [3])
  end

  @doc """
  OEIS Sequence `A004179` - Omit 4's from n.

  From [OEIS A004179](https://oeis.org/A004179):

  > Omit 4's from n.
  > (Formerly )

  **Sequence IDs**: `:a004179`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a004179) |> Sequence.take!(75)
      [0,1,2,3,0,5,6,7,8,9,10,11,12,13,1,15,16,17,18,19,20,21,22,23,2,25,26,27,28,29,30,31,32,33,3,35,36,37,38,39,0,1,2,3,0,5,6,7,8,9,50,51,52,53,5,55,56,57,58,59,60,61,62,63,6,65,66,67,68,69,70,71,72,73,7]


  """
  @doc offset: 0,
       sequence: "Omit 4's from n.",
       references: [{:oeis, :a004179, "https://oeis.org/A004179"}]
  def create_sequence_a004179(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a004179/1)
  end

  @doc offset: 0
  def seq_a004179(idx) do
    Math.remove_digits!(idx, [4])
  end

  @doc """
  OEIS Sequence `A004180` - Omit 5's from n.

  From [OEIS A004180](https://oeis.org/A004180):

  > Omit 5's from n.
  > (Formerly )

  **Sequence IDs**: `:a004180`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a004180) |> Sequence.take!(75)
      [0,1,2,3,4,0,6,7,8,9,10,11,12,13,14,1,16,17,18,19,20,21,22,23,24,2,26,27,28,29,30,31,32,33,34,3,36,37,38,39,40,41,42,43,44,4,46,47,48,49,0,1,2,3,4,0,6,7,8,9,60,61,62,63,64,6,66,67,68,69,70,71,72,73,74]


  """
  @doc offset: 0,
       sequence: "Omit 5's from n.",
       references: [{:oeis, :a004180, "https://oeis.org/A004180"}]
  def create_sequence_a004180(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a004180/1)
  end

  @doc offset: 0
  def seq_a004180(idx) do
    Math.remove_digits!(idx, [5])
  end

  @doc """
  OEIS Sequence `A004181` - Omit 6's from n.

  From [OEIS A004181](https://oeis.org/A004181):

  > Omit 6's from n.
  > (Formerly )

  **Sequence IDs**: `:a004181`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a004181) |> Sequence.take!(75)
      [0,1,2,3,4,5,0,7,8,9,10,11,12,13,14,15,1,17,18,19,20,21,22,23,24,25,2,27,28,29,30,31,32,33,34,35,3,37,38,39,40,41,42,43,44,45,4,47,48,49,50,51,52,53,54,55,5,57,58,59,0,1,2,3,4,5,0,7,8,9,70,71,72,73,74]


  """
  @doc offset: 0,
       sequence: "Omit 6's from n.",
       references: [{:oeis, :a004181, "https://oeis.org/A004181"}]
  def create_sequence_a004181(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a004181/1)
  end

  @doc offset: 0
  def seq_a004181(idx) do
    Math.remove_digits!(idx, [6])
  end

  @doc """
  OEIS Sequence `A004182` - Omit 7's from n.

  From [OEIS A004182](https://oeis.org/A004182):

  > Omit 7's from n.
  > (Formerly )

  **Sequence IDs**: `:a004182`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a004182) |> Sequence.take!(73)
      [0,1,2,3,4,5,6,0,8,9,10,11,12,13,14,15,16,1,18,19,20,21,22,23,24,25,26,2,28,29,30,31,32,33,34,35,36,3,38,39,40,41,42,43,44,45,46,4,48,49,50,51,52,53,54,55,56,5,58,59,60,61,62,63,64,65,66,6,68,69,0,1,2]


  """
  @doc offset: 0,
       sequence: "Omit 7's from n.",
       references: [{:oeis, :a004182, "https://oeis.org/A004182"}]
  def create_sequence_a004182(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a004182/1)
  end

  @doc offset: 0
  def seq_a004182(idx) do
    Math.remove_digits!(idx, [7])
  end

  @doc """
  OEIS Sequence `A004183` - Omit 8's from n.

  From [OEIS A004183](https://oeis.org/A004183):

  > Omit 8's from n.
  > (Formerly )

  **Sequence IDs**: `:a004183`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a004183) |> Sequence.take!(72)
      [0,1,2,3,4,5,6,7,0,9,10,11,12,13,14,15,16,17,1,19,20,21,22,23,24,25,26,27,2,29,30,31,32,33,34,35,36,37,3,39,40,41,42,43,44,45,46,47,4,49,50,51,52,53,54,55,56,57,5,59,60,61,62,63,64,65,66,67,6,69,70,71]


  """
  @doc offset: 0,
       sequence: "Omit 8's from n.",
       references: [{:oeis, :a004183, "https://oeis.org/A004183"}]
  def create_sequence_a004183(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a004183/1)
  end

  @doc offset: 0
  def seq_a004183(idx) do
    Math.remove_digits!(idx, [8])
  end

  @doc """
  OEIS Sequence `A004184` - Omit 9's from n.

  From [OEIS A004184](https://oeis.org/A004184):

  > Omit 9's from n.
  > (Formerly )

  **Sequence IDs**: `:a004184`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a004184) |> Sequence.take!(72)
      [0,1,2,3,4,5,6,7,8,0,10,11,12,13,14,15,16,17,18,1,20,21,22,23,24,25,26,27,28,2,30,31,32,33,34,35,36,37,38,3,40,41,42,43,44,45,46,47,48,4,50,51,52,53,54,55,56,57,58,5,60,61,62,63,64,65,66,67,68,6,70,71]


  """
  @doc offset: 0,
       sequence: "Omit 9's from n.",
       references: [{:oeis, :a004184, "https://oeis.org/A004184"}]
  def create_sequence_a004184(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a004184/1)
  end

  @doc offset: 0
  def seq_a004184(idx) do
    Math.remove_digits!(idx, [9])
  end

  @doc """
  OEIS Sequence `A004719` - Delete all 0's from n.

  From [OEIS A004719](https://oeis.org/A004719):

  > Delete all 0's from n.
  > (Formerly )

  **Sequence IDs**: `:a004719`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a004719) |> Sequence.take!(120)
      [1,2,3,4,5,6,7,8,9,1,11,12,13,14,15,16,17,18,19,2,21,22,23,24,25,26,27,28,29,3,31,32,33,34,35,36,37,38,39,4,41,42,43,44,45,46,47,48,49,5,51,52,53,54,55,56,57,58,59,6,61,62,63,64,65,66,67,68,69,7,71,72,73,74,75,76,77,78,79,8,81,82,83,84,85,86,87,88,89,9,91,92,93,94,95,96,97,98,99,1,11,12,13,14,15,16,17,18,19,11,111,112,113,114,115,116,117,118,119,12]


  """
  @doc offset: 1,
       sequence: "Delete all 0's from n.",
       references: [{:oeis, :a004719, "https://oeis.org/A004719"}]
  def create_sequence_a004719(_opts) do
    %{
      next_fn: &seq_a004719/3,
      data: %{
        last_number: -1
      }
    }
  end

  def seq_a004719(:init, data, _v), do: %{data: data, value: 0}

  def seq_a004719(:next, data, _v) do
    # find the next number
    r = 0

    n =
      Math.next_number(
        fn v ->
          Math.remove_digits!(v, [r], empty: false)
        end,
        data.last_number
      )

    # store it and return it
    {
      :continue,
      %{
        data: data |> Map.put(:last_number, n),
        value: n |> Math.remove_digits!([r])
      }
    }
  end

  @doc """
  OEIS Sequence `A004720` - Delete all digits '1' from the sequence of nonnegative integers.

  From [OEIS A004720](https://oeis.org/A004720):

  > Delete all digits '1' from the sequence of nonnegative integers.
  > (Formerly )

  **Sequence IDs**: `:a004720`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a004720) |> Sequence.take!(74)
      [0,2,3,4,5,6,7,8,9,0,2,3,4,5,6,7,8,9,20,2,22,23,24,25,26,27,28,29,30,3,32,33,34,35,36,37,38,39,40,4,42,43,44,45,46,47,48,49,50,5,52,53,54,55,56,57,58,59,60,6,62,63,64,65,66,67,68,69,70,7,72,73,74,75]


  """
  @doc offset: 1,
       sequence: "Delete all digits '1' from the sequence of nonnegative integers.",
       references: [{:oeis, :a004720, "https://oeis.org/A004720"}]
  def create_sequence_a004720(_opts) do
    %{
      next_fn: &seq_a004720/3,
      data: %{
        last_number: -1
      }
    }
  end

  def seq_a004720(:init, data, _v), do: %{data: data, value: 0}

  def seq_a004720(:next, data, _v) do
    # find the next number
    r = 1

    n =
      Math.next_number(
        fn v ->
          Math.remove_digits!(v, [r], empty: false)
        end,
        data.last_number
      )

    # store it and return it
    {
      :continue,
      %{
        data: data |> Map.put(:last_number, n),
        value: n |> Math.remove_digits!([r])
      }
    }
  end

  @doc """
  OEIS Sequence `A004721` - Delete all 2's from the sequence of nonnegative integers.

  From [OEIS A004721](https://oeis.org/A004721):

  > Delete all 2's from the sequence of nonnegative integers.
  > (Formerly )

  **Sequence IDs**: `:a004721`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a004721) |> Sequence.take!(74)
      [0,1,3,4,5,6,7,8,9,10,11,1,13,14,15,16,17,18,19,0,1,3,4,5,6,7,8,9,30,31,3,33,34,35,36,37,38,39,40,41,4,43,44,45,46,47,48,49,50,51,5,53,54,55,56,57,58,59,60,61,6,63,64,65,66,67,68,69,70,71,7,73,74,75]


  """
  @doc offset: 0,
       sequence: "Delete all 2's from the sequence of nonnegative integers.",
       references: [{:oeis, :a004721, "https://oeis.org/A004721"}]
  def create_sequence_a004721(_opts) do
    %{
      next_fn: &seq_a004721/3,
      data: %{
        last_number: -1
      }
    }
  end

  def seq_a004721(:init, data, _v), do: %{data: data, value: 0}

  def seq_a004721(:next, data, _v) do
    # find the next number
    r = 2

    n =
      Math.next_number(
        fn v ->
          Math.remove_digits!(v, [r], empty: false)
        end,
        data.last_number
      )

    # store it and return it
    {
      :continue,
      %{
        data: data |> Map.put(:last_number, n),
        value: n |> Math.remove_digits!([r])
      }
    }
  end

  @doc """
  OEIS Sequence `A004722` - Delete all digits 3 from the terms of the sequence of nonnegative integers.

  From [OEIS A004722](https://oeis.org/A004722):

  > Delete all digits 3 from the terms of the sequence of nonnegative integers.
  > (Formerly )

  **Sequence IDs**: `:a004722`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a004722) |> Sequence.take!(75)
      [0,1,2,4,5,6,7,8,9,10,11,12,1,14,15,16,17,18,19,20,21,22,2,24,25,26,27,28,29,0,1,2,4,5,6,7,8,9,40,41,42,4,44,45,46,47,48,49,50,51,52,5,54,55,56,57,58,59,60,61,62,6,64,65,66,67,68,69,70,71,72,7,74,75,76]


  """
  @doc offset: 0,
       sequence: "Delete all digits 3 from the terms of the sequence of nonnegative integers.",
       references: [{:oeis, :a004722, "https://oeis.org/A004722"}]
  def create_sequence_a004722(_opts) do
    %{
      next_fn: &seq_a004722/3,
      data: %{
        last_number: -1
      }
    }
  end

  def seq_a004722(:init, data, _v), do: %{data: data, value: 0}

  def seq_a004722(:next, data, _v) do
    # find the next number
    r = 3

    n =
      Math.next_number(
        fn v ->
          Math.remove_digits!(v, [r], empty: false)
        end,
        data.last_number
      )

    # store it and return it
    {
      :continue,
      %{
        data: data |> Map.put(:last_number, n),
        value: n |> Math.remove_digits!([r])
      }
    }
  end

  @doc """
  OEIS Sequence `A004723` - Delete all 4's from the sequence of nonnegative integers.

  From [OEIS A004723](https://oeis.org/A004723):

  > Delete all 4's from the sequence of nonnegative integers.
  > (Formerly )

  **Sequence IDs**: `:a004723`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a004723) |> Sequence.take!(74)
      [0,1,2,3,5,6,7,8,9,10,11,12,13,1,15,16,17,18,19,20,21,22,23,2,25,26,27,28,29,30,31,32,33,3,35,36,37,38,39,0,1,2,3,5,6,7,8,9,50,51,52,53,5,55,56,57,58,59,60,61,62,63,6,65,66,67,68,69,70,71,72,73,7,75]


  """
  @doc offset: 0,
       sequence: "Delete all 4's from the sequence of nonnegative integers.",
       references: [{:oeis, :a004723, "https://oeis.org/A004723"}]
  def create_sequence_a004723(_opts) do
    %{
      next_fn: &seq_a004723/3,
      data: %{
        last_number: -1
      }
    }
  end

  def seq_a004723(:init, data, _v), do: %{data: data, value: 0}

  def seq_a004723(:next, data, _v) do
    # find the next number
    r = 4

    n =
      Math.next_number(
        fn v ->
          Math.remove_digits!(v, [r], empty: false)
        end,
        data.last_number
      )

    # store it and return it
    {
      :continue,
      %{
        data: data |> Map.put(:last_number, n),
        value: n |> Math.remove_digits!([r])
      }
    }
  end

  @doc """
  OEIS Sequence `A004724` - Delete all 5's from the sequence of nonnegative integers.

  From [OEIS A004724](https://oeis.org/A004724):

  > Delete all 5's from the sequence of nonnegative integers.
  > (Formerly )

  **Sequence IDs**: `:a004724`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a004724) |> Sequence.take!(75)
      [0,1,2,3,4,6,7,8,9,10,11,12,13,14,1,16,17,18,19,20,21,22,23,24,2,26,27,28,29,30,31,32,33,34,3,36,37,38,39,40,41,42,43,44,4,46,47,48,49,0,1,2,3,4,6,7,8,9,60,61,62,63,64,6,66,67,68,69,70,71,72,73,74,7,76]


  """
  @doc offset: 0,
       sequence: "Delete all 5's from the sequence of nonnegative integers.",
       references: [{:oeis, :a004724, "https://oeis.org/A004724"}]
  def create_sequence_a004724(_opts) do
    %{
      next_fn: &seq_a004724/3,
      data: %{
        last_number: -1
      }
    }
  end

  def seq_a004724(:init, data, _v), do: %{data: data, value: 0}

  def seq_a004724(:next, data, _v) do
    # find the next number
    r = 5

    n =
      Math.next_number(
        fn v ->
          Math.remove_digits!(v, [r], empty: false)
        end,
        data.last_number
      )

    # store it and return it
    {
      :continue,
      %{
        data: data |> Map.put(:last_number, n),
        value: n |> Math.remove_digits!([r])
      }
    }
  end

  @doc """
  OEIS Sequence `A004725` - Delete all 6's from the sequence of nonnegative integers.

  From [OEIS A004725](https://oeis.org/A004725):

  > Delete all 6's from the sequence of nonnegative integers.
  > (Formerly )

  **Sequence IDs**: `:a004725`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a004725) |> Sequence.take!(75)
      [0,1,2,3,4,5,7,8,9,10,11,12,13,14,15,1,17,18,19,20,21,22,23,24,25,2,27,28,29,30,31,32,33,34,35,3,37,38,39,40,41,42,43,44,45,4,47,48,49,50,51,52,53,54,55,5,57,58,59,0,1,2,3,4,5,7,8,9,70,71,72,73,74,75,7]


  """
  @doc offset: 0,
       sequence: "Delete all 6's from the sequence of nonnegative integers.",
       references: [{:oeis, :a004725, "https://oeis.org/A004725"}]
  def create_sequence_a004725(_opts) do
    %{
      next_fn: &seq_a004725/3,
      data: %{
        last_number: -1
      }
    }
  end

  def seq_a004725(:init, data, _v), do: %{data: data, value: 0}

  def seq_a004725(:next, data, _v) do
    # find the next number
    r = 6

    n =
      Math.next_number(
        fn v ->
          Math.remove_digits!(v, [r], empty: false)
        end,
        data.last_number
      )

    # store it and return it
    {
      :continue,
      %{
        data: data |> Map.put(:last_number, n),
        value: n |> Math.remove_digits!([r])
      }
    }
  end

  @doc """
  OEIS Sequence `A004726` - Delete all 7's from the sequence of nonnegative integers.

  From [OEIS A004726](https://oeis.org/A004726):

  > Delete all 7's from the sequence of nonnegative integers.
  > (Formerly )

  **Sequence IDs**: `:a004726`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a004726) |> Sequence.take!(72)
      [0,1,2,3,4,5,6,8,9,10,11,12,13,14,15,16,1,18,19,20,21,22,23,24,25,26,2,28,29,30,31,32,33,34,35,36,3,38,39,40,41,42,43,44,45,46,4,48,49,50,51,52,53,54,55,56,5,58,59,60,61,62,63,64,65,66,6,68,69,0,1,2]


  """
  @doc offset: 0,
       sequence: "Delete all 7's from the sequence of nonnegative integers.",
       references: [{:oeis, :a004726, "https://oeis.org/A004726"}]
  def create_sequence_a004726(_opts) do
    %{
      next_fn: &seq_a004726/3,
      data: %{
        last_number: -1
      }
    }
  end

  def seq_a004726(:init, data, _v), do: %{data: data, value: 0}

  def seq_a004726(:next, data, _v) do
    # find the next number
    r = 7

    n =
      Math.next_number(
        fn v ->
          Math.remove_digits!(v, [r], empty: false)
        end,
        data.last_number
      )

    # store it and return it
    {
      :continue,
      %{
        data: data |> Map.put(:last_number, n),
        value: n |> Math.remove_digits!([r])
      }
    }
  end

  @doc """
  OEIS Sequence `A004727` - Delete all 8's from the sequence of nonnegative integers.

  From [OEIS A004727](https://oeis.org/A004727):

  > Delete all 8's from the sequence of nonnegative integers.
  > (Formerly )

  **Sequence IDs**: `:a004727`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a004727) |> Sequence.take!(71)
      [0,1,2,3,4,5,6,7,9,10,11,12,13,14,15,16,17,1,19,20,21,22,23,24,25,26,27,2,29,30,31,32,33,34,35,36,37,3,39,40,41,42,43,44,45,46,47,4,49,50,51,52,53,54,55,56,57,5,59,60,61,62,63,64,65,66,67,6,69,70,71]


  """
  @doc offset: 0,
       sequence: "Delete all 8's from the sequence of nonnegative integers.",
       references: [{:oeis, :a004727, "https://oeis.org/A004727"}]
  def create_sequence_a004727(_opts) do
    %{
      next_fn: &seq_a004727/3,
      data: %{
        last_number: -1
      }
    }
  end

  def seq_a004727(:init, data, _v), do: %{data: data, value: 0}

  def seq_a004727(:next, data, _v) do
    # find the next number
    r = 8

    n =
      Math.next_number(
        fn v ->
          Math.remove_digits!(v, [r], empty: false)
        end,
        data.last_number
      )

    # store it and return it
    {
      :continue,
      %{
        data: data |> Map.put(:last_number, n),
        value: n |> Math.remove_digits!([r])
      }
    }
  end

  @doc """
  OEIS Sequence `A004728` - Delete all 9's from the sequence of nonnegative integers.

  From [OEIS A004728](https://oeis.org/A004728):

  > Delete all 9's from the sequence of nonnegative integers.
  > (Formerly )

  **Sequence IDs**: `:a004728`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a004728) |> Sequence.take!(71)
      [0,1,2,3,4,5,6,7,8,10,11,12,13,14,15,16,17,18,1,20,21,22,23,24,25,26,27,28,2,30,31,32,33,34,35,36,37,38,3,40,41,42,43,44,45,46,47,48,4,50,51,52,53,54,55,56,57,58,5,60,61,62,63,64,65,66,67,68,6,70,71]


  """
  @doc offset: 0,
       sequence: "Delete all 9's from the sequence of nonnegative integers.",
       references: [{:oeis, :a004728, "https://oeis.org/A004728"}]
  def create_sequence_a004728(_opts) do
    %{
      next_fn: &seq_a004728/3,
      data: %{
        last_number: -1
      }
    }
  end

  def seq_a004728(:init, data, _v), do: %{data: data, value: 0}

  def seq_a004728(:next, data, _v) do
    # find the next number
    r = 9

    n =
      Math.next_number(
        fn v ->
          Math.remove_digits!(v, [r], empty: false)
        end,
        data.last_number
      )

    # store it and return it
    {
      :continue,
      %{
        data: data |> Map.put(:last_number, n),
        value: n |> Math.remove_digits!([r])
      }
    }
  end

  @doc """
  OEIS Sequence `A007088` - The binary numbers (or binary words, or binary vectors): numbers written in base 2.

  From [OEIS A007088](https://oeis.org/A007088):

  > The binary numbers (or binary words, or binary vectors): numbers written in base 2.
  > (Formerly M4679)

  **Sequence IDs**: `:a007088`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a007088) |> Sequence.take!(40)
      [0,1,10,11,100,101,110,111,1000,1001,1010,1011,1100,1101,1110,1111,10000,10001,10010,10011,10100,10101,10110,10111,11000,11001,11010,11011,11100,11101,11110,11111,100000,100001,100010,100011,100100,100101,100110,100111]


  """
  @doc offset: 0,
       sequence:
         "The binary numbers (or binary words, or binary vectors): numbers written in base 2.",
       references: [{:oeis, :a007088, "https://oeis.org/A007088"}]
  def create_sequence_a007088(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a007088/1)
  end

  @doc offset: 0
  def seq_a007088(idx) do
    idx |> Integer.digits(2) |> Integer.undigits()
  end

  @doc """
  OEIS Sequence `A007089` - Numbers in base 3.

  From [OEIS A007089](https://oeis.org/A007089):

  > Numbers in base 3.
  > (Formerly M1960)

  **Sequence IDs**: `:a007089`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a007089) |> Sequence.take!(50)
      [0,1,2,10,11,12,20,21,22,100,101,102,110,111,112,120,121,122,200,201,202,210,211,212,220,221,222,1000,1001,1002,1010,1011,1012,1020,1021,1022,1100,1101,1102,1110,1111,1112,1120,1121,1122,1200,1201,1202,1210,1211]


  """
  @doc offset: 0,
       sequence: "Numbers in base 3.",
       references: [{:oeis, :a007089, "https://oeis.org/A007089"}]
  def create_sequence_a007089(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a007089/1)
  end

  @doc offset: 0
  def seq_a007089(idx) do
    idx |> Integer.digits(3) |> Integer.undigits()
  end

  @doc """
  OEIS Sequence `A007090` - Numbers in base 4.

  From [OEIS A007090](https://oeis.org/A007090):

  > Numbers in base 4.
  > (Formerly M0900)

  **Sequence IDs**: `:a007090`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a007090) |> Sequence.take!(64)
      [0,1,2,3,10,11,12,13,20,21,22,23,30,31,32,33,100,101,102,103,110,111,112,113,120,121,122,123,130,131,132,133,200,201,202,203,210,211,212,213,220,221,222,223,230,231,232,233,300,301,302,303,310,311,312,313,320,321,322,323,330,331,332,333]


  """
  @doc offset: 0,
       sequence: "Numbers in base 4.",
       references: [{:oeis, :a007090, "https://oeis.org/A007090"}]
  def create_sequence_a007090(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a007090/1)
  end

  @doc offset: 0
  def seq_a007090(idx) do
    idx |> Integer.digits(4) |> Integer.undigits()
  end

  @doc """
  OEIS Sequence `A007091` - Numbers in base 5.

  From [OEIS A007091](https://oeis.org/A007091):

  > Numbers in base 5.
  > (Formerly M0595)

  **Sequence IDs**: `:a007091`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a007091) |> Sequence.take!(66)
      [0,1,2,3,4,10,11,12,13,14,20,21,22,23,24,30,31,32,33,34,40,41,42,43,44,100,101,102,103,104,110,111,112,113,114,120,121,122,123,124,130,131,132,133,134,140,141,142,143,144,200,201,202,203,204,210,211,212,213,214,220,221,222,223,224,230]


  """
  @doc offset: 0,
       sequence: "Numbers in base 5.",
       references: [{:oeis, :a007091, "https://oeis.org/A007091"}]
  def create_sequence_a007091(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a007091/1)
  end

  @doc offset: 0
  def seq_a007091(idx) do
    idx |> Integer.digits(5) |> Integer.undigits()
  end

  @doc """
  OEIS Sequence `A007092` - Numbers in base 6.

  From [OEIS A007092](https://oeis.org/A007092):

  > Numbers in base 6.
  > (Formerly M0532)

  **Sequence IDs**: `:a007092`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a007092) |> Sequence.take!(66)
      [0,1,2,3,4,5,10,11,12,13,14,15,20,21,22,23,24,25,30,31,32,33,34,35,40,41,42,43,44,45,50,51,52,53,54,55,100,101,102,103,104,105,110,111,112,113,114,115,120,121,122,123,124,125,130,131,132,133,134,135,140,141,142,143,144,145]


  """
  @doc offset: 0,
       sequence: "Numbers in base 6.",
       references: [{:oeis, :a007092, "https://oeis.org/A007092"}]
  def create_sequence_a007092(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a007092/1)
  end

  @doc offset: 0
  def seq_a007092(idx) do
    idx |> Integer.digits(6) |> Integer.undigits()
  end

  @doc """
  OEIS Sequence `A007093` - Numbers in base 7.

  From [OEIS A007093](https://oeis.org/A007093):

  > Numbers in base 7.
  > (Formerly M0511)

  **Sequence IDs**: `:a007093`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a007093) |> Sequence.take!(64)
      [0,1,2,3,4,5,6,10,11,12,13,14,15,16,20,21,22,23,24,25,26,30,31,32,33,34,35,36,40,41,42,43,44,45,46,50,51,52,53,54,55,56,60,61,62,63,64,65,66,100,101,102,103,104,105,106,110,111,112,113,114,115,116,120]


  """
  @doc offset: 0,
       sequence: "Numbers in base 7.",
       references: [{:oeis, :a007093, "https://oeis.org/A007093"}]
  def create_sequence_a007093(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a007093/1)
  end

  @doc offset: 0
  def seq_a007093(idx) do
    idx |> Integer.digits(7) |> Integer.undigits()
  end

  @doc """
  OEIS Sequence `A007094` - Numbers in base 8.

  From [OEIS A007094](https://oeis.org/A007094):

  > Numbers in base 8.
  > (Formerly M0498)

  **Sequence IDs**: `:a007094`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a007094) |> Sequence.take!(74)
      [0,1,2,3,4,5,6,7,10,11,12,13,14,15,16,17,20,21,22,23,24,25,26,27,30,31,32,33,34,35,36,37,40,41,42,43,44,45,46,47,50,51,52,53,54,55,56,57,60,61,62,63,64,65,66,67,70,71,72,73,74,75,76,77,100,101,102,103,104,105,106,107,110,111]


  """
  @doc offset: 0,
       sequence: "Numbers in base 8.",
       references: [{:oeis, :a007094, "https://oeis.org/A007094"}]
  def create_sequence_a007094(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a007094/1)
  end

  @doc offset: 0
  def seq_a007094(idx) do
    idx |> Integer.digits(8) |> Integer.undigits()
  end

  @doc """
  OEIS Sequence `A007095` - Numbers in base 9.

  From [OEIS A007095](https://oeis.org/A007095):

  > Numbers in base 9.
  > (Formerly M0490)

  **Sequence IDs**: `:a007095`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a007095) |> Sequence.take!(77)
      [0,1,2,3,4,5,6,7,8,10,11,12,13,14,15,16,17,18,20,21,22,23,24,25,26,27,28,30,31,32,33,34,35,36,37,38,40,41,42,43,44,45,46,47,48,50,51,52,53,54,55,56,57,58,60,61,62,63,64,65,66,67,68,70,71,72,73,74,75,76,77,78,80,81,82,83,84]


  """
  @doc offset: 0,
       sequence: "Numbers in base 9.",
       references: [{:oeis, :a007095, "https://oeis.org/A007095"}]
  def create_sequence_a007095(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a007095/1)
  end

  @doc offset: 0
  def seq_a007095(idx) do
    idx |> Integer.digits(9) |> Integer.undigits()
  end

  @doc """
  OEIS Sequence `A011531` - Numbers that contain a digit 1 in their decimal representation.

  From [OEIS A011531](https://oeis.org/A011531):

  > Numbers that contain a digit 1 in their decimal representation.
  > (Formerly )

  **Sequence IDs**: `:a011531`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a011531) |> Sequence.take!(53)
      [1,10,11,12,13,14,15,16,17,18,19,21,31,41,51,61,71,81,91,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133]


  """
  @doc offset: 1,
       sequence: "Numbers that contain a digit 1 in their decimal representation.",
       references: [{:oeis, :a011531, "https://oeis.org/A011531"}]
  def create_sequence_a011531(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a011531/2)
  end

  @doc offset: 1
  def seq_a011531(_idx, last) do
    Math.next_number(fn v -> Math.contains_number?(v, 1) end, last)
  end

  @doc """
  OEIS Sequence `A011532` - Numbers that contain a 2.

  From [OEIS A011532](https://oeis.org/A011532):

  > Numbers that contain a 2.
  > (Formerly )

  **Sequence IDs**: `:a011532`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a011532) |> Sequence.take!(53)
      [2,12,20,21,22,23,24,25,26,27,28,29,32,42,52,62,72,82,92,102,112,120,121,122,123,124,125,126,127,128,129,132,142,152,162,172,182,192,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214]


  """
  @doc offset: 1,
       sequence: "Numbers that contain a 2.",
       references: [{:oeis, :a011532, "https://oeis.org/A011532"}]
  def create_sequence_a011532(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a011532/2)
  end

  @doc offset: 1
  def seq_a011532(_idx, last) do
    Math.next_number(fn v -> Math.contains_number?(v, 2) end, last)
  end

  @doc """
  OEIS Sequence `A011533` - Numbers that contain a 3.

  From [OEIS A011533](https://oeis.org/A011533):

  > Numbers that contain a 3.
  > (Formerly )

  **Sequence IDs**: `:a011533`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a011533) |> Sequence.take!(53)
      [3,13,23,30,31,32,33,34,35,36,37,38,39,43,53,63,73,83,93,103,113,123,130,131,132,133,134,135,136,137,138,139,143,153,163,173,183,193,203,213,223,230,231,232,233,234,235,236,237,238,239,243,253]


  """
  @doc offset: 1,
       sequence: "Numbers that contain a 3.",
       references: [{:oeis, :a011533, "https://oeis.org/A011533"}]
  def create_sequence_a011533(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a011533/2)
  end

  @doc offset: 1
  def seq_a011533(_idx, last) do
    Math.next_number(fn v -> Math.contains_number?(v, 3) end, last)
  end

  @doc """
  OEIS Sequence `A011534` - Numbers that contain a 4.

  From [OEIS A011534](https://oeis.org/A011534):

  > Numbers that contain a 4.
  > (Formerly )

  **Sequence IDs**: `:a011534`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a011534) |> Sequence.take!(53)
      [4,14,24,34,40,41,42,43,44,45,46,47,48,49,54,64,74,84,94,104,114,124,134,140,141,142,143,144,145,146,147,148,149,154,164,174,184,194,204,214,224,234,240,241,242,243,244,245,246,247,248,249,254]


  """
  @doc offset: 1,
       sequence: "Numbers that contain a 4.",
       references: [{:oeis, :a011534, "https://oeis.org/A011534"}]
  def create_sequence_a011534(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a011534/2)
  end

  @doc offset: 1
  def seq_a011534(_idx, last) do
    Math.next_number(fn v -> Math.contains_number?(v, 4) end, last)
  end

  @doc """
  OEIS Sequence `A011535` - Numbers that contain a 5.

  From [OEIS A011535](https://oeis.org/A011535):

  > Numbers that contain a 5.
  > (Formerly )

  **Sequence IDs**: `:a011535`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a011535) |> Sequence.take!(53)
      [5,15,25,35,45,50,51,52,53,54,55,56,57,58,59,65,75,85,95,105,115,125,135,145,150,151,152,153,154,155,156,157,158,159,165,175,185,195,205,215,225,235,245,250,251,252,253,254,255,256,257,258,259]


  """
  @doc offset: 1,
       sequence: "Numbers that contain a 5.",
       references: [{:oeis, :a011535, "https://oeis.org/A011535"}]
  def create_sequence_a011535(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a011535/2)
  end

  @doc offset: 1
  def seq_a011535(_idx, last) do
    Math.next_number(fn v -> Math.contains_number?(v, 5) end, last)
  end

  @doc """
  OEIS Sequence `A011536` - Numbers that contain a 6.

  From [OEIS A011536](https://oeis.org/A011536):

  > Numbers that contain a 6.
  > (Formerly )

  **Sequence IDs**: `:a011536`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a011536) |> Sequence.take!(53)
      [6,16,26,36,46,56,60,61,62,63,64,65,66,67,68,69,76,86,96,106,116,126,136,146,156,160,161,162,163,164,165,166,167,168,169,176,186,196,206,216,226,236,246,256,260,261,262,263,264,265,266,267,268]


  """
  @doc offset: 1,
       sequence: "Numbers that contain a 6.",
       references: [{:oeis, :a011536, "https://oeis.org/A011536"}]
  def create_sequence_a011536(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a011536/2)
  end

  @doc offset: 1
  def seq_a011536(_idx, last) do
    Math.next_number(fn v -> Math.contains_number?(v, 6) end, last)
  end

  @doc """
  OEIS Sequence `A011537` - Numbers that contain at least one 7.

  From [OEIS A011537](https://oeis.org/A011537):

  > Numbers that contain at least one 7.
  > (Formerly )

  **Sequence IDs**: `:a011537`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a011537) |> Sequence.take!(53)
      [7,17,27,37,47,57,67,70,71,72,73,74,75,76,77,78,79,87,97,107,117,127,137,147,157,167,170,171,172,173,174,175,176,177,178,179,187,197,207,217,227,237,247,257,267,270,271,272,273,274,275,276,277]


  """
  @doc offset: 1,
       sequence: "Numbers that contain at least one 7.",
       references: [{:oeis, :a011537, "https://oeis.org/A011537"}]
  def create_sequence_a011537(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a011537/2)
  end

  @doc offset: 1
  def seq_a011537(_idx, last) do
    Math.next_number(fn v -> Math.contains_number?(v, 7) end, last)
  end

  @doc """
  OEIS Sequence `A011538` - Numbers that contain an 8.

  From [OEIS A011538](https://oeis.org/A011538):

  > Numbers that contain an 8.
  > (Formerly )

  **Sequence IDs**: `:a011538`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a011538) |> Sequence.take!(53)
      [8,18,28,38,48,58,68,78,80,81,82,83,84,85,86,87,88,89,98,108,118,128,138,148,158,168,178,180,181,182,183,184,185,186,187,188,189,198,208,218,228,238,248,258,268,278,280,281,282,283,284,285,286]


  """
  @doc offset: 1,
       sequence: "Numbers that contain an 8.",
       references: [{:oeis, :a011538, "https://oeis.org/A011538"}]
  def create_sequence_a011538(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a011538/2)
  end

  @doc offset: 1
  def seq_a011538(_idx, last) do
    Math.next_number(fn v -> Math.contains_number?(v, 8) end, last)
  end

  @doc """
  OEIS Sequence `A011539` - "9ish numbers": decimal representation contains at least one nine.

  From [OEIS A011539](https://oeis.org/A011539):

  > "9ish numbers": decimal representation contains at least one nine.
  > (Formerly )

  **Sequence IDs**: `:a011539`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a011539) |> Sequence.take!(53)
      [9,19,29,39,49,59,69,79,89,90,91,92,93,94,95,96,97,98,99,109,119,129,139,149,159,169,179,189,190,191,192,193,194,195,196,197,198,199,209,219,229,239,249,259,269,279,289,290,291,292,293,294,295]


  """
  @doc offset: 1,
       sequence: "9ish numbers: decimal representation contains at least one nine.",
       references: [{:oeis, :a011539, "https://oeis.org/A011539"}]
  def create_sequence_a011539(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a011539/2)
  end

  @doc offset: 1
  def seq_a011539(_idx, last) do
    Math.next_number(fn v -> Math.contains_number?(v, 9) end, last)
  end

  @doc """
  OEIS Sequence `A011540` - Numbers that contain a digit 0.

  From [OEIS A011540](https://oeis.org/A011540):

  > Numbers that contain a digit 0.
  > (Formerly )

  **Sequence IDs**: `:a011540`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a011540) |> Sequence.take!(51)
      [0,10,20,30,40,50,60,70,80,90,100,101,102,103,104,105,106,107,108,109,110,120,130,140,150,160,170,180,190,200,201,202,203,204,205,206,207,208,209,210,220,230,240,250,260,270,280,290,300,301,302]


  """
  @doc offset: 1,
       sequence: "Numbers that contain a digit 0.",
       references: [{:oeis, :a011540, "https://oeis.org/A011540"}]
  def create_sequence_a011540(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a011540/2)
  end

  @doc offset: 1, fill_value: -1
  def seq_a011540(_idx, last) do
    Math.next_number(fn v -> Math.contains_number?(v, 0) end, last)
  end

  @doc """
  OEIS Sequence `A052382` - Numbers without 0 as a digit, a.k.a. zeroless numbers.

  From [OEIS A052382](https://oeis.org/A052382):

  > Numbers without 0 as a digit, a.k.a. zeroless numbers.
  > (Formerly )

  **Sequence IDs**: `:a052382`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a052382) |> Sequence.take!(94)
      [1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,21,22,23,24,25,26,27,28,29,31,32,33,34,35,36,37,38,39,41,42,43,44,45,46,47,48,49,51,52,53,54,55,56,57,58,59,61,62,63,64,65,66,67,68,69,71,72,73,74,75,76,77,78,79,81,82,83,84,85,86,87,88,89,91,92,93,94,95,96,97,98,99,111,112,113,114]


  """
  @doc offset: 1,
       sequence: "Numbers without 0 as a digit, a.k.a. zeroless numbers.",
       references: [{:oeis, :a052382, "https://oeis.org/A052382"}]
  def create_sequence_a052382(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a052382/2)
  end

  @doc offset: 1
  def seq_a052382(_idx, last) do
    Math.next_number(fn v -> Math.contains_number?(v, 0) == false end, last)
  end

  @doc """
  OEIS Sequence `A052383` - Numbers without 1 as a digit.

  From [OEIS A052383](https://oeis.org/A052383):

  > Numbers without 1 as a digit.
  > (Formerly )

  **Sequence IDs**: `:a052383`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a052383) |> Sequence.take!(72)
      [0,2,3,4,5,6,7,8,9,20,22,23,24,25,26,27,28,29,30,32,33,34,35,36,37,38,39,40,42,43,44,45,46,47,48,49,50,52,53,54,55,56,57,58,59,60,62,63,64,65,66,67,68,69,70,72,73,74,75,76,77,78,79,80,82,83,84,85,86,87,88,89]


  """
  @doc offset: 1,
       sequence: "Numbers without 1 as a digit.",
       references: [{:oeis, :a052383, "https://oeis.org/A052383"}]
  def create_sequence_a052383(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a052383/2)
  end

  @doc offset: 1, fill_value: -1
  def seq_a052383(_idx, last) do
    Math.next_number(fn v -> Math.contains_number?(v, 1) == false end, last)
  end

  @doc """
  OEIS Sequence `A052404` - Numbers without 2 as a digit.

  From [OEIS A052404](https://oeis.org/A052404):

  > Numbers without 2 as a digit.
  > (Formerly )

  **Sequence IDs**: `:a052404`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a052404) |> Sequence.take!(72)
      [0,1,3,4,5,6,7,8,9,10,11,13,14,15,16,17,18,19,30,31,33,34,35,36,37,38,39,40,41,43,44,45,46,47,48,49,50,51,53,54,55,56,57,58,59,60,61,63,64,65,66,67,68,69,70,71,73,74,75,76,77,78,79,80,81,83,84,85,86,87,88,89]


  """
  @doc offset: 1,
       sequence: "Numbers without 2 as a digit.",
       references: [{:oeis, :a052404, "https://oeis.org/A052404"}]
  def create_sequence_a052404(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a052404/2)
  end

  @doc offset: 1, fill_value: -1
  def seq_a052404(_idx, last) do
    Math.next_number(fn v -> Math.contains_number?(v, 2) == false end, last)
  end

  @doc """
  OEIS Sequence `A052405` - Numbers without 3 as a digit.

  From [OEIS A052405](https://oeis.org/A052405):

  > Numbers without 3 as a digit.
  > (Formerly )

  **Sequence IDs**: `:a052405`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a052405) |> Sequence.take!(72)
      [0,1,2,4,5,6,7,8,9,10,11,12,14,15,16,17,18,19,20,21,22,24,25,26,27,28,29,40,41,42,44,45,46,47,48,49,50,51,52,54,55,56,57,58,59,60,61,62,64,65,66,67,68,69,70,71,72,74,75,76,77,78,79,80,81,82,84,85,86,87,88,89]


  """
  @doc offset: 1,
       sequence: "Numbers without 3 as a digit.",
       references: [{:oeis, :a052405, "https://oeis.org/A052405"}]
  def create_sequence_a052405(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a052405/2)
  end

  @doc offset: 1, fill_value: -1
  def seq_a052405(_idx, last) do
    Math.next_number(fn v -> Math.contains_number?(v, 3) == false end, last)
  end

  @doc """
  OEIS Sequence `A052406` - Numbers without 4 as a digit.

  From [OEIS A052406](https://oeis.org/A052406):

  > Numbers without 4 as a digit.
  > (Formerly )

  **Sequence IDs**: `:a052406`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a052406) |> Sequence.take!(72)
      [0,1,2,3,5,6,7,8,9,10,11,12,13,15,16,17,18,19,20,21,22,23,25,26,27,28,29,30,31,32,33,35,36,37,38,39,50,51,52,53,55,56,57,58,59,60,61,62,63,65,66,67,68,69,70,71,72,73,75,76,77,78,79,80,81,82,83,85,86,87,88,89]


  """
  @doc offset: 1,
       sequence: "Numbers without 4 as a digit.",
       references: [{:oeis, :a052406, "https://oeis.org/A052406"}]
  def create_sequence_a052406(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a052406/2)
  end

  @doc offset: 1, fill_value: -1
  def seq_a052406(_idx, last) do
    Math.next_number(fn v -> Math.contains_number?(v, 4) == false end, last)
  end

  @doc """
  OEIS Sequence `A052413` - Numbers without 5 as a digit.

  From [OEIS A052413](https://oeis.org/A052413):

  > Numbers without 5 as a digit.
  > (Formerly )

  **Sequence IDs**: `:a052413`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a052413) |> Sequence.take!(72)
      [0,1,2,3,4,6,7,8,9,10,11,12,13,14,16,17,18,19,20,21,22,23,24,26,27,28,29,30,31,32,33,34,36,37,38,39,40,41,42,43,44,46,47,48,49,60,61,62,63,64,66,67,68,69,70,71,72,73,74,76,77,78,79,80,81,82,83,84,86,87,88,89]


  """
  @doc offset: 1,
       sequence: "Numbers without 5 as a digit.",
       references: [{:oeis, :a052413, "https://oeis.org/A052413"}]
  def create_sequence_a052413(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a052413/2)
  end

  @doc offset: 1, fill_value: -1
  def seq_a052413(_idx, last) do
    Math.next_number(fn v -> Math.contains_number?(v, 5) == false end, last)
  end

  @doc """
  OEIS Sequence `A052414` - Numbers without 6 as a digit.

  From [OEIS A052414](https://oeis.org/A052414):

  > Numbers without 6 as a digit.
  > (Formerly )

  **Sequence IDs**: `:a052414`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a052414) |> Sequence.take!(72)
      [0,1,2,3,4,5,7,8,9,10,11,12,13,14,15,17,18,19,20,21,22,23,24,25,27,28,29,30,31,32,33,34,35,37,38,39,40,41,42,43,44,45,47,48,49,50,51,52,53,54,55,57,58,59,70,71,72,73,74,75,77,78,79,80,81,82,83,84,85,87,88,89]


  """
  @doc offset: 1,
       sequence: "Numbers without 6 as a digit.",
       references: [{:oeis, :a052414, "https://oeis.org/A052414"}]
  def create_sequence_a052414(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a052414/2)
  end

  @doc offset: 1, fill_value: -1
  def seq_a052414(_idx, last) do
    Math.next_number(fn v -> Math.contains_number?(v, 6) == false end, last)
  end

  @doc """
  OEIS Sequence `A052419` - Numbers without 7 as a digit.

  From [OEIS A052419](https://oeis.org/A052419):

  > Numbers without 7 as a digit.
  > (Formerly )

  **Sequence IDs**: `:a052419`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a052419) |> Sequence.take!(72)
      [0,1,2,3,4,5,6,8,9,10,11,12,13,14,15,16,18,19,20,21,22,23,24,25,26,28,29,30,31,32,33,34,35,36,38,39,40,41,42,43,44,45,46,48,49,50,51,52,53,54,55,56,58,59,60,61,62,63,64,65,66,68,69,80,81,82,83,84,85,86,88,89]


  """
  @doc offset: 1,
       sequence: "Numbers without 7 as a digit.",
       references: [{:oeis, :a052419, "https://oeis.org/A052419"}]
  def create_sequence_a052419(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a052419/2)
  end

  @doc offset: 1, fill_value: -1
  def seq_a052419(_idx, last) do
    Math.next_number(fn v -> Math.contains_number?(v, 7) == false end, last)
  end

  @doc """
  OEIS Sequence `A052421` - Numbers without 8 as a digit.

  From [OEIS A052421](https://oeis.org/A052421):

  > Numbers without 8 as a digit.
  > (Formerly )

  **Sequence IDs**: `:a052421`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a052421) |> Sequence.take!(72)
      [0,1,2,3,4,5,6,7,9,10,11,12,13,14,15,16,17,19,20,21,22,23,24,25,26,27,29,30,31,32,33,34,35,36,37,39,40,41,42,43,44,45,46,47,49,50,51,52,53,54,55,56,57,59,60,61,62,63,64,65,66,67,69,70,71,72,73,74,75,76,77,79]


  """
  @doc offset: 1,
       sequence: "Numbers without 8 as a digit.",
       references: [{:oeis, :a052421, "https://oeis.org/A052421"}]
  def create_sequence_a052421(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a052421/2)
  end

  @doc offset: 1, fill_value: -1
  def seq_a052421(_idx, last) do
    Math.next_number(fn v -> Math.contains_number?(v, 8) == false end, last)
  end

  @doc """
  OEIS Sequence `A121022` - Even numbers containing a 2 in their decimal representation.

  From [OEIS A121022](https://oeis.org/A121022):

  > Even numbers containing a 2 in their decimal representation.
  > (Formerly )

  **Sequence IDs**: `:a121022`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a121022) |> Sequence.take!(55)
      [2,12,20,22,24,26,28,32,42,52,62,72,82,92,102,112,120,122,124,126,128,132,142,152,162,172,182,192,200,202,204,206,208,210,212,214,216,218,220,222,224,226,228,230,232,234,236,238,240,242,244,246,248,250,252]


  """
  @doc offset: 1,
       sequence: "Even numbers containing a 2 in their decimal representation.",
       references: [{:oeis, :a121022, "https://oeis.org/A121022"}]
  def create_sequence_a121022(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a121022/2)
  end

  @doc offset: 1, fill_value: 0
  def seq_a121022(_idx, last) do
    Math.next_number(fn v -> Math.contains_number?(v, 2) end, last, 2)
  end

  @doc """
  OEIS Sequence `A100968` - Integers n that are Rhonda numbers to base 4.

  From [OEIS A100968](https://oeis.org/A100968):

  > Integers n that are Rhonda numbers to base 4.
  > (Formerly )

  **Sequence IDs**: `:a100968`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a100968) |> Sequence.take!(7)
      [10206,11935,12150,16031,45030,94185,113022]


  """
  @doc offset: 1,
       sequence: "Integers n that are Rhonda numbers to base 4.",
       references: [{:oeis, :a100968, "https://oeis.org/A100968"}]
  def create_sequence_a100968(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a100968/2)
  end

  @doc offset: 1, fill_value: 10000
  def seq_a100968(_idx, last) do
    Math.next_number(&Predicates.is_rhonda_to_base_4?/1, last)
  end

  @doc """
  OEIS Sequence `A100969` - Integers n that are Rhonda numbers to base 6.

  From [OEIS A100969](https://oeis.org/A100969):

  > Integers n that are Rhonda numbers to base 6.
  > (Formerly )

  **Sequence IDs**: `:a100969`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a100969) |> Sequence.take!(13)
      [855,1029,3813,5577,7040,7304,15104,19136,35350,36992,41031,42009,60368]


  """
  @doc offset: 1,
       sequence: "Integers n that are Rhonda numbers to base 6.",
       references: [{:oeis, :a100969, "https://oeis.org/A100969"}]
  def create_sequence_a100969(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a100969/2)
  end

  @doc offset: 1, fill_value: 800
  def seq_a100969(_idx, last) do
    Math.next_number(&Predicates.is_rhonda_to_base_6?/1, last)
  end

  @doc """
  OEIS Sequence `A100970` - Integers n that are Rhonda numbers to base 8.

  From [OEIS A100970](https://oeis.org/A100970):

  > Integers n that are Rhonda numbers to base 8.
  > (Formerly )

  **Sequence IDs**: `:a100970`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a100970) |> Sequence.take!(20)
      [1836,6318,6622,10530,14500,14739,17655,18550,25398,25956,30562,39215,39325,50875,51429,52887,55611,56420,58548,59731]


  """
  @doc offset: 1,
       sequence: "Integers n that are Rhonda numbers to base 8.",
       references: [{:oeis, :a100970, "https://oeis.org/A100970"}]
  def create_sequence_a100970(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a100970/2)
  end

  @doc offset: 1, fill_value: 1800
  def seq_a100970(_idx, last) do
    Math.next_number(&Predicates.is_rhonda_to_base_8?/1, last)
  end

  @doc """
  OEIS Sequence `A100973` - Integers that are Rhonda numbers to base 9.

  From [OEIS A100973](https://oeis.org/A100973):

  > Integers that are Rhonda numbers to base 9.
  > (Formerly )

  **Sequence IDs**: `:a100973`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a100973) |> Sequence.take!(12)
      [15540,21054,25331,44360,44660,44733,47652,50560,54944,76857,77142,83334]


  """
  @doc offset: 1,
       sequence: "Integers that are Rhonda numbers to base 9.",
       references: [{:oeis, :a100973, "https://oeis.org/A100973"}]
  def create_sequence_a100973(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a100973/2)
  end

  @doc offset: 1, fill_value: 15500
  def seq_a100973(_idx, last) do
    Math.next_number(&Predicates.is_rhonda_to_base_9?/1, last)
  end

  @doc """
  OEIS Sequence `A099542` - Rhonda numbers to base 10.

  From [OEIS A099542](https://oeis.org/A099542):

  > Rhonda numbers to base 10.
  > (Formerly )

  **Sequence IDs**: `:a099542`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a099542) |> Sequence.take!(28)
      [1568,2835,4752,5265,5439,5664,5824,5832,8526,12985,15625,15698,19435,25284,25662,33475,34935,35581,45951,47265,47594,52374,53176,53742,54479,55272,56356,56718]


  """
  @doc offset: 1,
       sequence: "Rhonda numbers to base 10.",
       references: [{:oeis, :a099542, "https://oeis.org/A099542"}]
  def create_sequence_a099542(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a099542/2)
  end

  @doc offset: 1, fill_value: 1500
  def seq_a099542(_idx, last) do
    Math.next_number(&Predicates.is_rhonda_to_base_10?/1, last)
  end

  @doc """
  OEIS Sequence `A100971` - Integers n that are Rhonda numbers to base 12.

  From [OEIS A100971](https://oeis.org/A100971):

  > Integers n that are Rhonda numbers to base 12.
  > (Formerly )

  **Sequence IDs**: `:a100971`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a100971) |> Sequence.take!(35)
      [560,800,3993,4425,4602,4888,7315,8296,9315,11849,12028,13034,14828,15052,16264,18511,18906,25619,25875,27176,32742,37264,37523,46035,50765,52338,58261,58504,59166,62002,66176,66752,66928,67195,68502]


  """
  @doc offset: 1,
       sequence: "Integers n that are Rhonda numbers to base 12.",
       references: [{:oeis, :a100971, "https://oeis.org/A100971"}]
  def create_sequence_a100971(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a100971/2)
  end

  @doc offset: 1, fill_value: 500
  def seq_a100971(_idx, last) do
    Math.next_number(&Predicates.is_rhonda_to_base_12?/1, last)
  end

  @doc """
  OEIS Sequence `A100972` - Integers that are Rhonda numbers to base 14.

  From [OEIS A100972](https://oeis.org/A100972):

  > Integers that are Rhonda numbers to base 14.
  > (Formerly )

  **Sequence IDs**: `:a100972`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a100972) |> Sequence.take!(14)
      [11475,18655,20565,29631,31725,45387,58404,58667,59950,63945,67525,68904,91245,99603]


  """
  @doc offset: 1,
       sequence: "Integers that are Rhonda numbers to base 14.",
       references: [{:oeis, :a100972, "https://oeis.org/A100972"}]
  def create_sequence_a100972(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a100972/2)
  end

  @doc offset: 1, fill_value: 11400
  def seq_a100972(_idx, last) do
    Math.next_number(&Predicates.is_rhonda_to_base_14?/1, last)
  end

  @doc """
  OEIS Sequence `A100974` - Integers that are Rhonda numbers to base 15.

  From [OEIS A100974](https://oeis.org/A100974):

  > Integers that are Rhonda numbers to base 15.
  > (Formerly )

  **Sequence IDs**: `:a100974`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a100974) |> Sequence.take!(22)
      [2392,2472,11468,15873,17424,18126,19152,20079,24388,30758,31150,33004,33550,37925,39483,42550,44714,58870,59605,66950,70182,71485]


  """
  @doc offset: 1,
       sequence: "Integers that are Rhonda numbers to base 15.",
       references: [{:oeis, :a100974, "https://oeis.org/A100974"}]
  def create_sequence_a100974(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a100974/2)
  end

  @doc offset: 1, fill_value: 2300
  def seq_a100974(_idx, last) do
    Math.next_number(&Predicates.is_rhonda_to_base_15?/1, last)
  end

  @doc """
  OEIS Sequence `A100975` - Integers that are Rhonda numbers to base 16.

  From [OEIS A100975](https://oeis.org/A100975):

  > Integers that are Rhonda numbers to base 16.
  > (Formerly )

  **Sequence IDs**: `:a100975`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a100975) |> Sequence.take!(22)
      [1000,1134,6776,15912,19624,20043,20355,23946,26296,29070,31906,32292,34236,34521,36465,39066,50055,50986,52341,54340,58088,59541]


  """
  @doc offset: 1,
       sequence: "Integers that are Rhonda numbers to base 16.",
       references: [{:oeis, :a100975, "https://oeis.org/A100975"}]
  def create_sequence_a100975(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a100975/2)
  end

  @doc offset: 1, fill_value: 900
  def seq_a100975(_idx, last) do
    Math.next_number(&Predicates.is_rhonda_to_base_16?/1, last)
  end

  @doc """
  OEIS Sequence `A255732` - Rhonda numbers in vigesimal number system.

  From [OEIS A255732](https://oeis.org/A255732):

  > Rhonda numbers in vigesimal number system.
  > (Formerly )

  **Sequence IDs**: `:a255732`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a255732) |> Sequence.take!(14)
      [1815,11050,15295,21165,22165,30702,34510,34645,42292,44165,52059,53416,65945,78430]


  """
  @doc offset: 1,
       sequence: "Rhonda numbers in vigesimal number system.",
       references: [{:oeis, :a255732, "https://oeis.org/A255732"}]
  def create_sequence_a255732(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a255732/2)
  end

  @doc offset: 1, fill_value: 1800
  def seq_a255732(_idx, last) do
    Math.next_number(&Predicates.is_rhonda_to_base_20?/1, last)
  end

  @doc """
  OEIS Sequence `A255736` - Integers that are Rhonda numbers to base 30.

  From [OEIS A255736](https://oeis.org/A255736):

  > Integers that are Rhonda numbers to base 30.
  > (Formerly )

  **Sequence IDs**: `:a255736`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a255736) |> Sequence.take!(27)
      [3024,3168,5115,5346,5950,6762,7750,7956,8470,9476,9576,9849,10360,11495,13035,13356,16335,22610,22784,23864,37515,38025,40704,40986,49887,52925,59800]


  """
  @doc offset: 1,
       sequence: "Integers that are Rhonda numbers to base 30.",
       references: [{:oeis, :a255736, "https://oeis.org/A255736"}]
  def create_sequence_a255736(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a255736/2)
  end

  @doc offset: 1, fill_value: 3000
  def seq_a255736(_idx, last) do
    Math.next_number(&Predicates.is_rhonda_to_base_30?/1, last)
  end

  @doc """
  OEIS Sequence `A255731` - Rhonda numbers in sexagesimal number system.

  From [OEIS A255731](https://oeis.org/A255731):

  > Rhonda numbers in sexagesimal number system.
  > (Formerly )

  **Sequence IDs**: `:a255731`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a255731) |> Sequence.take!(17)
      [3348,3510,6750,17430,18750,18876,18944,19475,20564,21312,26550,28280,37230,38396,43940,48042,77770]


  """
  @doc offset: 1,
       sequence: "Rhonda numbers in sexagesimal number system.",
       references: [{:oeis, :a255731, "https://oeis.org/A255731"}]
  def create_sequence_a255731(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a255731/2)
  end

  @doc offset: 1, fill_value: 3300
  def seq_a255731(_idx, last) do
    Math.next_number(&Predicates.is_rhonda_to_base_60?/1, last)
  end

  @doc """
  OEIS Sequence `A100988` - Integers that are Rhonda numbers to more than one base.

  From [OEIS A100988](https://oeis.org/A100988):

  > Integers that are Rhonda numbers to more than one base.
  > (Formerly )

  **Sequence IDs**: `:a100988`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a100988) |> Sequence.take!(39)
      [1000,2940,4200,4212,4725,5670,5824,5832,6776,6864,7040,7140,8296,9476,9633,10200,11016,11050,11160,11495,11935,12393,12474,13068,13260,13671,14014,14322,14406,15680,15750,15912,16240,16821,17056,17820,18270,18655,18700]


  """
  @doc offset: 1,
       sequence: "Integers that are Rhonda numbers to more than one base.",
       references: [{:oeis, :a100988, "https://oeis.org/A100988"}]
  def create_sequence_a100988(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a100988/2)
  end

  @doc offset: 1, fill_value: 900
  def seq_a100988(_idx, last) do
    Math.next_number(&Predicates.is_multiple_rhonda?/1, last)
  end

  @doc """
  OEIS Sequence `A100987` - Integers that are Rhonda numbers to some base.

  From [OEIS A100987](https://oeis.org/A100987):

  > Integers that are Rhonda numbers to some base.
  > (Formerly )

  **Sequence IDs**: `:a100987`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a100987) |> Sequence.take!(44)
      [560,756,800,855,1000,1029,1134,1470,1568,1632,1750,1815,1836,1944,1995,2080,2100,2392,2472,2662,2695,2709,2835,2940,3000,3024,3060,3087,3094,3168,3240,3264,3348,3456,3510,3600,3672,3675,3744,3750,3813,3888,3952,3976]


  """
  @doc offset: 1,
       sequence: "Integers that are Rhonda numbers to some base.",
       references: [{:oeis, :a100987, "https://oeis.org/A100987"}]
  def create_sequence_a100987(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a100987/2)
  end

  @doc offset: 1, fill_value: 500
  def seq_a100987(_idx, last) do
    Math.next_number(
      fn v ->
        Math.get_rhonda_to(v) |> length() > 0
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A255735` - Integers that are Rhonda numbers to base 18.

  From [OEIS A255735](https://oeis.org/A255735):

  > Integers that are Rhonda numbers to base 18.
  > (Formerly )

  **Sequence IDs**: `:a255735`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a255735) |> Sequence.take!(19)
      [1470,3000,8918,17025,19402,20650,21120,22156,26522,36549,38354,43281,46035,48768,54229,54528,56584,58216,58224]


  """
  @doc offset: 1,
       sequence: "Integers that are Rhonda numbers to base 18.",
       references: [{:oeis, :a255735, "https://oeis.org/A255735"}]
  def create_sequence_a255735(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a255735/2)
  end

  @doc offset: 1, fill_value: 1400
  def seq_a255735(_idx, last) do
    Math.next_number(
      fn v ->
        Math.is_rhonda_to_base?(v, 18)
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A000788` - Total number of 1's in binary expansions of 0, ..., n.

  From [OEIS A000788](https://oeis.org/A000788):

  > Total number of 1's in binary expansions of 0, ..., n.
  > (Formerly M0964 N0360)

  **Sequence IDs**: `:a000788`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a000788) |> Sequence.take!(63)
      [0,1,2,4,5,7,9,12,13,15,17,20,22,25,28,32,33,35,37,40,42,45,48,52,54,57,60,64,67,71,75,80,81,83,85,88,90,93,96,100,102,105,108,112,115,119,123,128,130,133,136,140,143,147,151,156,159,163,167,172,176,181,186]


  """
  @doc offset: 0,
       sequence: "Total number of 1's in binary expansions of 0, ..., n.",
       references: [{:oeis, :a000788, "https://oeis.org/A000788"}]
  def create_sequence_a000788(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a000788/1)
  end

  @doc offset: 0
  def seq_a000788(idx) do
    0..idx
    |> Enum.map(fn d -> Math.digit_count(d, [1], base: 2) end)
    |> Enum.sum()
  end

  @doc """
  OEIS Sequence `A005823` - Numbers whose ternary expansion contains no 1's.

  From [OEIS A005823](https://oeis.org/A005823):

  > Numbers whose ternary expansion contains no 1's.
  > (Formerly M1567)

  **Sequence IDs**: `:a005823`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a005823) |> Sequence.take!(56)
      [0,2,6,8,18,20,24,26,54,56,60,62,72,74,78,80,162,164,168,170,180,182,186,188,216,218,222,224,234,236,240,242,486,488,492,494,504,506,510,512,540,542,546,548,558,560,564,566,648,650,654,656,666,668,672,674]


  """
  @doc offset: 1,
       sequence: "Numbers whose ternary expansion contains no 1's.",
       references: [{:oeis, :a005823, "https://oeis.org/A005823"}]
  def create_sequence_a005823(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a005823/2)
  end

  @doc offset: 1, fill_value: -1
  def seq_a005823(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [1], base: 3) == 0
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A005836` - Numbers n whose base 3 representation contains no 2.

  From [OEIS A005836](https://oeis.org/A005836):

  > Numbers n whose base 3 representation contains no 2.
  > (Formerly M2353)

  **Sequence IDs**: `:a005836`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a005836) |> Sequence.take!(58)
      [0,1,3,4,9,10,12,13,27,28,30,31,36,37,39,40,81,82,84,85,90,91,93,94,108,109,111,112,117,118,120,121,243,244,246,247,252,253,255,256,270,271,273,274,279,280,282,283,324,325,327,328,333,334,336,337,351,352]


  """
  @doc offset: 1,
       sequence: "Numbers n whose base 3 representation contains no 2.",
       references: [{:oeis, :a005836, "https://oeis.org/A005836"}]
  def create_sequence_a005836(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a005836/2)
  end

  @doc offset: 1, fill_value: -1
  def seq_a005836(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [2], base: 3) == 0
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A007954` - Product of decimal digits of n.

  From [OEIS A007954](https://oeis.org/A007954):

  > Product of decimal digits of n.
  > (Formerly )

  **Sequence IDs**: `:a007954`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a007954) |> Sequence.take!(108)
      [0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9,0,2,4,6,8,10,12,14,16,18,0,3,6,9,12,15,18,21,24,27,0,4,8,12,16,20,24,28,32,36,0,5,10,15,20,25,30,35,40,45,0,6,12,18,24,30,36,42,48,54,0,7,14,21,28,35,42,49,56,63,0,8,16,24,32,40,48,56,64,72,0,9,18,27,36,45,54,63,72,81,0,0,0,0,0,0,0,0]


  """
  @doc offset: 0,
       sequence: "Product of decimal digits of n.",
       references: [{:oeis, :a007954, "https://oeis.org/A007954"}]
  def create_sequence_a007954(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a007954/1)
  end

  @doc offset: 0
  def seq_a007954(idx) do
    idx
    |> Integer.digits()
    |> Enum.reduce(1, fn x, acc -> x * acc end)
  end

  @doc """
  OEIS Sequence `A010872` - a(n) = n mod 3.

  From [OEIS A010872](https://oeis.org/A010872):

  > a(n) = n mod 3.
  > (Formerly )

  **Sequence IDs**: `:a010872`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a010872) |> Sequence.take!(105)
      [0,1,2,0,1,2,0,1,2,0,1,2,0,1,2,0,1,2,0,1,2,0,1,2,0,1,2,0,1,2,0,1,2,0,1,2,0,1,2,0,1,2,0,1,2,0,1,2,0,1,2,0,1,2,0,1,2,0,1,2,0,1,2,0,1,2,0,1,2,0,1,2,0,1,2,0,1,2,0,1,2,0,1,2,0,1,2,0,1,2,0,1,2,0,1,2,0,1,2,0,1,2,0,1,2]


  """
  @doc offset: 0,
       sequence: "a(n) = n mod 3.",
       references: [{:oeis, :a010872, "https://oeis.org/A010872"}]
  def create_sequence_a010872(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a010872/1)
  end

  @doc offset: 0
  def seq_a010872(idx) do
    rem(idx, 3)
  end

  @doc """
  OEIS Sequence `A023416` - Number of 0's in binary expansion of n.

  From [OEIS A023416](https://oeis.org/A023416):

  > Number of 0's in binary expansion of n.
  > (Formerly )

  **Sequence IDs**: `:a023416` 

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023416) |> Sequence.take!(105)
      [1,0,1,0,2,1,1,0,3,2,2,1,2,1,1,0,4,3,3,2,3,2,2,1,3,2,2,1,2,1,1,0,5,4,4,3,4,3,3,2,4,3,3,2,3,2,2,1,4,3,3,2,3,2,2,1,3,2,2,1,2,1,1,0,6,5,5,4,5,4,4,3,5,4,4,3,4,3,3,2,5,4,4,3,4,3,3,2,4,3,3,2,3,2,2,1,5,4,4,3,4,3,3,2,4]


  """
  @doc offset: 0,
       sequence: "Number of 0's in binary expansion of n.",
       references: [{:oeis, :a023416, "https://oeis.org/A023416"}]
  def create_sequence_a023416(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023416/1)
  end

  @doc offset: 0
  def seq_a023416(idx) do
    Math.digit_count(idx, [0], base: 2)
  end

  @doc """
  OEIS Sequence `A023705` - Numbers with no 0's in base 4 expansion.

  From [OEIS A023705](https://oeis.org/A023705):

  > Numbers with no 0's in base 4 expansion.
  > (Formerly )

  **Sequence IDs**: `:a023705`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023705) |> Sequence.take!(63)
      [1,2,3,5,6,7,9,10,11,13,14,15,21,22,23,25,26,27,29,30,31,37,38,39,41,42,43,45,46,47,53,54,55,57,58,59,61,62,63,85,86,87,89,90,91,93,94,95,101,102,103,105,106,107,109,110,111,117,118,119,121,122,123]


  """
  @doc offset: 1,
       sequence: "Numbers with no 0's in base 4 expansion.",
       references: [{:oeis, :a023705, "https://oeis.org/A023705"}]
  def create_sequence_a023705(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023705/2)
  end

  @doc offset: 1
  def seq_a023705(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [0], base: 4) == 0
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A032924` - Numbers whose ternary expansion contains no 0.

  From [OEIS A032924](https://oeis.org/A032924):

  > Numbers whose ternary expansion contains no 0.
  > (Formerly )

  **Sequence IDs**: `:a032924`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a032924) |> Sequence.take!(60)
      [1,2,4,5,7,8,13,14,16,17,22,23,25,26,40,41,43,44,49,50,52,53,67,68,70,71,76,77,79,80,121,122,124,125,130,131,133,134,148,149,151,152,157,158,160,161,202,203,205,206,211,212,214,215,229,230,232,233,238,239]


  """
  @doc offset: 1,
       sequence: "Numbers whose ternary expansion contains no 0.",
       references: [{:oeis, :a032924, "https://oeis.org/A032924"}]
  def create_sequence_a032924(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a032924/2)
  end

  @doc offset: 1
  def seq_a032924(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [0], base: 3) == 0
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A052040` - Numbers n such that n^2 lacks the digit zero in its decimal expansion.

  From [OEIS A052040](https://oeis.org/A052040):

  > Numbers n such that n^2 lacks the digit zero in its decimal expansion.
  > (Formerly )

  **Sequence IDs**: `:a052040`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a052040) |> Sequence.take!(72)
      [1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,21,22,23,24,25,26,27,28,29,31,34,35,36,37,38,39,41,42,43,44,46,54,56,57,58,59,61,62,63,65,66,67,68,69,72,73,74,75,76,77,79,81,82,83,85,86,87,88,89,91,92,93,94,96]


  """
  @doc offset: 1,
       sequence: "Numbers n such that n^2 lacks the digit zero in its decimal expansion.",
       references: [{:oeis, :a052040, "https://oeis.org/A052040"}]
  def create_sequence_a052040(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a052040/2)
  end

  @doc offset: 1
  def seq_a052040(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v * v, [0]) == 0
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A055640` - Number of nonzero digits in decimal expansion of n.

  From [OEIS A055640](https://oeis.org/A055640):

  > Number of nonzero digits in decimal expansion of n.
  > (Formerly )

  **Sequence IDs**: `:a055640`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a055640) |> Sequence.take!(105)
      [0,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,1,2,2,2,2]


  """
  @doc offset: 0,
       sequence: "Number of nonzero digits in decimal expansion of n.",
       references: [{:oeis, :a055640, "https://oeis.org/A055640"}]
  def create_sequence_a055640(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a055640/1)
  end

  @doc offset: 0
  def seq_a055640(idx) do
    Math.digit_count(idx, [1, 2, 3, 4, 5, 6, 7, 8, 9])
  end

  @doc """
  OEIS Sequence `A055641` - Number of zero digits in n.

  From [OEIS A055641](https://oeis.org/A055641):

  > Number of zero digits in n.
  > (Formerly )

  **Sequence IDs**: `:a055641`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a055641) |> Sequence.take!(106)
      [1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,2,1,1,1,1,1]


  """
  @doc offset: 0,
       sequence: "Number of zero digits in n.",
       references: [{:oeis, :a055641, "https://oeis.org/A055641"}]
  def create_sequence_a055641(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a055641/1)
  end

  @doc offset: 0
  def seq_a055641(idx) do
    Math.digit_count(idx, [0])
  end

  @doc """
  OEIS Sequence `A055642` - Number of digits in decimal expansion of n.

  From [OEIS A055642](https://oeis.org/A055642):

  > Number of digits in decimal expansion of n.
  > (Formerly )

  **Sequence IDs**: `:a055642`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a055642) |> Sequence.take!(106)
      [1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3]


  """
  @doc offset: 0,
       sequence: "Number of digits in decimal expansion of n.",
       references: [{:oeis, :a055642, "https://oeis.org/A055642"}]
  def create_sequence_a055642(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a055642/1)
  end

  @doc offset: 0
  def seq_a055642(idx) do
    Integer.digits(idx) |> length()
  end

  @doc """
  OEIS Sequence `A067251` - Numbers with no trailing zeros in decimal representation.

  From [OEIS A067251](https://oeis.org/A067251):

  > Numbers with no trailing zeros in decimal representation.
  > (Formerly )

  **Sequence IDs**: `:a067251`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a067251) |> Sequence.take!(94)
      [1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,21,22,23,24,25,26,27,28,29,31,32,33,34,35,36,37,38,39,41,42,43,44,45,46,47,48,49,51,52,53,54,55,56,57,58,59,61,62,63,64,65,66,67,68,69,71,72,73,74,75,76,77,78,79,81,82,83,84,85,86,87,88,89,91,92,93,94,95,96,97,98,99,101,102,103,104]


  """
  @doc offset: 1,
       sequence: "Numbers with no trailing zeros in decimal representation.",
       references: [{:oeis, :a067251, "https://oeis.org/A067251"}]
  def create_sequence_a067251(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a067251/2)
  end

  @doc offset: 1
  def seq_a067251(_idx, last) do
    Math.next_number(
      fn v ->
        v |> Integer.digits() |> List.last() != 0
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A071858` - (Number of 1's in binary expansion of n) mod 3.

  From [OEIS A071858](https://oeis.org/A071858):

  > (Number of 1's in binary expansion of n) mod 3.
  > (Formerly )

  **Sequence IDs**: `:a071858`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a071858) |> Sequence.take!(105)
      [0,1,1,2,1,2,2,0,1,2,2,0,2,0,0,1,1,2,2,0,2,0,0,1,2,0,0,1,0,1,1,2,1,2,2,0,2,0,0,1,2,0,0,1,0,1,1,2,2,0,0,1,0,1,1,2,0,1,1,2,1,2,2,0,1,2,2,0,2,0,0,1,2,0,0,1,0,1,1,2,2,0,0,1,0,1,1,2,0,1,1,2,1,2,2,0,2,0,0,1,0,1,1,2,0]


  """
  @doc offset: 0,
       sequence: "(Number of 1's in binary expansion of n) mod 3.",
       references: [{:oeis, :a071858, "https://oeis.org/A071858"}]
  def create_sequence_a071858(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a071858/1)
  end

  @doc offset: 0
  def seq_a071858(idx) do
    Math.digit_count(idx, [1], base: 2) |> rem(3)
  end

  @doc """
  OEIS Sequence `A122840` - a(n) is the number of 0s at the end of n when n is written in base 10.

  From [OEIS A122840](https://oeis.org/A122840):

  > a(n) is the number of 0s at the end of n when n is written in base 10.
  > (Formerly )

  **Sequence IDs**: `:a122840`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a122840) |> Sequence.take!(105)
      [0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0]


  """
  @doc offset: 1,
       sequence: "a(n) is the number of 0s at the end of n when n is written in base 10.",
       references: [{:oeis, :a122840, "https://oeis.org/A122840"}]
  def create_sequence_a122840(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a122840/1)
  end

  @doc offset: 1
  def seq_a122840(idx) do
    idx
    |> Integer.digits()
    |> Enum.reverse()
    |> Enum.take_while(fn v -> v == 0 end)
    |> length()
  end

  @doc """
  OEIS Sequence `A160093` - Number of digits in n, excluding any trailing zeros.

  From [OEIS A160093](https://oeis.org/A160093):

  > Number of digits in n, excluding any trailing zeros.
  > (Formerly )

  **Sequence IDs**: `:a160093`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a160093) |> Sequence.take!(105)
      [1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,2,2,1,3,3,3,3,3]


  """
  @doc offset: 1,
       sequence: "Number of digits in n, excluding any trailing zeros.",
       references: [{:oeis, :a160093, "https://oeis.org/A160093"}]
  def create_sequence_a160093(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a160093/1)
  end

  @doc offset: 1
  def seq_a160093(idx) do
    idx
    |> Integer.digits()
    |> Enum.reverse()
    |> Enum.drop_while(fn v -> v == 0 end)
    |> length()
  end

  @doc """
  OEIS Sequence `A179868` - (Number of 1's in binary expansion of n) mod 4.

  From [OEIS A179868](https://oeis.org/A179868):

  > (Number of 1's in binary expansion of n) mod 4.
  > (Formerly )

  **Sequence IDs**: `:a179868`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a179868) |> Sequence.take!(101)
      [0,1,1,2,1,2,2,3,1,2,2,3,2,3,3,0,1,2,2,3,2,3,3,0,2,3,3,0,3,0,0,1,1,2,2,3,2,3,3,0,2,3,3,0,3,0,0,1,2,3,3,0,3,0,0,1,3,0,0,1,0,1,1,2,1,2,2,3,2,3,3,0,2,3,3,0,3,0,0,1,2,3,3,0,3,0,0,1,3,0,0,1,0,1,1,2,2,3,3,0,3]


  """
  @doc offset: 0,
       sequence: "(Number of 1's in binary expansion of n) mod 4.",
       references: [{:oeis, :a179868, "https://oeis.org/A179868"}]
  def create_sequence_a179868(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a179868/1)
  end

  @doc offset: 0
  def seq_a179868(idx) do
    Math.digit_count(idx, [1], base: 2) |> rem(4)
  end

  @doc """
  OEIS Sequence `A193238` - Number of prime digits in decimal representation of n.

  From [OEIS A193238](https://oeis.org/A193238):

  > Number of prime digits in decimal representation of n.
  > (Formerly )

  **Sequence IDs**: `:a193238`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a193238) |> Sequence.take!(86)
      [0,0,1,1,0,1,0,1,0,0,0,0,1,1,0,1,0,1,0,0,1,1,2,2,1,2,1,2,1,1,1,1,2,2,1,2,1,2,1,1,0,0,1,1,0,1,0,1,0,0,1,1,2,2,1,2,1,2,1,1,0,0,1,1,0,1,0,1,0,0,1,1,2,2,1,2,1,2,1,1,0,0,1,1,0,1]


  """
  @doc offset: 0,
       sequence: "Number of prime digits in decimal representation of n.",
       references: [{:oeis, :a193238, "https://oeis.org/A193238"}]
  def create_sequence_a193238(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a193238/1)
  end

  @doc offset: 0
  def seq_a193238(idx) do
    Math.digit_count(idx, [2, 3, 5, 7])
  end

  @doc """
  OEIS Sequence `A196563` - Number of even digits in decimal representation of n.

  From [OEIS A196563](https://oeis.org/A196563):

  > Number of even digits in decimal representation of n.
  > (Formerly ) 

  **Sequence IDs**: `:a196563`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a196563) |> Sequence.take!(86)
      [1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,1,0,2,1,2,1,2,1,2,1,2,1,1,0,1,0,1,0,1,0,1,0,2,1,2,1,2,1,2,1,2,1,1,0,1,0,1,0,1,0,1,0,2,1,2,1,2,1,2,1,2,1,1,0,1,0,1,0,1,0,1,0,2,1,2,1,2,1]


  """
  @doc offset: 0,
       sequence: "Number of even digits in decimal representation of n.",
       references: [{:oeis, :a196563, "https://oeis.org/A196563"}]
  def create_sequence_a196563(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a196563/1)
  end

  @doc offset: 0
  def seq_a196563(idx) do
    Math.digit_count(idx, [0, 2, 4, 6, 8])
  end

  @doc """
  OEIS Sequence `A248910` - Numbers with no zeros in base-6 representation.

  From [OEIS A248910](https://oeis.org/A248910):

  > Numbers with no zeros in base-6 representation.
  > (Formerly )

  **Sequence IDs**: `:a248910`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a248910) |> Sequence.take!(67)
      [1,2,3,4,5,7,8,9,10,11,13,14,15,16,17,19,20,21,22,23,25,26,27,28,29,31,32,33,34,35,43,44,45,46,47,49,50,51,52,53,55,56,57,58,59,61,62,63,64,65,67,68,69,70,71,79,80,81,82,83,85,86,87,88,89,91,92]


  """
  @doc offset: 1,
       sequence: "Numbers with no zeros in base-6 representation.",
       references: [{:oeis, :a248910, "https://oeis.org/A248910"}]
  def create_sequence_a248910(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a248910/2)
  end

  @doc offset: 1
  def seq_a248910(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [0], base: 6) == 0
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A255805` - Numbers with no zeros in base-8 representation.

  From [OEIS A255805](https://oeis.org/A255805):

  > Numbers with no zeros in base-8 representation.
  > (Formerly )

  **Sequence IDs**: `:a255805`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a255805) |> Sequence.take!(67)
      [1,2,3,4,5,6,7,9,10,11,12,13,14,15,17,18,19,20,21,22,23,25,26,27,28,29,30,31,33,34,35,36,37,38,39,41,42,43,44,45,46,47,49,50,51,52,53,54,55,57,58,59,60,61,62,63,73,74,75,76,77,78,79,81,82,83,84]


  """
  @doc offset: 1,
       sequence: "Numbers with no zeros in base-8 representation.",
       references: [{:oeis, :a255805, "https://oeis.org/A255805"}]
  def create_sequence_a255805(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a255805/2)
  end

  @doc offset: 1
  def seq_a255805(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [0], base: 8) == 0
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A255808` - Numbers with no zeros in base-9 representation.

  From [OEIS A255808](https://oeis.org/A255808):

  > Numbers with no zeros in base-9 representation.
  > (Formerly )

  **Sequence IDs**: `:a255808`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a255808) |> Sequence.take!(67)
      [1,2,3,4,5,6,7,8,10,11,12,13,14,15,16,17,19,20,21,22,23,24,25,26,28,29,30,31,32,33,34,35,37,38,39,40,41,42,43,44,46,47,48,49,50,51,52,53,55,56,57,58,59,60,61,62,64,65,66,67,68,69,70,71,73,74,75]


  """
  @doc offset: 1,
       sequence: "Numbers with no zeros in base-9 representation.",
       references: [{:oeis, :a255808, "https://oeis.org/A255808"}]
  def create_sequence_a255808(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a255808/2)
  end

  @doc offset: 1
  def seq_a255808(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [0], base: 9) == 0
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A007953` - Digital sum (i.e., sum of digits) of n; also called digsum(n).

  From [OEIS A007953](https://oeis.org/A007953):

  > Digital sum (i.e., sum of digits) of n; also called digsum(n).
  > (Formerly )

  **Sequence IDs**: `:a007953`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a007953) |> Sequence.take!(88)
      [0,1,2,3,4,5,6,7,8,9,1,2,3,4,5,6,7,8,9,10,2,3,4,5,6,7,8,9,10,11,3,4,5,6,7,8,9,10,11,12,4,5,6,7,8,9,10,11,12,13,5,6,7,8,9,10,11,12,13,14,6,7,8,9,10,11,12,13,14,15,7,8,9,10,11,12,13,14,15,16,8,9,10,11,12,13,14,15]


  """
  @doc offset: 0,
       sequence: "Digital sum (i.e., sum of digits) of n; also called digsum(n).",
       references: [{:oeis, :a007953, "https://oeis.org/A007953"}]
  def create_sequence_a007953(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a007953/1)
  end

  @doc offset: 0
  def seq_a007953(idx) do
    idx |> Integer.digits() |> Enum.sum()
  end

  @doc """
  OEIS Sequence `A014263` - Numbers that contain even digits only.

  From [OEIS A014263](https://oeis.org/A014263):

  > Numbers that contain even digits only.
  > (Formerly )

  **Sequence IDs**: `:a014263`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a014263) |> Sequence.take!(58)
      [0,2,4,6,8,20,22,24,26,28,40,42,44,46,48,60,62,64,66,68,80,82,84,86,88,200,202,204,206,208,220,222,224,226,228,240,242,244,246,248,260,262,264,266,268,280,282,284,286,288,400,402,404,406,408,420,422,424]


  """
  @doc offset: 1,
       sequence: "Numbers that contain even digits only.",
       references: [{:oeis, :a014263, "https://oeis.org/A014263"}]
  def create_sequence_a014263(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a014263/2)
  end

  @doc offset: 1, fill_value: -1
  def seq_a014263(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [1, 3, 5, 7, 9]) == 0
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A023692` - Numbers with a single 1 in their ternary expansion.

  From [OEIS A023692](https://oeis.org/A023692):

  > Numbers with a single 1 in their ternary expansion.
  > (Formerly )

  **Sequence IDs**: `:a023692`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023692) |> Sequence.take!(56)
      [1,3,5,7,9,11,15,17,19,21,23,25,27,29,33,35,45,47,51,53,55,57,59,61,63,65,69,71,73,75,77,79,81,83,87,89,99,101,105,107,135,137,141,143,153,155,159,161,163,165,167,169,171,173,177,179]


  """
  @doc offset: 1,
       sequence: "Numbers with a single 1 in their ternary expansion.",
       references: [{:oeis, :a023692, "https://oeis.org/A023692"}]
  def create_sequence_a023692(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023692/2)
  end

  @doc offset: 1
  def seq_a023692(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [1], base: 3) == 1
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A023693` - Numbers with exactly 2 1's in ternary expansion.

  From [OEIS A023693](https://oeis.org/A023693):

  > Numbers with exactly 2 1's in ternary expansion.
  > (Formerly )

  **Sequence IDs**: `:a023693`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023693) |> Sequence.take!(53)
      [4,10,12,14,16,22,28,30,32,34,36,38,42,44,46,48,50,52,58,64,66,68,70,76,82,84,86,88,90,92,96,98,100,102,104,106,108,110,114,116,126,128,132,134,136,138,140,142,144,146,150,152,154]


  """
  @doc offset: 1,
       sequence: "Numbers with exactly 2 1's in ternary expansion.",
       references: [{:oeis, :a023693, "https://oeis.org/A023693"}]
  def create_sequence_a023693(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023693/2)
  end

  @doc offset: 1
  def seq_a023693(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [1], base: 3) == 2
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A023694` - Numbers with exactly 3 1's in ternary expansion.

  From [OEIS A023694](https://oeis.org/A023694):

  > Numbers with exactly 3 1's in ternary expansion.
  > (Formerly )

  **Sequence IDs**: `:a023694`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023694) |> Sequence.take!(49)
      [13,31,37,39,41,43,49,67,85,91,93,95,97,103,109,111,113,115,117,119,123,125,127,129,131,133,139,145,147,149,151,157,175,193,199,201,203,205,211,229,247,253,255,257,259,265,271,273,275]


  """
  @doc offset: 1,
       sequence: "Numbers with exactly 3 1's in ternary expansion.",
       references: [{:oeis, :a023694, "https://oeis.org/A023694"}]
  def create_sequence_a023694(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023694/2)
  end

  @doc offset: 1
  def seq_a023694(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [1], base: 3) == 3
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A023695` - Numbers with exactly 4 1's in ternary expansion.

  From [OEIS A023695](https://oeis.org/A023695):

  > Numbers with exactly 4 1's in ternary expansion.
  > (Formerly )

  **Sequence IDs**: `:a023695`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023695) |> Sequence.take!(45)
      [40,94,112,118,120,122,124,130,148,202,256,274,280,282,284,286,292,310,328,334,336,338,340,346,352,354,356,358,360,362,366,368,370,372,374,376,382,388,390,392,394,400,418,436,442]


  """
  @doc offset: 1,
       sequence: "Numbers with exactly 4 1's in ternary expansion.",
       references: [{:oeis, :a023695, "https://oeis.org/A023695"}]
  def create_sequence_a023695(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023695/2)
  end

  @doc offset: 1
  def seq_a023695(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [1], base: 3) == 4
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A023696` - Numbers with exactly 5 1's in ternary expansion.

  From [OEIS A023696](https://oeis.org/A023696):

  > Numbers with exactly 5 1's in ternary expansion.
  > (Formerly )

  **Sequence IDs**: `:a023696`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023696) |> Sequence.take!(40)
      [121,283,337,355,361,363,365,367,373,391,445,607,769,823,841,847,849,851,853,859,877,931,985,1003,1009,1011,1013,1015,1021,1039,1057,1063,1065,1067,1069,1075,1081,1083,1085,1087]


  """
  @doc offset: 1,
       sequence: "Numbers with exactly 5 1's in ternary expansion.",
       references: [{:oeis, :a023696, "https://oeis.org/A023696"}]
  def create_sequence_a023696(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023696/2)
  end

  @doc offset: 1
  def seq_a023696(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [1], base: 3) == 5
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A023698` - Numbers with exactly 7 1's in ternary expansion.

  From [OEIS A023698](https://oeis.org/A023698):

  > Numbers with exactly 7 1's in ternary expansion.
  > (Formerly )

  **Sequence IDs**: `:a023698`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023698) |> Sequence.take!(36)
      [1093,2551,3037,3199,3253,3271,3277,3279,3281,3283,3289,3307,3361,3523,4009,5467,6925,7411,7573,7627,7645,7651,7653,7655,7657,7663,7681,7735,7897,8383,8869,9031,9085,9103,9109,9111]


  """
  @doc offset: 1,
       sequence: "Numbers with exactly 7 1's in ternary expansion.",
       references: [{:oeis, :a023698, "https://oeis.org/A023698"}]
  def create_sequence_a023698(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023698/2)
  end

  @doc offset: 1
  def seq_a023698(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [1], base: 3) == 7
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A023699` - Numbers with a single 2 in their ternary expansion.

  From [OEIS A023699](https://oeis.org/A023699):

  > Numbers with a single 2 in their ternary expansion.
  > (Formerly )

  **Sequence IDs**: `:a023699`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023699) |> Sequence.take!(56)
      [2,5,6,7,11,14,15,16,18,19,21,22,29,32,33,34,38,41,42,43,45,46,48,49,54,55,57,58,63,64,66,67,83,86,87,88,92,95,96,97,99,100,102,103,110,113,114,115,119,122,123,124,126,127,129,130]


  """
  @doc offset: 1,
       sequence: "Numbers with a single 2 in their ternary expansion.",
       references: [{:oeis, :a023699, "https://oeis.org/A023699"}]
  def create_sequence_a023699(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023699/2)
  end

  @doc offset: 1
  def seq_a023699(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [2], base: 3) == 1
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A023700` - Numbers with exactly 2 2's in ternary expansion.

  From [OEIS A023700](https://oeis.org/A023700):

  > Numbers with exactly 2 2's in ternary expansion.
  > (Formerly )

  **Sequence IDs**: `:a023700`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023700) |> Sequence.take!(51)
      [8,17,20,23,24,25,35,44,47,50,51,52,56,59,60,61,65,68,69,70,72,73,75,76,89,98,101,104,105,106,116,125,128,131,132,133,137,140,141,142,146,149,150,151,153,154,156,157,164,167,168]


  """
  @doc offset: 1,
       sequence: "Numbers with exactly 2 2's in ternary expansion.",
       references: [{:oeis, :a023700, "https://oeis.org/A023700"}]
  def create_sequence_a023700(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023700/2)
  end

  @doc offset: 1
  def seq_a023700(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [2], base: 3) == 2
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A023701` - Numbers with exactly 3 2's in their ternary expansion.

  From [OEIS A023701](https://oeis.org/A023701):

  > Numbers with exactly 3 2's in their ternary expansion.
  > (Formerly )

  **Sequence IDs**: `:a023701`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023701) |> Sequence.take!(47)
      [26,53,62,71,74,77,78,79,107,134,143,152,155,158,159,160,170,179,182,185,186,187,197,206,209,212,213,214,218,221,222,223,227,230,231,232,234,235,237,238,269,296,305,314,317,320,321]


  """
  @doc offset: 1,
       sequence: "Numbers with exactly 3 2's in their ternary expansion.",
       references: [{:oeis, :a023701, "https://oeis.org/A023701"}]
  def create_sequence_a023701(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023701/2)
  end

  @doc offset: 1
  def seq_a023701(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [2], base: 3) == 3
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A023702` - Numbers with exactly 4 2's in ternary expansion of n.

  From [OEIS A023702](https://oeis.org/A023702):

  > Numbers with exactly 4 2's in ternary expansion of n.
  > (Formerly ) 

  **Sequence IDs**: `:a023702`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023702) |> Sequence.take!(45)
      [80,161,188,215,224,233,236,239,240,241,323,404,431,458,467,476,479,482,483,484,512,539,548,557,560,563,564,565,593,620,629,638,641,644,645,646,656,665,668,671,672,673,683,692,695]


  """
  @doc offset: 1,
       sequence: "Numbers with exactly 4 2's in ternary expansion of n.",
       references: [{:oeis, :a023702, "https://oeis.org/A023702"}]
  def create_sequence_a023702(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023702/2)
  end

  @doc offset: 1
  def seq_a023702(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [2], base: 3) == 4
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A023703` - Numbers with exactly 5 2's in ternary expansion.

  From [OEIS A023703](https://oeis.org/A023703):

  > Numbers with exactly 5 2's in ternary expansion.
  > (Formerly )

  **Sequence IDs**: `:a023703`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023703) |> Sequence.take!(38)
      [242,485,566,647,674,701,710,719,722,725,726,727,971,1214,1295,1376,1403,1430,1439,1448,1451,1454,1455,1456,1538,1619,1646,1673,1682,1691,1694,1697,1698,1699,1781,1862,1889,1916]


  """
  @doc offset: 1,
       sequence: "Numbers with exactly 5 2's in ternary expansion.",
       references: [{:oeis, :a023703, "https://oeis.org/A023703"}]
  def create_sequence_a023703(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023703/2)
  end

  @doc offset: 1
  def seq_a023703(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [2], base: 3) == 5
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A023704` - Numbers with exactly 6 2's in ternary expansion.

  From [OEIS A023704](https://oeis.org/A023704):

  > Numbers with exactly 6 2's in ternary expansion.
  > (Formerly )

  **Sequence IDs**: `:a023704`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023704) |> Sequence.take!(36)
      [728,1457,1700,1943,2024,2105,2132,2159,2168,2177,2180,2183,2184,2185,2915,3644,3887,4130,4211,4292,4319,4346,4355,4364,4367,4370,4371,4372,4616,4859,4940,5021,5048,5075,5084,5093]


  """
  @doc offset: 1,
       sequence: "Numbers with exactly 6 2's in ternary expansion.",
       references: [{:oeis, :a023704, "https://oeis.org/A023704"}]
  def create_sequence_a023704(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023704/2)
  end

  @doc offset: 1
  def seq_a023704(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [2], base: 3) == 6
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A023706` - Numbers with a single 0 in their base 4 expansion.

  From [OEIS A023706](https://oeis.org/A023706):

  > Numbers with a single 0 in their base 4 expansion.
  > (Formerly )

  **Sequence IDs**: `:a023706`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023706) |> Sequence.take!(56)
      [0,4,8,12,17,18,19,20,24,28,33,34,35,36,40,44,49,50,51,52,56,60,69,70,71,73,74,75,77,78,79,81,82,83,84,88,92,97,98,99,100,104,108,113,114,115,116,120,124,133,134,135,137,138,139,141]


  """
  @doc offset: 1,
       sequence: "Numbers with a single 0 in their base 4 expansion.",
       references: [{:oeis, :a023706, "https://oeis.org/A023706"}]
  def create_sequence_a023706(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023706/2)
  end

  @doc offset: 1, fill_value: -1
  def seq_a023706(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [0], base: 4) == 1
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A023707` - Numbers with exactly 2 0's in base 4 expansion.

  From [OEIS A023707](https://oeis.org/A023707):

  > Numbers with exactly 2 0's in base 4 expansion.
  > (Formerly )

  **Sequence IDs**: `:a023707`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023707) |> Sequence.take!(48)
      [16,32,48,65,66,67,68,72,76,80,96,112,129,130,131,132,136,140,144,160,176,193,194,195,196,200,204,208,224,240,261,262,263,265,266,267,269,270,271,273,274,275,276,280,284,289,290,291]


  """
  @doc offset: 1,
       sequence: "Numbers with exactly 2 0's in base 4 expansion.",
       references: [{:oeis, :a023707, "https://oeis.org/A023707"}]
  def create_sequence_a023707(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023707/2)
  end

  @doc offset: 1
  def seq_a023707(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [0], base: 4) == 2
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A023708` - Numbers with exactly 3 0's in base 4 expansion.

  From [OEIS A023708](https://oeis.org/A023708):

  > Numbers with exactly 3 0's in base 4 expansion.
  > (Formerly )

  **Sequence IDs**: `:a023708`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023708) |> Sequence.take!(44)
      [64,128,192,257,258,259,260,264,268,272,288,304,320,384,448,513,514,515,516,520,524,528,544,560,576,640,704,769,770,771,772,776,780,784,800,816,832,896,960,1029,1030,1031,1033,1034]


  """
  @doc offset: 1,
       sequence: "Numbers with exactly 3 0's in base 4 expansion.",
       references: [{:oeis, :a023708, "https://oeis.org/A023708"}]
  def create_sequence_a023708(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023708/2)
  end

  @doc offset: 1
  def seq_a023708(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [0], base: 4) == 3
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A023709` - Numbers with no 1's in base 4 expansion.

  From [OEIS A023709](https://oeis.org/A023709):

  > Numbers with no 1's in base 4 expansion.
  > (Formerly )

  **Sequence IDs**: `:a023709`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023709) |> Sequence.take!(52)
      [0,2,3,8,10,11,12,14,15,32,34,35,40,42,43,44,46,47,48,50,51,56,58,59,60,62,63,128,130,131,136,138,139,140,142,143,160,162,163,168,170,171,172,174,175,176,178,179,184,186,187,188]


  """
  @doc offset: 1,
       sequence: "Numbers with no 1's in base 4 expansion.",
       references: [{:oeis, :a023709, "https://oeis.org/A023709"}]
  def create_sequence_a023709(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023709/2)
  end

  @doc offset: 1, fill_value: -1
  def seq_a023709(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [1], base: 4) == 0
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A023710` - Numbers with a single 1 in their base 4 expansion.

  From [OEIS A023710](https://oeis.org/A023710):

  > Numbers with a single 1 in their base 4 expansion.
  > (Formerly )

  **Sequence IDs**: `:a023710`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023710) |> Sequence.take!(56)
      [1,4,6,7,9,13,16,18,19,24,26,27,28,30,31,33,36,38,39,41,45,49,52,54,55,57,61,64,66,67,72,74,75,76,78,79,96,98,99,104,106,107,108,110,111,112,114,115,120,122,123,124,126,127,129,132]


  """
  @doc offset: 1,
       sequence: "Numbers with a single 1 in their base 4 expansion.",
       references: [{:oeis, :a023710, "https://oeis.org/A023710"}]
  def create_sequence_a023710(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023710/2)
  end

  @doc offset: 1
  def seq_a023710(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [1], base: 4) == 1
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A023711` - Numbers with exactly 2 1's in base 4 expansion.

  From [OEIS A023711](https://oeis.org/A023711):

  > Numbers with exactly 2 1's in base 4 expansion.
  > (Formerly )

  **Sequence IDs**: `:a023711`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023711) |> Sequence.take!(51)
      [5,17,20,22,23,25,29,37,53,65,68,70,71,73,77,80,82,83,88,90,91,92,94,95,97,100,102,103,105,109,113,116,118,119,121,125,133,145,148,150,151,153,157,165,181,197,209,212,214,215,217]


  """
  @doc offset: 1,
       sequence: "Numbers with exactly 2 1's in base 4 expansion.",
       references: [{:oeis, :a023711, "https://oeis.org/A023711"}]
  def create_sequence_a023711(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023711/2)
  end

  @doc offset: 1
  def seq_a023711(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [1], base: 4) == 2
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A023712` - Numbers with exactly 3 1's in base 4 expansion.

  From [OEIS A023712](https://oeis.org/A023712):

  > Numbers with exactly 3 1's in base 4 expansion.
  > (Formerly )

  **Sequence IDs**: `:a023712`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023712) |> Sequence.take!(47)
      [21,69,81,84,86,87,89,93,101,117,149,213,261,273,276,278,279,281,285,293,309,321,324,326,327,329,333,336,338,339,344,346,347,348,350,351,353,356,358,359,361,365,369,372,374,375,377]


  """
  @doc offset: 1,
       sequence: "Numbers with exactly 3 1's in base 4 expansion.",
       references: [{:oeis, :a023712, "https://oeis.org/A023712"}]
  def create_sequence_a023712(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023712/2)
  end

  @doc offset: 1
  def seq_a023712(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [1], base: 4) == 3
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A023713` - Numbers with no 2's in base 4 expansion.

  From [OEIS A023713](https://oeis.org/A023713):

  > Numbers with no 2's in base 4 expansion.
  > (Formerly )

  **Sequence IDs**: `:a023713`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023713) |> Sequence.take!(58)
      [0,1,3,4,5,7,12,13,15,16,17,19,20,21,23,28,29,31,48,49,51,52,53,55,60,61,63,64,65,67,68,69,71,76,77,79,80,81,83,84,85,87,92,93,95,112,113,115,116,117,119,124,125,127,192,193,195,196]


  """
  @doc offset: 1,
       sequence: "Numbers with no 2's in base 4 expansion.",
       references: [{:oeis, :a023713, "https://oeis.org/A023713"}]
  def create_sequence_a023713(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023713/2)
  end

  @doc offset: 1, fill_value: -1
  def seq_a023713(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [2], base: 4) == 0
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A023714` - Numbers with a single 2 in their base 4 expansion.

  From [OEIS A023714](https://oeis.org/A023714):

  > Numbers with a single 2 in their base 4 expansion.
  > (Formerly )

  **Sequence IDs**: `:a023714`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023714) |> Sequence.take!(56)
      [2,6,8,9,11,14,18,22,24,25,27,30,32,33,35,36,37,39,44,45,47,50,54,56,57,59,62,66,70,72,73,75,78,82,86,88,89,91,94,96,97,99,100,101,103,108,109,111,114,118,120,121,123,126,128,129]


  """
  @doc offset: 1,
       sequence: "Numbers with a single 2 in their base 4 expansion.",
       references: [{:oeis, :a023714, "https://oeis.org/A023714"}]
  def create_sequence_a023714(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023714/2)
  end

  @doc offset: 1
  def seq_a023714(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [2], base: 4) == 1
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A023715` - Numbers with exactly 2 2's in base 4 expansion.

  From [OEIS A023715](https://oeis.org/A023715):

  > Numbers with exactly 2 2's in base 4 expansion.
  > (Formerly )

  **Sequence IDs**: `:a023715`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023715) |> Sequence.take!(48)
      [10,26,34,38,40,41,43,46,58,74,90,98,102,104,105,107,110,122,130,134,136,137,139,142,146,150,152,153,155,158,160,161,163,164,165,167,172,173,175,178,182,184,185,187,190,202,218,226]


  """
  @doc offset: 1,
       sequence: "Numbers with exactly 2 2's in base 4 expansion.",
       references: [{:oeis, :a023715, "https://oeis.org/A023715"}]
  def create_sequence_a023715(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023715/2)
  end

  @doc offset: 1
  def seq_a023715(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [2], base: 4) == 2
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A023716` - Numbers with exactly 3 2's in base 4 expansion.

  From [OEIS A023716](https://oeis.org/A023716):

  > Numbers with exactly 3 2's in base 4 expansion.
  > (Formerly )

  **Sequence IDs**: `:a023716`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023716) |> Sequence.take!(45)
      [42,106,138,154,162,166,168,169,171,174,186,234,298,362,394,410,418,422,424,425,427,430,442,490,522,538,546,550,552,553,555,558,570,586,602,610,614,616,617,619,622,634,642,646,648]


  """
  @doc offset: 1,
       sequence: "Numbers with exactly 3 2's in base 4 expansion.",
       references: [{:oeis, :a023716, "https://oeis.org/A023716"}]
  def create_sequence_a023716(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023716/2)
  end

  @doc offset: 1
  def seq_a023716(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [2], base: 4) == 3
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A023717` - Numbers with no 3's in base 4 expansion.

  From [OEIS A023717](https://oeis.org/A023717):

  > Numbers with no 3's in base 4 expansion.
  > (Formerly )

  **Sequence IDs**: `:a023717`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023717) |> Sequence.take!(59)
      [0,1,2,4,5,6,8,9,10,16,17,18,20,21,22,24,25,26,32,33,34,36,37,38,40,41,42,64,65,66,68,69,70,72,73,74,80,81,82,84,85,86,88,89,90,96,97,98,100,101,102,104,105,106,128,129,130,132,133]


  """
  @doc offset: 0,
       sequence: "Numbers with no 3's in base 4 expansion.",
       references: [{:oeis, :a023717, "https://oeis.org/A023717"}]
  def create_sequence_a023717(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023717/2)
  end

  @doc offset: 0, fill_value: -1
  def seq_a023717(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [3], base: 4) == 0
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A023718` - Numbers with a single 3 in their base 4 expansion.

  From [OEIS A023718](https://oeis.org/A023718):

  > Numbers with a single 3 in their base 4 expansion.
  > (Formerly )

  **Sequence IDs**: `:a023718`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023718) |> Sequence.take!(56)
      [3,7,11,12,13,14,19,23,27,28,29,30,35,39,43,44,45,46,48,49,50,52,53,54,56,57,58,67,71,75,76,77,78,83,87,91,92,93,94,99,103,107,108,109,110,112,113,114,116,117,118,120,121,122,131,135]


  """
  @doc offset: 1,
       sequence: "Numbers with a single 3 in their base 4 expansion.",
       references: [{:oeis, :a023718, "https://oeis.org/A023718"}]
  def create_sequence_a023718(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023718/2)
  end

  @doc offset: 1
  def seq_a023718(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [3], base: 4) == 1
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A023719` - Numbers with exactly two 3's in base 4 expansion.

  From [OEIS A023719](https://oeis.org/A023719):

  > Numbers with exactly two 3's in base 4 expansion.
  > (Formerly )

  **Sequence IDs**: `:a023719`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023719) |> Sequence.take!(54)
      [15,31,47,51,55,59,60,61,62,79,95,111,115,119,123,124,125,126,143,159,175,179,183,187,188,189,190,195,199,203,204,205,206,211,215,219,220,221,222,227,231,235,236,237,238,240,241,242,244,245,246,248,249,250]


  """
  @doc offset: 1,
       sequence: "Numbers with exactly two 3's in base 4 expansion.",
       references: [{:oeis, :a023719, "https://oeis.org/A023719"}]
  def create_sequence_a023719(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023719/2)
  end

  @doc offset: 1
  def seq_a023719(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [3], base: 4) == 2
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A023720` - Numbers with exactly 3 3's in base 4 expansion.

  From [OEIS A023720](https://oeis.org/A023720):

  > Numbers with exactly 3 3's in base 4 expansion.
  > (Formerly )

  **Sequence IDs**: `:a023720`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023720) |> Sequence.take!(45)
      [63,127,191,207,223,239,243,247,251,252,253,254,319,383,447,463,479,495,499,503,507,508,509,510,575,639,703,719,735,751,755,759,763,764,765,766,783,799,815,819,823,827,828,829,830]


  """
  @doc offset: 1,
       sequence: "Numbers with exactly 3 3's in base 4 expansion.",
       references: [{:oeis, :a023720, "https://oeis.org/A023720"}]
  def create_sequence_a023720(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023720/2)
  end

  @doc offset: 1
  def seq_a023720(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [3], base: 4) == 3
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A023721` - Numbers with no 0's in their base-5 expansion.

  From [OEIS A023721](https://oeis.org/A023721):

  > Numbers with no 0's in their base-5 expansion.
  > (Formerly )

  **Sequence IDs**: `:a023721`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023721) |> Sequence.take!(63)
      [1,2,3,4,6,7,8,9,11,12,13,14,16,17,18,19,21,22,23,24,31,32,33,34,36,37,38,39,41,42,43,44,46,47,48,49,56,57,58,59,61,62,63,64,66,67,68,69,71,72,73,74,81,82,83,84,86,87,88,89,91,92,93]


  """
  @doc offset: 1,
       sequence: "Numbers with no 0's in their base-5 expansion.",
       references: [{:oeis, :a023721, "https://oeis.org/A023721"}]
  def create_sequence_a023721(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023721/2)
  end

  @doc offset: 1
  def seq_a023721(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [0], base: 5) == 0
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A023722` - Numbers with a single 0 in their base 5 expansion.

  From [OEIS A023722](https://oeis.org/A023722):

  > Numbers with a single 0 in their base 5 expansion.
  > (Formerly )

  **Sequence IDs**: `:a023722`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023722) |> Sequence.take!(53)
      [0,5,10,15,20,26,27,28,29,30,35,40,45,51,52,53,54,55,60,65,70,76,77,78,79,80,85,90,95,101,102,103,104,105,110,115,120,131,132,133,134,136,137,138,139,141,142,143,144,146,147,148,149]


  """
  @doc offset: 1,
       sequence: "Numbers with a single 0 in their base 5 expansion.",
       references: [{:oeis, :a023722, "https://oeis.org/A023722"}]
  def create_sequence_a023722(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023722/2)
  end

  @doc offset: 1, fill_value: -1
  def seq_a023722(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [0], base: 5) == 1
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A023723` - Numbers with exactly 2 0's in base 5 expansion.

  From [OEIS A023723](https://oeis.org/A023723):

  > Numbers with exactly 2 0's in base 5 expansion.
  > (Formerly )

  **Sequence IDs**: `:a023723`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023723) |> Sequence.take!(46)
      [25,50,75,100,126,127,128,129,130,135,140,145,150,175,200,225,251,252,253,254,255,260,265,270,275,300,325,350,376,377,378,379,380,385,390,395,400,425,450,475,501,502,503,504,505,510]


  """
  @doc offset: 1,
       sequence: "Numbers with exactly 2 0's in base 5 expansion.",
       references: [{:oeis, :a023723, "https://oeis.org/A023723"}]
  def create_sequence_a023723(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023723/2)
  end

  @doc offset: 1
  def seq_a023723(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [0], base: 5) == 2
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A023724` - Numbers with exactly 3 0's in base 5 expansion.

  From [OEIS A023724](https://oeis.org/A023724):

  > Numbers with exactly 3 0's in base 5 expansion.
  > (Formerly )

  **Sequence IDs**: `:a023724`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023724) |> Sequence.take!(39)
      [125,250,375,500,626,627,628,629,630,635,640,645,650,675,700,725,750,875,1000,1125,1251,1252,1253,1254,1255,1260,1265,1270,1275,1300,1325,1350,1375,1500,1625,1750,1876,1877,1878]


  """
  @doc offset: 1,
       sequence: "Numbers with exactly 3 0's in base 5 expansion.",
       references: [{:oeis, :a023724, "https://oeis.org/A023724"}]
  def create_sequence_a023724(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023724/2)
  end

  @doc offset: 1
  def seq_a023724(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [0], base: 5) == 3
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A023725` - Numbers with no 1's in their base-5 expansion.

  From [OEIS A023725](https://oeis.org/A023725):

  > Numbers with no 1's in their base-5 expansion.
  > (Formerly )

  **Sequence IDs**: `:a023725`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023725) |> Sequence.take!(61)
      [0,2,3,4,10,12,13,14,15,17,18,19,20,22,23,24,50,52,53,54,60,62,63,64,65,67,68,69,70,72,73,74,75,77,78,79,85,87,88,89,90,92,93,94,95,97,98,99,100,102,103,104,110,112,113,114,115,117,118,119,120]


  """
  @doc offset: 1,
       sequence: "Numbers with no 1's in their base-5 expansion.",
       references: [{:oeis, :a023725, "https://oeis.org/A023725"}]
  def create_sequence_a023725(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023725/2)
  end

  @doc offset: 1, fill_value: -1
  def seq_a023725(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [1], base: 5) == 0
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A023726` - Numbers with a single 1 in their base 5 expansion.

  From [OEIS A023726](https://oeis.org/A023726):

  > Numbers with a single 1 in their base 5 expansion.
  > (Formerly )

  **Sequence IDs**: `:a023726`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023726) |> Sequence.take!(56)
      [1,5,7,8,9,11,16,21,25,27,28,29,35,37,38,39,40,42,43,44,45,47,48,49,51,55,57,58,59,61,66,71,76,80,82,83,84,86,91,96,101,105,107,108,109,111,116,121,125,127,128,129,135,137,138,139]


  """
  @doc offset: 1,
       sequence: "Numbers with a single 1 in their base 5 expansion.",
       references: [{:oeis, :a023726, "https://oeis.org/A023726"}]
  def create_sequence_a023726(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023726/2)
  end

  @doc offset: 1
  def seq_a023726(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [1], base: 5) == 1
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A023727` - Numbers with exactly 2 1's in their base 5 expansion.

  From [OEIS A023727](https://oeis.org/A023727):

  > Numbers with exactly 2 1's in their base 5 expansion.
  > (Formerly ) 

  **Sequence IDs**: `:a023727`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023727) |> Sequence.take!(48)
      [6,26,30,32,33,34,36,41,46,56,81,106,126,130,132,133,134,136,141,146,150,152,153,154,160,162,163,164,165,167,168,169,170,172,173,174,176,180,182,183,184,186,191,196,201,205,207,208]


  """
  @doc offset: 1,
       sequence: "Numbers with exactly 2 1's in their base 5 expansion.",
       references: [{:oeis, :a023727, "https://oeis.org/A023727"}]
  def create_sequence_a023727(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023727/2)
  end

  @doc offset: 1
  def seq_a023727(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [1], base: 5) == 2
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A023728` - Numbers with exactly 3 1's in base 5 expansion.

  From [OEIS A023728](https://oeis.org/A023728):

  > Numbers with exactly 3 1's in base 5 expansion.
  > (Formerly )

  **Sequence IDs**: `:a023728`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023728) |> Sequence.take!(45)
      [31,131,151,155,157,158,159,161,166,171,181,206,231,281,406,531,631,651,655,657,658,659,661,666,671,681,706,731,751,755,757,758,759,761,766,771,775,777,778,779,785,787,788,789,790]


  """
  @doc offset: 1,
       sequence: "Numbers with exactly 3 1's in base 5 expansion.",
       references: [{:oeis, :a023728, "https://oeis.org/A023728"}]
  def create_sequence_a023728(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023728/2)
  end

  @doc offset: 1
  def seq_a023728(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [1], base: 5) == 3
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A023729` - Numbers with no 2's in their base-5 expansion.

  From [OEIS A023729](https://oeis.org/A023729):

  > Numbers with no 2's in their base-5 expansion.
  > (Formerly )

  **Sequence IDs**: `:a023729`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023729) |> Sequence.take!(62)
      [0,1,3,4,5,6,8,9,15,16,18,19,20,21,23,24,25,26,28,29,30,31,33,34,40,41,43,44,45,46,48,49,75,76,78,79,80,81,83,84,90,91,93,94,95,96,98,99,100,101,103,104,105,106,108,109,115,116,118,119,120,121]


  """
  @doc offset: 1,
       sequence: "Numbers with no 2's in their base-5 expansion.",
       references: [{:oeis, :a023729, "https://oeis.org/A023729"}]
  def create_sequence_a023729(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023729/2)
  end

  @doc offset: 1, fill_value: -1
  def seq_a023729(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [2], base: 5) == 0
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A023730` - Numbers with a single 2 in their base 5 expansion.

  From [OEIS A023730](https://oeis.org/A023730):

  > Numbers with a single 2 in their base 5 expansion.
  > (Formerly )

  **Sequence IDs**: `:a023730`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023730) |> Sequence.take!(56)
      [2,7,10,11,13,14,17,22,27,32,35,36,38,39,42,47,50,51,53,54,55,56,58,59,65,66,68,69,70,71,73,74,77,82,85,86,88,89,92,97,102,107,110,111,113,114,117,122,127,132,135,136,138,139,142,147]


  """
  @doc offset: 1,
       sequence: "Numbers with a single 2 in their base 5 expansion.",
       references: [{:oeis, :a023730, "https://oeis.org/A023730"}]
  def create_sequence_a023730(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023730/2)
  end

  @doc offset: 1
  def seq_a023730(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [2], base: 5) == 1
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A023731` - Numbers with exactly two 2's in base 5 expansion.

  From [OEIS A023731](https://oeis.org/A023731):

  > Numbers with exactly two 2's in base 5 expansion.
  > (Formerly )

  **Sequence IDs**: `:a023731`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023731) |> Sequence.take!(48)
      [12,37,52,57,60,61,63,64,67,72,87,112,137,162,177,182,185,186,188,189,192,197,212,237,252,257,260,261,263,264,267,272,277,282,285,286,288,289,292,297,300,301,303,304,305,306,308,309]


  """
  @doc offset: 1,
       sequence: "Numbers with exactly two 2's in base 5 expansion.",
       references: [{:oeis, :a023731, "https://oeis.org/A023731"}]
  def create_sequence_a023731(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023731/2)
  end

  @doc offset: 1
  def seq_a023731(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [2], base: 5) == 2
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A023732` - Numbers with exactly 3 2's in base 5 expansion.

  From [OEIS A023732](https://oeis.org/A023732):

  > Numbers with exactly 3 2's in base 5 expansion.
  > (Formerly )

  **Sequence IDs**: `:a023732`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023732) |> Sequence.take!(42)
      [62,187,262,287,302,307,310,311,313,314,317,322,337,362,437,562,687,812,887,912,927,932,935,936,938,939,942,947,962,987,1062,1187,1262,1287,1302,1307,1310,1311,1313,1314,1317,1322]


  """
  @doc offset: 1,
       sequence: "Numbers with exactly 3 2's in base 5 expansion.",
       references: [{:oeis, :a023732, "https://oeis.org/A023732"}]
  def create_sequence_a023732(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023732/2)
  end

  @doc offset: 1
  def seq_a023732(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [2], base: 5) == 3
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A023733` - Numbers with no 3's in base-5 expansion.

  From [OEIS A023733](https://oeis.org/A023733):

  > Numbers with no 3's in base-5 expansion.
  > (Formerly )

  **Sequence IDs**: `:a023733`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023733) |> Sequence.take!(60)
      [0,1,2,4,5,6,7,9,10,11,12,14,20,21,22,24,25,26,27,29,30,31,32,34,35,36,37,39,45,46,47,49,50,51,52,54,55,56,57,59,60,61,62,64,70,71,72,74,100,101,102,104,105,106,107,109,110,111,112,114]


  """
  @doc offset: 1,
       sequence: "Numbers with no 3's in base-5 expansion.",
       references: [{:oeis, :a023733, "https://oeis.org/A023733"}]
  def create_sequence_a023733(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023733/2)
  end

  @doc offset: 1, fill_value: -1
  def seq_a023733(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [3], base: 5) == 0
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A023734` - Numbers with a single 3 in their base-5 expansion.

  From [OEIS A023734](https://oeis.org/A023734):

  > Numbers with a single 3 in their base-5 expansion.
  > (Formerly )

  **Sequence IDs**: `:a023734`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023734) |> Sequence.take!(58)
      [3,8,13,15,16,17,19,23,28,33,38,40,41,42,44,48,53,58,63,65,66,67,69,73,75,76,77,79,80,81,82,84,85,86,87,89,95,96,97,99,103,108,113,115,116,117,119,123,128,133,138,140,141,142,144,148,153,158]


  """
  @doc offset: 1,
       sequence: "Numbers with a single 3 in their base-5 expansion.",
       references: [{:oeis, :a023734, "https://oeis.org/A023734"}]
  def create_sequence_a023734(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023734/2)
  end

  @doc offset: 1
  def seq_a023734(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [3], base: 5) == 1
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A023735` - Numbers with exactly 2 3's in their base-5 expansion.

  From [OEIS A023735](https://oeis.org/A023735):

  > Numbers with exactly 2 3's in their base-5 expansion.
  > (Formerly ) 

  **Sequence IDs**: `:a023735`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023735) |> Sequence.take!(52)
      [18,43,68,78,83,88,90,91,92,94,98,118,143,168,193,203,208,213,215,216,217,219,223,243,268,293,318,328,333,338,340,341,342,344,348,368,378,383,388,390,391,392,394,398,403,408,413,415,416,417,419,423]


  """
  @doc offset: 1,
       sequence: "Numbers with exactly 2 3's in their base-5 expansion.",
       references: [{:oeis, :a023735, "https://oeis.org/A023735"}]
  def create_sequence_a023735(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023735/2)
  end

  @doc offset: 1
  def seq_a023735(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [3], base: 5) == 2
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A023736` - Numbers with exactly 3 3's in their base-5 expansion.

  From [OEIS A023736](https://oeis.org/A023736):

  > Numbers with exactly 3 3's in their base-5 expansion.
  > (Formerly ) 

  **Sequence IDs**: `:a023736`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023736) |> Sequence.take!(40)
      [93,218,343,393,418,443,453,458,463,465,466,467,469,473,493,593,718,843,968,1018,1043,1068,1078,1083,1088,1090,1091,1092,1094,1098,1118,1218,1343,1468,1593,1643,1668,1693,1703,1708]


  """
  @doc offset: 1,
       sequence: "Numbers with exactly 3 3's in their base-5 expansion.",
       references: [{:oeis, :a023736, "https://oeis.org/A023736"}]
  def create_sequence_a023736(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023736/2)
  end

  @doc offset: 1
  def seq_a023736(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [3], base: 5) == 3
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A023738` - Numbers with a single 4 in their base 5 expansion.

  From [OEIS A023738](https://oeis.org/A023738):

  > Numbers with a single 4 in their base 5 expansion.
  > (Formerly )

  **Sequence IDs**: `:a023738`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023738) |> Sequence.take!(54)
      [4,9,14,19,20,21,22,23,29,34,39,44,45,46,47,48,54,59,64,69,70,71,72,73,79,84,89,94,95,96,97,98,100,101,102,103,105,106,107,108,110,111,112,113,115,116,117,118,129,134,139,144,145,146]


  """
  @doc offset: 1,
       sequence: "Numbers with a single 4 in their base 5 expansion.",
       references: [{:oeis, :a023738, "https://oeis.org/A023738"}]
  def create_sequence_a023738(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023738/2)
  end

  @doc offset: 1
  def seq_a023738(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [4], base: 5) == 1
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A023739` - Numbers with exactly 2 4's in base 5 expansion.

  From [OEIS A023739](https://oeis.org/A023739):

  > Numbers with exactly 2 4's in base 5 expansion.
  > (Formerly )

  **Sequence IDs**: `:a023739`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023739) |> Sequence.take!(46)
      [24,49,74,99,104,109,114,119,120,121,122,123,149,174,199,224,229,234,239,244,245,246,247,248,274,299,324,349,354,359,364,369,370,371,372,373,399,424,449,474,479,484,489,494,495,496]


  """
  @doc offset: 1,
       sequence: "Numbers with exactly 2 4's in base 5 expansion.",
       references: [{:oeis, :a023739, "https://oeis.org/A023739"}]
  def create_sequence_a023739(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023739/2)
  end

  @doc offset: 1
  def seq_a023739(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [4], base: 5) == 2
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A023740` - Numbers with exactly 3 4's in base 5 expansion.

  From [OEIS A023740](https://oeis.org/A023740):

  > Numbers with exactly 3 4's in base 5 expansion.
  > (Formerly )

  **Sequence IDs**: `:a023740`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023740) |> Sequence.take!(40)
      [124,249,374,499,524,549,574,599,604,609,614,619,620,621,622,623,749,874,999,1124,1149,1174,1199,1224,1229,1234,1239,1244,1245,1246,1247,1248,1374,1499,1624,1749,1774,1799,1824,1849]


  """
  @doc offset: 1,
       sequence: "Numbers with exactly 3 4's in base 5 expansion.",
       references: [{:oeis, :a023740, "https://oeis.org/A023740"}]
  def create_sequence_a023740(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023740/2)
  end

  @doc offset: 1
  def seq_a023740(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [4], base: 5) == 3
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A023745` - Plaindromes: numbers whose digits in base 3 are in nondecreasing order.

  From [OEIS A023745](https://oeis.org/A023745):

  > Plaindromes: numbers whose digits in base 3 are in nondecreasing order.
  > (Formerly )

  **Sequence IDs**: `:a023745`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023745) |> Sequence.take!(49)
      [0,1,2,4,5,8,13,14,17,26,40,41,44,53,80,121,122,125,134,161,242,364,365,368,377,404,485,728,1093,1094,1097,1106,1133,1214,1457,2186,3280,3281,3284,3293,3320,3401,3644,4373,6560,9841,9842,9845,9854]


  """
  @doc offset: 1,
       sequence: "Plaindromes: numbers whose digits in base 3 are in nondecreasing order.",
       references: [{:oeis, :a023745, "https://oeis.org/A023745"}]
  def create_sequence_a023745(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023745/2)
  end

  @doc offset: 1, fill_value: -1
  def seq_a023745(_idx, last) do
    Math.next_number(fn v -> Math.is_plaindrome_in_base?(v, 3) end, last)
  end

  @doc """
  OEIS Sequence `A023746` - Plaindromes: numbers whose digits in base 4 are in nondecreasing order.

  From [OEIS A023746](https://oeis.org/A023746):

  > Plaindromes: numbers whose digits in base 4 are in nondecreasing order.
  > (Formerly )

  **Sequence IDs**: `:a023746`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023746) |> Sequence.take!(58)
      [0,1,2,3,5,6,7,10,11,15,21,22,23,26,27,31,42,43,47,63,85,86,87,90,91,95,106,107,111,127,170,171,175,191,255,341,342,343,346,347,351,362,363,367,383,426,427,431,447,511,682,683,687,703,767,1023,1365,1366]


  """
  @doc offset: 1,
       sequence: "Plaindromes: numbers whose digits in base 4 are in nondecreasing order.",
       references: [{:oeis, :a023746, "https://oeis.org/A023746"}]
  def create_sequence_a023746(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023746/2)
  end

  @doc offset: 1, fill_value: -1
  def seq_a023746(_idx, last) do
    Math.next_number(fn v -> Math.is_plaindrome_in_base?(v, 4) end, last)
  end

  @doc """
  OEIS Sequence `A023747` - Plaindromes: numbers whose digits in base 5 are in nondecreasing order.

  From [OEIS A023747](https://oeis.org/A023747):

  > Plaindromes: numbers whose digits in base 5 are in nondecreasing order.
  > (Formerly )

  **Sequence IDs**: `:a023747`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023747) |> Sequence.take!(60)
      [0,1,2,3,4,6,7,8,9,12,13,14,18,19,24,31,32,33,34,37,38,39,43,44,49,62,63,64,68,69,74,93,94,99,124,156,157,158,159,162,163,164,168,169,174,187,188,189,193,194,199,218,219,224,249,312,313,314,318,319]


  """
  @doc offset: 1,
       sequence: "Plaindromes: numbers whose digits in base 5 are in nondecreasing order.",
       references: [{:oeis, :a023747, "https://oeis.org/A023747"}]
  def create_sequence_a023747(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023747/2)
  end

  @doc offset: 1, fill_value: -1
  def seq_a023747(_idx, last) do
    Math.next_number(fn v -> Math.is_plaindrome_in_base?(v, 5) end, last)
  end

  @doc """
  OEIS Sequence `A023748` - Plaindromes: numbers whose digits in base 6 are in nondecreasing order.

  From [OEIS A023748](https://oeis.org/A023748):

  > Plaindromes: numbers whose digits in base 6 are in nondecreasing order.
  > (Formerly )

  **Sequence IDs**: `:a023748`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023748) |> Sequence.take!(63)
      [0,1,2,3,4,5,7,8,9,10,11,14,15,16,17,21,22,23,28,29,35,43,44,45,46,47,50,51,52,53,57,58,59,64,65,71,86,87,88,89,93,94,95,100,101,107,129,130,131,136,137,143,172,173,179,215,259,260,261,262,263,266,267]


  """
  @doc offset: 1,
       sequence: "Plaindromes: numbers whose digits in base 6 are in nondecreasing order.",
       references: [{:oeis, :a023748, "https://oeis.org/A023748"}]
  def create_sequence_a023748(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023748/2)
  end

  @doc offset: 1, fill_value: -1
  def seq_a023748(_idx, last) do
    Math.next_number(fn v -> Math.is_plaindrome_in_base?(v, 6) end, last)
  end

  @doc """
  OEIS Sequence `A023749` - Plaindromes: numbers whose digits in base 7 are in nondecreasing order.

  From [OEIS A023749](https://oeis.org/A023749):

  > Plaindromes: numbers whose digits in base 7 are in nondecreasing order.
  > (Formerly )

  **Sequence IDs**: `:a023749`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023749) |> Sequence.take!(65)
      [0,1,2,3,4,5,6,8,9,10,11,12,13,16,17,18,19,20,24,25,26,27,32,33,34,40,41,48,57,58,59,60,61,62,65,66,67,68,69,73,74,75,76,81,82,83,89,90,97,114,115,116,117,118,122,123,124,125,130,131,132,138,139,146,171]


  """
  @doc offset: 1,
       sequence: "Plaindromes: numbers whose digits in base 7 are in nondecreasing order.",
       references: [{:oeis, :a023749, "https://oeis.org/A023749"}]
  def create_sequence_a023749(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023749/2)
  end

  @doc offset: 1, fill_value: -1
  def seq_a023749(_idx, last) do
    Math.next_number(fn v -> Math.is_plaindrome_in_base?(v, 7) end, last)
  end

  @doc """
  OEIS Sequence `A023750` - Plaindromes: numbers whose digits in base 8 are in nondecreasing order.

  From [OEIS A023750](https://oeis.org/A023750):

  > Plaindromes: numbers whose digits in base 8 are in nondecreasing order.
  > (Formerly )

  **Sequence IDs**: `:a023750`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023750) |> Sequence.take!(66)
      [0,1,2,3,4,5,6,7,9,10,11,12,13,14,15,18,19,20,21,22,23,27,28,29,30,31,36,37,38,39,45,46,47,54,55,63,73,74,75,76,77,78,79,82,83,84,85,86,87,91,92,93,94,95,100,101,102,103,109,110,111,118,119,127,146,147]


  """
  @doc offset: 1,
       sequence: "Plaindromes: numbers whose digits in base 8 are in nondecreasing order.",
       references: [{:oeis, :a023750, "https://oeis.org/A023750"}]
  def create_sequence_a023750(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023750/2)
  end

  @doc offset: 1, fill_value: -1
  def seq_a023750(_idx, last) do
    Math.next_number(fn v -> Math.is_plaindrome_in_base?(v, 8) end, last)
  end

  @doc """
  OEIS Sequence `A023751` - Plaindromes: numbers whose digits in base 9 are in nondecreasing order.

  From [OEIS A023751](https://oeis.org/A023751):

  > Plaindromes: numbers whose digits in base 9 are in nondecreasing order.
  > (Formerly )

  **Sequence IDs**: `:a023751`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023751) |> Sequence.take!(66)
      [0,1,2,3,4,5,6,7,8,10,11,12,13,14,15,16,17,20,21,22,23,24,25,26,30,31,32,33,34,35,40,41,42,43,44,50,51,52,53,60,61,62,70,71,80,91,92,93,94,95,96,97,98,101,102,103,104,105,106,107,111,112,113,114,115,116]


  """
  @doc offset: 1,
       sequence: "Plaindromes: numbers whose digits in base 9 are in nondecreasing order.",
       references: [{:oeis, :a023751, "https://oeis.org/A023751"}]
  def create_sequence_a023751(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023751/2)
  end

  @doc offset: 1, fill_value: -1
  def seq_a023751(_idx, last) do
    Math.next_number(fn v -> Math.is_plaindrome_in_base?(v, 9) end, last)
  end

  @doc """
  OEIS Sequence `A023752` - Plaindromes: numbers whose digits in base 11 are in nondecreasing order.

  From [OEIS A023752](https://oeis.org/A023752):

  > Plaindromes: numbers whose digits in base 11 are in nondecreasing order.
  > (Formerly )

  **Sequence IDs**: `:a023752`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023752) |> Sequence.take!(66)
      [0,1,2,3,4,5,6,7,8,9,10,12,13,14,15,16,17,18,19,20,21,24,25,26,27,28,29,30,31,32,36,37,38,39,40,41,42,43,48,49,50,51,52,53,54,60,61,62,63,64,65,72,73,74,75,76,84,85,86,87,96,97,98,108,109,120]


  """
  @doc offset: 1,
       sequence: "Plaindromes: numbers whose digits in base 11 are in nondecreasing order.",
       references: [{:oeis, :a023752, "https://oeis.org/A023752"}]
  def create_sequence_a023752(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023752/2)
  end

  @doc offset: 1, fill_value: -1
  def seq_a023752(_idx, last) do
    Math.next_number(fn v -> Math.is_plaindrome_in_base?(v, 11) end, last)
  end

  @doc """
  OEIS Sequence `A023753` - Plaindromes: numbers whose digits in base 12 are in nondecreasing order.

  From [OEIS A023753](https://oeis.org/A023753):

  > Plaindromes: numbers whose digits in base 12 are in nondecreasing order.
  > (Formerly )

  **Sequence IDs**: `:a023753`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023753) |> Sequence.take!(69)
      [0,1,2,3,4,5,6,7,8,9,10,11,13,14,15,16,17,18,19,20,21,22,23,26,27,28,29,30,31,32,33,34,35,39,40,41,42,43,44,45,46,47,52,53,54,55,56,57,58,59,65,66,67,68,69,70,71,78,79,80,81,82,83,91,92,93,94,95,104]


  """
  @doc offset: 1,
       sequence: "Plaindromes: numbers whose digits in base 12 are in nondecreasing order.",
       references: [{:oeis, :a023753, "https://oeis.org/A023753"}]
  def create_sequence_a023753(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023753/2)
  end

  @doc offset: 1, fill_value: -1
  def seq_a023753(_idx, last) do
    Math.next_number(fn v -> Math.is_plaindrome_in_base?(v, 12) end, last)
  end

  @doc """
  OEIS Sequence `A023754` - Plaindromes: numbers whose digits in base 13 are in nondecreasing order.

  From [OEIS A023754](https://oeis.org/A023754):

  > Plaindromes: numbers whose digits in base 13 are in nondecreasing order.
  > (Formerly )

  **Sequence IDs**: `:a023754`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023754) |> Sequence.take!(70)
      [0,1,2,3,4,5,6,7,8,9,10,11,12,14,15,16,17,18,19,20,21,22,23,24,25,28,29,30,31,32,33,34,35,36,37,38,42,43,44,45,46,47,48,49,50,51,56,57,58,59,60,61,62,63,64,70,71,72,73,74,75,76,77,84,85,86,87,88,89,90]


  """
  @doc offset: 1,
       sequence: "Plaindromes: numbers whose digits in base 13 are in nondecreasing order.",
       references: [{:oeis, :a023754, "https://oeis.org/A023754"}]
  def create_sequence_a023754(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023754/2)
  end

  @doc offset: 1, fill_value: -1
  def seq_a023754(_idx, last) do
    Math.next_number(fn v -> Math.is_plaindrome_in_base?(v, 13) end, last)
  end

  @doc """
  OEIS Sequence `A023755` - Plaindromes: numbers whose digits in base 14 are in nondecreasing order.

  From [OEIS A023755](https://oeis.org/A023755):

  > Plaindromes: numbers whose digits in base 14 are in nondecreasing order.
  > (Formerly )

  **Sequence IDs**: `:a023755`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023755) |> Sequence.take!(70)
      [0,1,2,3,4,5,6,7,8,9,10,11,12,13,15,16,17,18,19,20,21,22,23,24,25,26,27,30,31,32,33,34,35,36,37,38,39,40,41,45,46,47,48,49,50,51,52,53,54,55,60,61,62,63,64,65,66,67,68,69,75,76,77,78,79,80,81,82,83,90]


  """
  @doc offset: 1,
       sequence: "Plaindromes: numbers whose digits in base 14 are in nondecreasing order.",
       references: [{:oeis, :a023755, "https://oeis.org/A023755"}]
  def create_sequence_a023755(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023755/2)
  end

  @doc offset: 1, fill_value: -1
  def seq_a023755(_idx, last) do
    Math.next_number(fn v -> Math.is_plaindrome_in_base?(v, 14) end, last)
  end

  @doc """
  OEIS Sequence `A023756` - Plaindromes: numbers whose digits in base 15 are in nondecreasing order.

  From [OEIS A023756](https://oeis.org/A023756):

  > Plaindromes: numbers whose digits in base 15 are in nondecreasing order.
  > (Formerly )

  **Sequence IDs**: `:a023756`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023756) |> Sequence.take!(70)
      [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,16,17,18,19,20,21,22,23,24,25,26,27,28,29,32,33,34,35,36,37,38,39,40,41,42,43,44,48,49,50,51,52,53,54,55,56,57,58,59,64,65,66,67,68,69,70,71,72,73,74,80,81,82,83,84]


  """
  @doc offset: 1,
       sequence: "Plaindromes: numbers whose digits in base 15 are in nondecreasing order.",
       references: [{:oeis, :a023756, "https://oeis.org/A023756"}]
  def create_sequence_a023756(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023756/2)
  end

  @doc offset: 1, fill_value: -1
  def seq_a023756(_idx, last) do
    Math.next_number(fn v -> Math.is_plaindrome_in_base?(v, 15) end, last)
  end

  @doc """
  OEIS Sequence `A023757` - Plaindromes: numbers whose digits in base 16 are in nondecreasing order.

  From [OEIS A023757](https://oeis.org/A023757):

  > Plaindromes: numbers whose digits in base 16 are in nondecreasing order.
  > (Formerly )

  **Sequence IDs**: `:a023757`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023757) |> Sequence.take!(70)
      [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,34,35,36,37,38,39,40,41,42,43,44,45,46,47,51,52,53,54,55,56,57,58,59,60,61,62,63,68,69,70,71,72,73,74,75,76,77,78,79]


  """
  @doc offset: 1,
       sequence: "Plaindromes: numbers whose digits in base 16 are in nondecreasing order.",
       references: [{:oeis, :a023757, "https://oeis.org/A023757"}]
  def create_sequence_a023757(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023757/2)
  end

  @doc offset: 1, fill_value: -1
  def seq_a023757(_idx, last) do
    Math.next_number(fn v -> Math.is_plaindrome_in_base?(v, 16) end, last)
  end

  @doc """
  OEIS Sequence `A023697` - Numbers with exactly 6 1's in ternary expansion.

  From [OEIS A023697](https://oeis.org/A023697):

  > Numbers with exactly 6 1's in ternary expansion.
  > (Formerly )

  **Sequence IDs**: `:a023697`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a023697) |> Sequence.take!(36)
      [364,850,1012,1066,1084,1090,1092,1094,1096,1102,1120,1174,1336,1822,2308,2470,2524,2542,2548,2550,2552,2554,2560,2578,2632,2794,2956,3010,3028,3034,3036,3038,3040,3046,3064,3118]


  """
  @doc offset: 1,
       sequence: "Numbers with exactly 6 1's in ternary expansion.",
       references: [{:oeis, :a023697, "https://oeis.org/A023697"}]
  def create_sequence_a023697(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a023697/2)
  end

  @doc offset: 1
  def seq_a023697(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [1], base: 3) == 6
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A043321` - Numbers n such that number of 0's in base 3 is 1.

  From [OEIS A043321](https://oeis.org/A043321):

  > Numbers n such that number of 0's in base 3 is 1.
  > (Formerly )

  **Sequence IDs**: `:a043321`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a043321) |> Sequence.take!(56)
      [3,6,10,11,12,15,19,20,21,24,31,32,34,35,37,38,39,42,46,47,48,51,58,59,61,62,64,65,66,69,73,74,75,78,94,95,97,98,103,104,106,107,112,113,115,116,118,119,120,123,127,128,129,132,139,140]


  """
  @doc offset: 1,
       sequence: "Numbers n such that number of 0's in base 3 is 1.",
       references: [{:oeis, :a043321, "https://oeis.org/A043321"}]
  def create_sequence_a043321(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a043321/2)
  end

  @doc offset: 1
  def seq_a043321(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [0], base: 3) == 1
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A059015` - Total number of 0's in binary expansions of 0, ..., n.

  From [OEIS A059015](https://oeis.org/A059015):

  > Total number of 0's in binary expansions of 0, ..., n.
  > (Formerly )

  **Sequence IDs**: `:a059015`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a059015) |> Sequence.take!(66)
      [1,1,2,2,4,5,6,6,9,11,13,14,16,17,18,18,22,25,28,30,33,35,37,38,41,43,45,46,48,49,50,50,55,59,63,66,70,73,76,78,82,85,88,90,93,95,97,98,102,105,108,110,113,115,117,118,121,123,125,126,128,129,130,130,136,141]


  """
  @doc offset: 0,
       sequence: "Total number of 0's in binary expansions of 0, ..., n.",
       references: [{:oeis, :a059015, "https://oeis.org/A059015"}]
  def create_sequence_a059015(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a059015/1)
  end

  @doc offset: 0
  def seq_a059015(idx) do
    0..idx
    |> Enum.map(fn d -> Math.digit_count(d, [0], base: 2) end)
    |> Enum.sum()
  end

  @doc """
  OEIS Sequence `A062756` - Number of 1's in ternary (base 3) expansion of n.

  From [OEIS A062756](https://oeis.org/A062756):

  > Number of 1's in ternary (base 3) expansion of n.
  > (Formerly )

  **Sequence IDs**: `:a062756`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a062756) |> Sequence.take!(105)
      [0,1,0,1,2,1,0,1,0,1,2,1,2,3,2,1,2,1,0,1,0,1,2,1,0,1,0,1,2,1,2,3,2,1,2,1,2,3,2,3,4,3,2,3,2,1,2,1,2,3,2,1,2,1,0,1,0,1,2,1,0,1,0,1,2,1,2,3,2,1,2,1,0,1,0,1,2,1,0,1,0,1,2,1,2,3,2,1,2,1,2,3,2,3,4,3,2,3,2,1,2,1,2,3,2]


  """
  @doc offset: 0,
       sequence: "Number of 1's in ternary (base 3) expansion of n.",
       references: [{:oeis, :a062756, "https://oeis.org/A062756"}]
  def create_sequence_a062756(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a062756/1)
  end

  @doc offset: 0
  def seq_a062756(idx) do
    Math.digit_count(idx, [1], base: 3)
  end

  @doc """
  OEIS Sequence `A074940` - Numbers having at least one 2 in their ternary representation.

  From [OEIS A074940](https://oeis.org/A074940):

  > Numbers having at least one 2 in their ternary representation.
  > (Formerly )

  **Sequence IDs**: `:a074940`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a074940) |> Sequence.take!(71)
      [2,5,6,7,8,11,14,15,16,17,18,19,20,21,22,23,24,25,26,29,32,33,34,35,38,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,83,86,87,88,89,92]


  """
  @doc offset: 1,
       sequence: "Numbers having at least one 2 in their ternary representation.",
       references: [{:oeis, :a074940, "https://oeis.org/A074940"}]
  def create_sequence_a074940(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a074940/2)
  end

  @doc offset: 1
  def seq_a074940(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [2], base: 3) >= 1
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A077267` - Number of zeros in base 3 expansion of n.

  From [OEIS A077267](https://oeis.org/A077267):

  > Number of zeros in base 3 expansion of n.
  > (Formerly )

  **Sequence IDs**: `:a077267`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a077267) |> Sequence.take!(106)
      [1,0,0,1,0,0,1,0,0,2,1,1,1,0,0,1,0,0,2,1,1,1,0,0,1,0,0,3,2,2,2,1,1,2,1,1,2,1,1,1,0,0,1,0,0,2,1,1,1,0,0,1,0,0,3,2,2,2,1,1,2,1,1,2,1,1,1,0,0,1,0,0,2,1,1,1,0,0,1,0,0,4,3,3,3,2,2,3,2,2,3,2,2,2,1,1,2,1,1,3,2,2,2,1,1,2]


  """
  @doc offset: 0,
       sequence: "Number of zeros in base 3 expansion of n.",
       references: [{:oeis, :a077267, "https://oeis.org/A077267"}]
  def create_sequence_a077267(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a077267/1)
  end

  @doc offset: 0
  def seq_a077267(idx) do
    Math.digit_count(idx, [0], base: 3)
  end

  @doc """
  OEIS Sequence `A081603` - Number of 2's in ternary representation of n.

  From [OEIS A081603](https://oeis.org/A081603):

  > Number of 2's in ternary representation of n.
  > (Formerly )

  **Sequence IDs**: `:a081603`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a081603) |> Sequence.take!(105)
      [0,0,1,0,0,1,1,1,2,0,0,1,0,0,1,1,1,2,1,1,2,1,1,2,2,2,3,0,0,1,0,0,1,1,1,2,0,0,1,0,0,1,1,1,2,1,1,2,1,1,2,2,2,3,1,1,2,1,1,2,2,2,3,1,1,2,1,1,2,2,2,3,2,2,3,2,2,3,3,3,4,0,0,1,0,0,1,1,1,2,0,0,1,0,0,1,1,1,2,1,1,2,1,1,2]


  """
  @doc offset: 0,
       sequence: "Number of 2's in ternary representation of n.",
       references: [{:oeis, :a081603, "https://oeis.org/A081603"}]
  def create_sequence_a081603(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a081603/1)
  end

  @doc offset: 0
  def seq_a081603(idx) do
    Math.digit_count(idx, [2], base: 3)
  end

  @doc """
  OEIS Sequence `A081605` - Numbers having at least one 0 in their ternary representation.

  From [OEIS A081605](https://oeis.org/A081605):

  > Numbers having at least one 0 in their ternary representation.
  > (Formerly )

  **Sequence IDs**: `:a081605`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a081605) |> Sequence.take!(71)
      [0,3,6,9,10,11,12,15,18,19,20,21,24,27,28,29,30,31,32,33,34,35,36,37,38,39,42,45,46,47,48,51,54,55,56,57,58,59,60,61,62,63,64,65,66,69,72,73,74,75,78,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100]


  """
  @doc offset: 1,
       sequence: "Numbers having at least one 0 in their ternary representation.",
       references: [{:oeis, :a081605, "https://oeis.org/A081605"}]
  def create_sequence_a081605(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a081605/2)
  end

  @doc offset: 1, fill_value: -1
  def seq_a081605(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [0], base: 3) >= 1
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A081606` - Numbers having at least one 1 in their ternary representation.

  From [OEIS A081606](https://oeis.org/A081606):

  > Numbers having at least one 1 in their ternary representation.
  > (Formerly )

  **Sequence IDs**: `:a081606`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a081606) |> Sequence.take!(71)
      [1,3,4,5,7,9,10,11,12,13,14,15,16,17,19,21,22,23,25,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,55,57,58,59,61,63,64,65,66,67,68,69,70,71,73,75,76,77,79,81,82,83,84,85,86]


  """
  @doc offset: 1,
       sequence: "Numbers having at least one 1 in their ternary representation.",
       references: [{:oeis, :a081606, "https://oeis.org/A081606"}]
  def create_sequence_a081606(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a081606/2)
  end

  @doc offset: 1
  def seq_a081606(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [1], base: 3) >= 1
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A097251` - Numbers whose set of base 5 digits is {0,4}.

  From [OEIS A097251](https://oeis.org/A097251):

  > Numbers whose set of base 5 digits is {0,4}.
  > (Formerly )

  **Sequence IDs**: `:a097251`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a097251) |> Sequence.take!(43)
      [0,4,20,24,100,104,120,124,500,504,520,524,600,604,620,624,2500,2504,2520,2524,2600,2604,2620,2624,3000,3004,3020,3024,3100,3104,3120,3124,12500,12504,12520,12524,12600,12604,12620,12624,13000,13004,13020]


  """
  @doc offset: 0,
       sequence: "Numbers whose set of base 5 digits is {0,4}.",
       references: [{:oeis, :a097251, "https://oeis.org/A097251"}]
  def create_sequence_a097251(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a097251/2)
  end

  @doc offset: 0, fill_value: -1
  def seq_a097251(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [1, 2, 3], base: 5) == 0
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A097252` - Numbers whose set of base 6 digits is {0,5}.

  From [OEIS A097252](https://oeis.org/A097252):

  > Numbers whose set of base 6 digits is {0,5}.
  > (Formerly )

  **Sequence IDs**: `:a097252`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a097252) |> Sequence.take!(42)
      [0,5,30,35,180,185,210,215,1080,1085,1110,1115,1260,1265,1290,1295,6480,6485,6510,6515,6660,6665,6690,6695,7560,7565,7590,7595,7740,7745,7770,7775,38880,38885,38910,38915,39060,39065,39090,39095,39960,39965]


  """
  @doc offset: 0,
       sequence: "Numbers whose set of base 6 digits is {0,5}.",
       references: [{:oeis, :a097252, "https://oeis.org/A097252"}]
  def create_sequence_a097252(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a097252/2)
  end

  @doc offset: 0, fill_value: -1
  def seq_a097252(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [1, 2, 3, 4], base: 6) == 0
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A097253` - Numbers whose set of base 7 digits is {0,6}.

  From [OEIS A097253](https://oeis.org/A097253):

  > Numbers whose set of base 7 digits is {0,6}.
  > (Formerly )

  **Sequence IDs**: `:a097253`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a097253) |> Sequence.take!(37)
      [0,6,42,48,294,300,336,342,2058,2064,2100,2106,2352,2358,2394,2400,14406,14412,14448,14454,14700,14706,14742,14748,16464,16470,16506,16512,16758,16764,16800,16806,100842,100848,100884,100890,101136]


  """
  @doc offset: 1,
       sequence: "Numbers whose set of base 7 digits is {0,6}.",
       references: [{:oeis, :a097253, "https://oeis.org/A097253"}]
  def create_sequence_a097253(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a097253/2)
  end

  @doc offset: 1, fill_value: -1
  def seq_a097253(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [1, 2, 3, 4, 5], base: 7) == 0
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A097254` - Numbers whose set of base 8 digits is {0,7}.

  From [OEIS A097254](https://oeis.org/A097254):

  > Numbers whose set of base 8 digits is {0,7}.
  > (Formerly )

  **Sequence IDs**: `:a097254`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a097254) |> Sequence.take!(37)
      [0,7,56,63,448,455,504,511,3584,3591,3640,3647,4032,4039,4088,4095,28672,28679,28728,28735,29120,29127,29176,29183,32256,32263,32312,32319,32704,32711,32760,32767,229376,229383,229432,229439,229824]


  """
  @doc offset: 1,
       sequence: "Numbers whose set of base 8 digits is {0,7}.",
       references: [{:oeis, :a097254, "https://oeis.org/A097254"}]
  def create_sequence_a097254(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a097254/2)
  end

  @doc offset: 1, fill_value: -1
  def seq_a097254(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [1, 2, 3, 4, 5, 6], base: 8) == 0
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A097255` - Numbers whose set of base 9 digits is {0,8}.

  From [OEIS A097255](https://oeis.org/A097255):

  > Numbers whose set of base 9 digits is {0,8}.
  > (Formerly )

  **Sequence IDs**: `:a097255`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a097255) |> Sequence.take!(37)
      [0,8,72,80,648,656,720,728,5832,5840,5904,5912,6480,6488,6552,6560,52488,52496,52560,52568,53136,53144,53208,53216,58320,58328,58392,58400,58968,58976,59040,59048,472392,472400,472464,472472,473040]


  """
  @doc offset: 0,
       sequence: "Numbers whose set of base 9 digits is {0,8}.",
       references: [{:oeis, :a097255, "https://oeis.org/A097255"}]
  def create_sequence_a097255(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a097255/2)
  end

  @doc offset: 0, fill_value: -1
  def seq_a097255(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [1, 2, 3, 4, 5, 6, 7], base: 9) == 0
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A097256` - Numbers whose set of base 10 digits is {0,9}.

  From [OEIS A097256](https://oeis.org/A097256):

  > Numbers whose set of base 10 digits is {0,9}.
  > (Formerly )

  **Sequence IDs**: `:a097256`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a097256) |> Sequence.take!(37)
      [0,9,90,99,900,909,990,999,9000,9009,9090,9099,9900,9909,9990,9999,90000,90009,90090,90099,90900,90909,90990,90999,99000,99009,99090,99099,99900,99909,99990,99999,900000,900009,900090,900099,900900]


  """
  @doc offset: 0,
       sequence: "Numbers whose set of base 10 digits is {0,9}.",
       references: [{:oeis, :a097256, "https://oeis.org/A097256"}]
  def create_sequence_a097256(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a097256/2)
  end

  @doc offset: 0, fill_value: -1
  def seq_a097256(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [1, 2, 3, 4, 5, 6, 7, 8], base: 10) == 0
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A097257` - Numbers whose set of base 11 digits is {0,A}, where A base 11 = 10 base 10.

  From [OEIS A097257](https://oeis.org/A097257):

  > Numbers whose set of base 11 digits is {0,A}, where A base 11 = 10 base 10.
  > (Formerly )

  **Sequence IDs**: `:a097257`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a097257) |> Sequence.take!(33)
      [0,10,110,120,1210,1220,1320,1330,13310,13320,13420,13430,14520,14530,14630,14640,146410,146420,146520,146530,147620,147630,147730,147740,159720,159730,159830,159840,160930,160940,161040,161050,1610510]


  """
  @doc offset: 0,
       sequence: "Numbers whose set of base 11 digits is {0,A}, where A base 11 = 10 base 10.",
       references: [{:oeis, :a097257, "https://oeis.org/A097257"}]
  def create_sequence_a097257(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a097257/2)
  end

  @doc offset: 0, fill_value: -1
  def seq_a097257(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [1, 2, 3, 4, 5, 6, 7, 8, 9], base: 11) == 0
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A097258` - Numbers whose set of base 12 digits is {0,B}, where B base 12 = 11 base 10.

  From [OEIS A097258](https://oeis.org/A097258):

  > Numbers whose set of base 12 digits is {0,B}, where B base 12 = 11 base 10.
  > (Formerly )

  **Sequence IDs**: `:a097258`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a097258) |> Sequence.take!(33)
      [0,11,132,143,1584,1595,1716,1727,19008,19019,19140,19151,20592,20603,20724,20735,228096,228107,228228,228239,229680,229691,229812,229823,247104,247115,247236,247247,248688,248699,248820,248831,2737152]


  """
  @doc offset: 0,
       sequence: "Numbers whose set of base 12 digits is {0,B}, where B base 12 = 11 base 10.",
       references: [{:oeis, :a097258, "https://oeis.org/A097258"}]
  def create_sequence_a097258(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a097258/2)
  end

  @doc offset: 0, fill_value: -1
  def seq_a097258(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], base: 12) == 0
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A097259` - Numbers whose set of base 13 digits is {0,C}, where C base 13 = 12 base 10.

  From [OEIS A097259](https://oeis.org/A097259):

  > Numbers whose set of base 13 digits is {0,C}, where C base 13 = 12 base 10.
  > (Formerly )

  **Sequence IDs**: `:a097259`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a097259) |> Sequence.take!(33)
      [0,12,156,168,2028,2040,2184,2196,26364,26376,26520,26532,28392,28404,28548,28560,342732,342744,342888,342900,344760,344772,344916,344928,369096,369108,369252,369264,371124,371136,371280,371292,4455516]


  """
  @doc offset: 0,
       sequence: "Numbers whose set of base 13 digits is {0,C}, where C base 13 = 12 base 10.",
       references: [{:oeis, :a097259, "https://oeis.org/A097259"}]
  def create_sequence_a097259(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a097259/2)
  end

  @doc offset: 0, fill_value: -1
  def seq_a097259(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], base: 13) == 0
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A097260` - Numbers whose set of base 14 digits is {0,D}, where D base 14 = 13 base 10.

  From [OEIS A097260](https://oeis.org/A097260):

  > Numbers whose set of base 14 digits is {0,D}, where D base 14 = 13 base 10.
  > (Formerly )

  **Sequence IDs**: `:a097260`

  **Finite**: False

  **Offset**: 1

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a097260) |> Sequence.take!(33)
      [0,13,182,195,2548,2561,2730,2743,35672,35685,35854,35867,38220,38233,38402,38415,499408,499421,499590,499603,501956,501969,502138,502151,535080,535093,535262,535275,537628,537641,537810,537823,6991712]


  """
  @doc offset: 1,
       sequence: "Numbers whose set of base 14 digits is {0,D}, where D base 14 = 13 base 10.",
       references: [{:oeis, :a097260, "https://oeis.org/A097260"}]
  def create_sequence_a097260(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a097260/2)
  end

  @doc offset: 1, fill_value: -1
  def seq_a097260(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], base: 14) == 0
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A097261` - Numbers whose set of base 15 digits is {0,E}, where E base 15 = 14 base 10.

  From [OEIS A097261](https://oeis.org/A097261):

  > Numbers whose set of base 15 digits is {0,E}, where E base 15 = 14 base 10.
  > (Formerly )

  **Sequence IDs**: `:a097261`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a097261) |> Sequence.take!(33)
      [0,14,210,224,3150,3164,3360,3374,47250,47264,47460,47474,50400,50414,50610,50624,708750,708764,708960,708974,711900,711914,712110,712124,756000,756014,756210,756224,759150,759164,759360,759374,10631250]


  """
  @doc offset: 0,
       sequence: "Numbers whose set of base 15 digits is {0,E}, where E base 15 = 14 base 10.",
       references: [{:oeis, :a097261, "https://oeis.org/A097261"}]
  def create_sequence_a097261(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a097261/2)
  end

  @doc offset: 0, fill_value: -1
  def seq_a097261(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13], base: 15) == 0
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A097262` - Numbers whose set of base 16 digits is {0,F}, where F base 16 = 15 base 10.

  From [OEIS A097262](https://oeis.org/A097262):

  > Numbers whose set of base 16 digits is {0,F}, where F base 16 = 15 base 10.
  > (Formerly )

  **Sequence IDs**: `:a097262`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a097262) |> Sequence.take!(32)
      [0,15,240,255,3840,3855,4080,4095,61440,61455,61680,61695,65280,65295,65520,65535,983040,983055,983280,983295,986880,986895,987120,987135,1044480,1044495,1044720,1044735,1048320,1048335,1048560,1048575]


  """
  @doc offset: 0,
       sequence: "Numbers whose set of base 16 digits is {0,F}, where F base 16 = 15 base 10.",
       references: [{:oeis, :a097262, "https://oeis.org/A097262"}]
  def create_sequence_a097262(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a097262/2)
  end

  @doc offset: 0, fill_value: -1
  def seq_a097262(_idx, last) do
    Math.next_number(
      fn v ->
        Math.digit_count(v, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], base: 16) == 0
      end,
      last
    )
  end

  @doc """
  OEIS Sequence `A102669` - Number of digits >= 2 in decimal representation of n.

  From [OEIS A102669](https://oeis.org/A102669):

  > Number of digits >= 2 in decimal representation of n.
  > (Formerly ) 

  **Sequence IDs**: `:a102669`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a102669) |> Sequence.take!(105)
      [0,0,1,1,1,1,1,1,1,1,0,0,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,1,1,2,2,2,2,2,2,2,2,1,1,2,2,2,2,2,2,2,2,1,1,2,2,2,2,2,2,2,2,1,1,2,2,2,2,2,2,2,2,1,1,2,2,2,2,2,2,2,2,1,1,2,2,2,2,2,2,2,2,1,1,2,2,2,2,2,2,2,2,0,0,1,1,1]


  """
  @doc offset: 0,
       sequence: "Number of digits >= 2 in decimal representation of n.",
       references: [{:oeis, :a102669, "https://oeis.org/A102669"}]
  def create_sequence_a102669(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a102669/1)
  end

  @doc offset: 0
  def seq_a102669(idx) do
    Math.digit_count(idx, [2, 3, 4, 5, 6, 7, 8, 9])
  end

  @doc """
  OEIS Sequence `A102670` - Number of digits >= 2 in the decimal representations of all integers from 0 to n.

  From [OEIS A102670](https://oeis.org/A102670):

  > Number of digits >= 2 in the decimal representations of all integers from 0 to n.
  > (Formerly )

  **Sequence IDs**: `:a102670`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a102670) |> Sequence.take!(72)
      [0,0,1,2,3,4,5,6,7,8,8,8,9,10,11,12,13,14,15,16,17,18,20,22,24,26,28,30,32,34,35,36,38,40,42,44,46,48,50,52,53,54,56,58,60,62,64,66,68,70,71,72,74,76,78,80,82,84,86,88,89,90,92,94,96,98,100,102,104,106,107,108]


  """
  @doc offset: 0,
       sequence:
         "Number of digits >= 2 in the decimal representations of all integers from 0 to n.",
       references: [{:oeis, :a102670, "https://oeis.org/A102670"}]
  def create_sequence_a102670(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a102670/1)
  end

  @doc offset: 0
  def seq_a102670(idx) do
    0..idx
    |> Enum.map(fn d -> Math.digit_count(d, [2, 3, 4, 5, 6, 7, 8, 9]) end)
    |> Enum.sum()
  end

  @doc """
  OEIS Sequence `A102671` - Number of digits >= 3 in decimal representation of n.

  From [OEIS A102671](https://oeis.org/A102671):

  > Number of digits >= 3 in decimal representation of n.
  > (Formerly ) 

  **Sequence IDs**: `:a102671`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a102671) |> Sequence.take!(105)
      [0,0,0,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,0,0,0,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,1,1,1,2,2,2,2,2,2,2,1,1,1,2,2,2,2,2,2,2,1,1,1,2,2,2,2,2,2,2,1,1,1,2,2,2,2,2,2,2,1,1,1,2,2,2,2,2,2,2,1,1,1,2,2,2,2,2,2,2,0,0,0,1,1]


  """
  @doc offset: 0,
       sequence: "Number of digits >= 3 in decimal representation of n.",
       references: [{:oeis, :a102671, "https://oeis.org/A102671"}]
  def create_sequence_a102671(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a102671/1)
  end

  @doc offset: 0
  def seq_a102671(idx) do
    Math.digit_count(idx, [3, 4, 5, 6, 7, 8, 9])
  end

  @doc """
  OEIS Sequence `A102672` - Number of digits >= 3 in the decimal representations of all integers from 0 to n.

  From [OEIS A102672](https://oeis.org/A102672):

  > Number of digits >= 3 in the decimal representations of all integers from 0 to n.
  > (Formerly )

  **Sequence IDs**: `:a102672`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a102672) |> Sequence.take!(74)
      [0,0,0,1,2,3,4,5,6,7,7,7,7,8,9,10,11,12,13,14,14,14,14,15,16,17,18,19,20,21,22,23,24,26,28,30,32,34,36,38,39,40,41,43,45,47,49,51,53,55,56,57,58,60,62,64,66,68,70,72,73,74,75,77,79,81,83,85,87,89,90,91,92,94]


  """
  @doc offset: 0,
       sequence:
         "Number of digits >= 3 in the decimal representations of all integers from 0 to n.",
       references: [{:oeis, :a102672, "https://oeis.org/A102672"}]
  def create_sequence_a102672(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a102672/1)
  end

  @doc offset: 0
  def seq_a102672(idx) do
    0..idx
    |> Enum.map(fn d -> Math.digit_count(d, [3, 4, 5, 6, 7, 8, 9]) end)
    |> Enum.sum()
  end

  @doc """
  OEIS Sequence `A102673` - Number of digits >= 4 in decimal representation of n.

  From [OEIS A102673](https://oeis.org/A102673):

  > Number of digits >= 4 in decimal representation of n.
  > (Formerly ) 

  **Sequence IDs**: `:a102673`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a102673) |> Sequence.take!(105)
      [0,0,0,0,1,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1,0,0,0,0,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,1,1,1,1,2,2,2,2,2,2,1,1,1,1,2,2,2,2,2,2,1,1,1,1,2,2,2,2,2,2,1,1,1,1,2,2,2,2,2,2,1,1,1,1,2,2,2,2,2,2,0,0,0,0,1]


  """
  @doc offset: 0,
       sequence: "Number of digits >= 4 in decimal representation of n.",
       references: [{:oeis, :a102673, "https://oeis.org/A102673"}]
  def create_sequence_a102673(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a102673/1)
  end

  @doc offset: 0
  def seq_a102673(idx) do
    Math.digit_count(idx, [4, 5, 6, 7, 8, 9])
  end

  @doc """
  OEIS Sequence `A102674` - Number of digits >= 4 in the decimal representations of all integers from 0 to n.

  From [OEIS A102674](https://oeis.org/A102674):

  > Number of digits >= 4 in the decimal representations of all integers from 0 to n.
  > (Formerly )

  **Sequence IDs**: `:a102674`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a102674) |> Sequence.take!(75)
      [0,0,0,0,1,2,3,4,5,6,6,6,6,6,7,8,9,10,11,12,12,12,12,12,13,14,15,16,17,18,18,18,18,18,19,20,21,22,23,24,25,26,27,28,30,32,34,36,38,40,41,42,43,44,46,48,50,52,54,56,57,58,59,60,62,64,66,68,70,72,73,74,75,76,78]


  """
  @doc offset: 0,
       sequence:
         "Number of digits >= 4 in the decimal representations of all integers from 0 to n.",
       references: [{:oeis, :a102674, "https://oeis.org/A102674"}]
  def create_sequence_a102674(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a102674/1)
  end

  @doc offset: 0
  def seq_a102674(idx) do
    0..idx
    |> Enum.map(fn d -> Math.digit_count(d, [4, 5, 6, 7, 8, 9]) end)
    |> Enum.sum()
  end

  @doc """
  OEIS Sequence `A102675` - Number of digits >= 5 in decimal representation of n.

  From [OEIS A102675](https://oeis.org/A102675):

  > Number of digits >= 5 in decimal representation of n.
  > (Formerly ) 

  **Sequence IDs**: `:a102675`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a102675) |> Sequence.take!(105)
      [0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,1,1,1,1,1,2,2,2,2,2,1,1,1,1,1,2,2,2,2,2,1,1,1,1,1,2,2,2,2,2,1,1,1,1,1,2,2,2,2,2,0,0,0,0,0]


  """
  @doc offset: 0,
       sequence: "Number of digits >= 5 in decimal representation of n.",
       references: [{:oeis, :a102675, "https://oeis.org/A102675"}]
  def create_sequence_a102675(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a102675/1)
  end

  @doc offset: 0
  def seq_a102675(idx) do
    Math.digit_count(idx, [5, 6, 7, 8, 9])
  end

  @doc """
  OEIS Sequence `A102676` - Number of digits >= 5 in the decimal representations of all integers from 0 to n.

  From [OEIS A102676](https://oeis.org/A102676):

  > Number of digits >= 5 in the decimal representations of all integers from 0 to n.
  > (Formerly )

  **Sequence IDs**: `:a102676`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a102676) |> Sequence.take!(76)
      [0,0,0,0,0,1,2,3,4,5,5,5,5,5,5,6,7,8,9,10,10,10,10,10,10,11,12,13,14,15,15,15,15,15,15,16,17,18,19,20,20,20,20,20,20,21,22,23,24,25,26,27,28,29,30,32,34,36,38,40,41,42,43,44,45,47,49,51,53,55,56,57,58,59,60,62]


  """
  @doc offset: 0,
       sequence:
         "Number of digits >= 5 in the decimal representations of all integers from 0 to n.",
       references: [{:oeis, :a102676, "https://oeis.org/A102676"}]
  def create_sequence_a102676(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a102676/1)
  end

  @doc offset: 0
  def seq_a102676(idx) do
    0..idx
    |> Enum.map(fn d -> Math.digit_count(d, [5, 6, 7, 8, 9]) end)
    |> Enum.sum()
  end

  @doc """
  OEIS Sequence `A102677` - Number of digits >= 6 in decimal representation of n.

  From [OEIS A102677](https://oeis.org/A102677):

  > Number of digits >= 6 in decimal representation of n.
  > (Formerly ) 

  **Sequence IDs**: `:a102677`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a102677) |> Sequence.take!(105)
      [0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,2,2,2,2,1,1,1,1,1,1,2,2,2,2,1,1,1,1,1,1,2,2,2,2,1,1,1,1,1,1,2,2,2,2,0,0,0,0,0]


  """
  @doc offset: 0,
       sequence: "Number of digits >= 6 in decimal representation of n.",
       references: [{:oeis, :a102677, "https://oeis.org/A102677"}]
  def create_sequence_a102677(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a102677/1)
  end

  @doc offset: 0
  def seq_a102677(idx) do
    Math.digit_count(idx, [6, 7, 8, 9])
  end

  @doc """
  OEIS Sequence `A102678` - Number of digits >= 6 in the decimal representations of all integers from 0 to n.

  From [OEIS A102678](https://oeis.org/A102678):

  > Number of digits >= 6 in the decimal representations of all integers from 0 to n.
  > (Formerly )

  **Sequence IDs**: `:a102678`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a102678) |> Sequence.take!(78)
      [0,0,0,0,0,0,1,2,3,4,4,4,4,4,4,4,5,6,7,8,8,8,8,8,8,8,9,10,11,12,12,12,12,12,12,12,13,14,15,16,16,16,16,16,16,16,17,18,19,20,20,20,20,20,20,20,21,22,23,24,25,26,27,28,29,30,32,34,36,38,39,40,41,42,43,44,46,48]


  """
  @doc offset: 0,
       sequence:
         "Number of digits >= 6 in the decimal representations of all integers from 0 to n.",
       references: [{:oeis, :a102678, "https://oeis.org/A102678"}]
  def create_sequence_a102678(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a102678/1)
  end

  @doc offset: 0
  def seq_a102678(idx) do
    0..idx
    |> Enum.map(fn d -> Math.digit_count(d, [6, 7, 8, 9]) end)
    |> Enum.sum()
  end

  @doc """
  OEIS Sequence `A102679` - Number of digits >= 7 in decimal representation of n.

  From [OEIS A102679](https://oeis.org/A102679):

  > Number of digits >= 7 in decimal representation of n.
  > (Formerly ) 

  **Sequence IDs**: `:a102679`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a102679) |> Sequence.take!(105)
      [0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,1,1,1,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,2,2,2,1,1,1,1,1,1,1,2,2,2,1,1,1,1,1,1,1,2,2,2,0,0,0,0,0]


  """
  @doc offset: 0,
       sequence: "Number of digits >= 7 in decimal representation of n.",
       references: [{:oeis, :a102679, "https://oeis.org/A102679"}]
  def create_sequence_a102679(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a102679/1)
  end

  @doc offset: 0
  def seq_a102679(idx) do
    Math.digit_count(idx, [7, 8, 9])
  end

  @doc """
  OEIS Sequence `A102680` - Number of digits >= 7 in the decimal representations of all integers from 0 to n.

  From [OEIS A102680](https://oeis.org/A102680):

  > Number of digits >= 7 in the decimal representations of all integers from 0 to n.
  > (Formerly )

  **Sequence IDs**: `:a102680`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a102680) |> Sequence.take!(82)
      [0,0,0,0,0,0,0,1,2,3,3,3,3,3,3,3,3,4,5,6,6,6,6,6,6,6,6,7,8,9,9,9,9,9,9,9,9,10,11,12,12,12,12,12,12,12,12,13,14,15,15,15,15,15,15,15,15,16,17,18,18,18,18,18,18,18,18,19,20,21,22,23,24,25,26,27,28,30,32,34,35,36]


  """
  @doc offset: 0,
       sequence:
         "Number of digits >= 7 in the decimal representations of all integers from 0 to n.",
       references: [{:oeis, :a102680, "https://oeis.org/A102680"}]
  def create_sequence_a102680(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a102680/1)
  end

  @doc offset: 0
  def seq_a102680(idx) do
    0..idx
    |> Enum.map(fn d -> Math.digit_count(d, [7, 8, 9]) end)
    |> Enum.sum()
  end

  @doc """
  OEIS Sequence `A102681` - Number of digits >= 8 in decimal representation of n.

  From [OEIS A102681](https://oeis.org/A102681):

  > Number of digits >= 8 in decimal representation of n.
  > (Formerly ) 

  **Sequence IDs**: `:a102681`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a102681) |> Sequence.take!(105)
      [0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,2,2,1,1,1,1,1,1,1,1,2,2,0,0,0,0,0]


  """
  @doc offset: 0,
       sequence: "Number of digits >= 8 in decimal representation of n.",
       references: [{:oeis, :a102681, "https://oeis.org/A102681"}]
  def create_sequence_a102681(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a102681/1)
  end

  @doc offset: 0
  def seq_a102681(idx) do
    Math.digit_count(idx, [8, 9])
  end

  @doc """
  OEIS Sequence `A102682` - Number of digits >= 8 in the decimal representations of all integers from 0 to n.

  From [OEIS A102682](https://oeis.org/A102682):

  > Number of digits >= 8 in the decimal representations of all integers from 0 to n.
  > (Formerly )

  **Sequence IDs**: `:a102682`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a102682) |> Sequence.take!(86)
      [0,0,0,0,0,0,0,0,1,2,2,2,2,2,2,2,2,2,3,4,4,4,4,4,4,4,4,4,5,6,6,6,6,6,6,6,6,6,7,8,8,8,8,8,8,8,8,8,9,10,10,10,10,10,10,10,10,10,11,12,12,12,12,12,12,12,12,12,13,14,14,14,14,14,14,14,14,14,15,16,17,18,19,20,21,22]


  """
  @doc offset: 0,
       sequence:
         "Number of digits >= 8 in the decimal representations of all integers from 0 to n.",
       references: [{:oeis, :a102682, "https://oeis.org/A102682"}]
  def create_sequence_a102682(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a102682/1)
  end

  @doc offset: 0
  def seq_a102682(idx) do
    0..idx
    |> Enum.map(fn d -> Math.digit_count(d, [8, 9]) end)
    |> Enum.sum()
  end

  @doc """
  OEIS Sequence `A102683` - Number of digits 9 in decimal representation of n.

  From [OEIS A102683](https://oeis.org/A102683):

  > Number of digits 9 in decimal representation of n.
  > (Formerly )

  **Sequence IDs**: `:a102683`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a102683) |> Sequence.take!(105)
      [0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,2,0,0,0,0,0]


  """
  @doc offset: 0,
       sequence: "Number of digits 9 in decimal representation of n.",
       references: [{:oeis, :a102683, "https://oeis.org/A102683"}]
  def create_sequence_a102683(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a102683/1)
  end

  @doc offset: 0
  def seq_a102683(idx) do
    Math.digit_count(idx, [9])
  end

  @doc """
  OEIS Sequence `A102684` - Number of times the digit 9 appears in the decimal representations of all integers from 0 to n.

  From [OEIS A102684](https://oeis.org/A102684):

  > Number of times the digit 9 appears in the decimal representations of all integers from 0 to n.
  > (Formerly )

  **Sequence IDs**: `:a102684`

  **Finite**: False

  **Offset**: 0

  ## Example

      iex> Sequence.create(Elixir.Chunky.Sequence.OEIS.Repr, :a102684) |> Sequence.take!(100)
      [0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,6,7,7,7,7,7,7,7,7,7,7,8,8,8,8,8,8,8,8,8,8,9,10,11,12,13,14,15,16,17,18,20]


  """
  @doc offset: 0,
       sequence:
         "Number of times the digit 9 appears in the decimal representations of all integers from 0 to n.",
       references: [{:oeis, :a102684, "https://oeis.org/A102684"}]
  def create_sequence_a102684(_opts) do
    sequence_for_function(&Elixir.Chunky.Sequence.OEIS.Repr.seq_a102684/1)
  end

  @doc offset: 0
  def seq_a102684(idx) do
    0..idx
    |> Enum.map(fn d -> Math.digit_count(d, [9]) end)
    |> Enum.sum()
  end
end

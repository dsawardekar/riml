#
# DO NOT MODIFY!!!!
# This file is automatically generated by Racc 1.4.8
# from Racc grammer file "".
#

require 'racc/parser.rb'

  require File.expand_path("../lexer", __FILE__)
  require File.expand_path("../nodes", __FILE__)
  require 'pp'

module Riml
  class Parser < Racc::Parser

module_eval(<<'...end grammar.y/module_eval...', 'grammar.y', 152)
  # This code will be put as-is in the parser class

  # parses tokens or code into output nodes
  def parse(object, show_tokens=false)
    @tokens = if tokens?(object)
      object
    elsif code?(object)
      Riml::Lexer.new.tokenize(object)
    end
    pp(@tokens) if show_tokens
    do_parse
  end

  def next_token
    @tokens.shift
  end

  private
  # is an array of arrays and first five inner arrays are all doubles
  def tokens?(object)
    Array === object and object[0..4].all? {|e| e.respond_to?(:size) and e.size == 2}
  end

  def code?(object)
    String === object
  end
...end grammar.y/module_eval...
##### State transition tables begin ###

racc_action_table = [
    76,    39,    40,    86,   107,    14,    14,    96,    73,    73,
    73,    14,    82,    98,    81,   108,    31,    32,    39,    40,
    37,    38,    33,    34,    35,    36,    30,    29,    78,    15,
    15,    72,    89,    31,    32,    15,    73,    66,    82,    65,
    94,    39,    40,    37,    38,    84,    39,    40,    37,    38,
    33,    34,    35,    36,    30,    29,    31,    32,    25,    31,
    32,    31,    32,    26,    24,    31,    32,    14,    16,    17,
    18,    19,    20,    22,    23,    21,    46,    45,    47,    39,
    40,    37,    38,    98,    44,    97,    43,    25,    84,    13,
    50,    15,    26,    24,    31,    32,    14,    16,    17,    18,
    19,    20,    22,    23,    21,    86,    42,    84,    39,    40,
    37,    38,   104,    73,   106,    84,    25,    87,    13,    84,
    15,    26,    24,    31,    32,    14,    16,    17,    18,    19,
    20,    22,    23,    21,   110,    84,    73,    27,    84,    74,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,    13,   nil,    15,
    39,    40,    37,    38,    33,    34,    35,    36,    30,    29,
    84,   nil,   nil,   nil,   nil,    31,    32,   nil,   nil,   nil,
    39,    40,    37,    38,   nil,    39,    40,    37,    38,    33,
    34,    35,    36,    30,    29,    31,    32,    25,   nil,   nil,
    31,    32,    26,    24,   nil,    39,    40,    16,    17,    18,
    19,    20,    22,    23,    21,   nil,   nil,   nil,   nil,    25,
    31,    32,   nil,   nil,    26,    24,   nil,   nil,    13,    16,
    17,    18,    19,    20,    22,    23,    21,   nil,   nil,   nil,
   nil,    25,   nil,   nil,   nil,   nil,    26,    24,   nil,   nil,
    13,    16,    17,    18,    19,    20,    22,    23,    21,   nil,
   nil,   nil,   nil,    25,   nil,   nil,   nil,   nil,    26,    24,
   nil,   nil,    13,    16,    17,    18,    19,    20,    22,    23,
    21,   nil,   nil,   nil,   nil,    25,   nil,   nil,   nil,   nil,
    26,    24,   nil,   nil,    13,    16,    17,    18,    19,    20,
    22,    23,    21,   nil,   nil,   nil,   nil,    25,   nil,   nil,
   nil,   nil,    26,    24,   nil,   nil,    13,    16,    17,    18,
    19,    20,    22,    23,    21,   nil,   nil,   nil,   nil,    25,
   nil,   nil,   nil,   nil,    26,    24,   nil,   nil,    13,    16,
    17,    18,    19,    20,    22,    23,    21,   nil,   nil,   nil,
   nil,    25,   nil,   nil,   nil,   nil,    26,    24,   nil,   nil,
    13,    16,    17,    18,    19,    20,    22,    23,    21,   nil,
   nil,   nil,   nil,    25,   nil,   nil,   nil,   nil,    26,    24,
   nil,   nil,    13,    16,    17,    18,    19,    20,    22,    23,
    21,   nil,   nil,   nil,   nil,    25,   nil,   nil,   nil,   nil,
    26,    24,   nil,   nil,    13,    16,    17,    18,    19,    20,
    22,    23,    21,   nil,   nil,   nil,   nil,    25,   nil,   nil,
   nil,   nil,    26,    24,   nil,   nil,    13,    16,    17,    18,
    19,    20,    22,    23,    21,   nil,   nil,   nil,   nil,    25,
   nil,   nil,   nil,   nil,    26,    24,   nil,   nil,    13,    16,
    17,    18,    19,    20,    22,    23,    21,   nil,   nil,   nil,
   nil,    25,   nil,   nil,   nil,   nil,    26,    24,   nil,   nil,
    13,    16,    17,    18,    19,    20,    22,    23,    21,   nil,
   nil,   nil,   nil,    25,   nil,   nil,   nil,   nil,    26,    24,
   nil,   nil,    13,    16,    17,    18,    19,    20,    22,    23,
    21,   nil,   nil,   nil,   nil,    25,   nil,   nil,   nil,   nil,
    26,    24,   nil,   nil,    13,    16,    17,    18,    19,    20,
    22,    23,    21,   nil,   nil,   nil,   nil,    25,   nil,   nil,
   nil,   nil,    26,    24,   nil,   nil,    13,    16,    17,    18,
    19,    20,    22,    23,    21,   nil,   nil,   nil,   nil,    25,
   nil,   nil,   nil,   nil,    26,    24,   nil,   nil,    13,    16,
    17,    18,    19,    20,    22,    23,    21,   nil,   nil,   nil,
   nil,    25,   nil,   nil,   nil,   nil,    26,    24,   nil,   nil,
    13,    16,    17,    18,    19,    20,    22,    23,    21,   nil,
   nil,   nil,   nil,    25,   nil,   nil,   nil,   nil,    26,    24,
   nil,   nil,    13,    16,    17,    18,    19,    20,    22,    23,
    21,   nil,   nil,   nil,   nil,    25,   nil,   nil,   nil,   nil,
    26,    24,   nil,   nil,    13,    16,    17,    18,    19,    20,
    22,    23,    21,   nil,   nil,   nil,   nil,    25,   nil,   nil,
   nil,   nil,    26,    24,   nil,   nil,    13,    16,    17,    18,
    19,    20,    22,    23,    21,   nil,   nil,   nil,   nil,    25,
   nil,   nil,   nil,   nil,    26,    24,   nil,   nil,    13,    16,
    17,    18,    19,    20,    22,    23,    21,   nil,   nil,   nil,
   nil,    25,   nil,   nil,   nil,   nil,    26,    24,   nil,   nil,
    13,    16,    17,    18,    19,    20,    22,    23,    21,   nil,
   nil,   nil,   nil,    25,   nil,   nil,   nil,   nil,    26,    24,
   nil,   nil,    13,    16,    17,    18,    19,    20,    22,    23,
    21,    39,    40,    37,    38,    33,    34,    35,    36,    30,
    29,   nil,   nil,   nil,    13,   nil,    31,    32,    39,    40,
    37,    38,    33,    34,    35,    36,    30,    29,   nil,   nil,
   nil,   nil,   nil,    31,    32,    39,    40,    37,    38,    33,
    34,    35,    36,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
    31,    32,    39,    40,    37,    38,    33,    34,    35,    36,
    30,    29,   nil,   nil,   nil,   nil,   nil,    31,    32,    39,
    40,    37,    38,    33,    34,    35,    36,    30,    29,   nil,
   nil,   nil,   nil,   nil,    31,    32,    39,    40,    37,    38,
    33,    34,    35,    36,    30,    29,   nil,   nil,   nil,   nil,
   nil,    31,    32,    39,    40,    37,    38,    33,    34,    35,
    36,    30,    29,   nil,   nil,   nil,   nil,   nil,    31,    32,
    39,    40,    37,    38,    33,    34,    35,    36,    30,   nil,
   nil,   nil,   nil,   nil,   nil,    31,    32,    39,    40,    37,
    38,    33,    34,    35,    36,    30,    29,   nil,   nil,   nil,
   nil,   nil,    31,    32,    39,    40,    37,    38,    33,    34,
    35,    36,    30,    29,   nil,   nil,   nil,   nil,   nil,    31,
    32,    39,    40,    37,    38,    33,    34,    35,    36,    30,
    29,   nil,   nil,   nil,   nil,   nil,    31,    32,    39,    40,
    37,    38,    33,    34,    35,    36,    30,    29,   nil,   nil,
   nil,    64,   nil,    31,    32 ]

racc_action_check = [
    48,    60,    60,    89,    99,     2,   112,    84,    48,    46,
    74,    99,    67,   101,    67,   101,    60,    60,    48,    48,
    48,    48,    48,    48,    48,    48,    48,    48,    49,     2,
   112,    46,    74,    48,    48,    99,    49,    42,    79,    42,
    79,    56,    56,    56,    56,    77,    49,    49,    49,    49,
    49,    49,    49,    49,    49,    49,    56,    56,   110,    63,
    63,    49,    49,   110,   110,    62,    62,   110,   110,   110,
   110,   110,   110,   110,   110,   110,    24,    23,    24,    57,
    57,    57,    57,    85,    22,    85,    22,    87,    88,   110,
    27,   110,    87,    87,    57,    57,    87,    87,    87,    87,
    87,    87,    87,    87,    87,    72,    21,    75,    58,    58,
    58,    58,    96,    97,    98,    71,     0,    73,    87,   105,
    87,     0,     0,    58,    58,     0,     0,     0,     0,     0,
     0,     0,     0,     0,   107,    93,   108,     1,   111,    47,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,     0,   nil,     0,
    93,    93,    93,    93,    93,    93,    93,    93,    93,    93,
    91,   nil,   nil,   nil,   nil,    93,    93,   nil,   nil,   nil,
    59,    59,    59,    59,   nil,    91,    91,    91,    91,    91,
    91,    91,    91,    91,    91,    59,    59,    13,   nil,   nil,
    91,    91,    13,    13,   nil,    61,    61,    13,    13,    13,
    13,    13,    13,    13,    13,   nil,   nil,   nil,   nil,    82,
    61,    61,   nil,   nil,    82,    82,   nil,   nil,    13,    82,
    82,    82,    82,    82,    82,    82,    82,   nil,   nil,   nil,
   nil,    25,   nil,   nil,   nil,   nil,    25,    25,   nil,   nil,
    82,    25,    25,    25,    25,    25,    25,    25,    25,   nil,
   nil,   nil,   nil,    26,   nil,   nil,   nil,   nil,    26,    26,
   nil,   nil,    25,    26,    26,    26,    26,    26,    26,    26,
    26,   nil,   nil,   nil,   nil,    78,   nil,   nil,   nil,   nil,
    78,    78,   nil,   nil,    26,    78,    78,    78,    78,    78,
    78,    78,    78,   nil,   nil,   nil,   nil,    28,   nil,   nil,
   nil,   nil,    28,    28,   nil,   nil,    78,    28,    28,    28,
    28,    28,    28,    28,    28,   nil,   nil,   nil,   nil,    29,
   nil,   nil,   nil,   nil,    29,    29,   nil,   nil,    28,    29,
    29,    29,    29,    29,    29,    29,    29,   nil,   nil,   nil,
   nil,    30,   nil,   nil,   nil,   nil,    30,    30,   nil,   nil,
    29,    30,    30,    30,    30,    30,    30,    30,    30,   nil,
   nil,   nil,   nil,    31,   nil,   nil,   nil,   nil,    31,    31,
   nil,   nil,    30,    31,    31,    31,    31,    31,    31,    31,
    31,   nil,   nil,   nil,   nil,    33,   nil,   nil,   nil,   nil,
    33,    33,   nil,   nil,    31,    33,    33,    33,    33,    33,
    33,    33,    33,   nil,   nil,   nil,   nil,    34,   nil,   nil,
   nil,   nil,    34,    34,   nil,   nil,    33,    34,    34,    34,
    34,    34,    34,    34,    34,   nil,   nil,   nil,   nil,    32,
   nil,   nil,   nil,   nil,    32,    32,   nil,   nil,    34,    32,
    32,    32,    32,    32,    32,    32,    32,   nil,   nil,   nil,
   nil,    36,   nil,   nil,   nil,   nil,    36,    36,   nil,   nil,
    32,    36,    36,    36,    36,    36,    36,    36,    36,   nil,
   nil,   nil,   nil,    37,   nil,   nil,   nil,   nil,    37,    37,
   nil,   nil,    36,    37,    37,    37,    37,    37,    37,    37,
    37,   nil,   nil,   nil,   nil,    38,   nil,   nil,   nil,   nil,
    38,    38,   nil,   nil,    37,    38,    38,    38,    38,    38,
    38,    38,    38,   nil,   nil,   nil,   nil,    39,   nil,   nil,
   nil,   nil,    39,    39,   nil,   nil,    38,    39,    39,    39,
    39,    39,    39,    39,    39,   nil,   nil,   nil,   nil,    40,
   nil,   nil,   nil,   nil,    40,    40,   nil,   nil,    39,    40,
    40,    40,    40,    40,    40,    40,    40,   nil,   nil,   nil,
   nil,    76,   nil,   nil,   nil,   nil,    76,    76,   nil,   nil,
    40,    76,    76,    76,    76,    76,    76,    76,    76,   nil,
   nil,   nil,   nil,    66,   nil,   nil,   nil,   nil,    66,    66,
   nil,   nil,    76,    66,    66,    66,    66,    66,    66,    66,
    66,   nil,   nil,   nil,   nil,    43,   nil,   nil,   nil,   nil,
    43,    43,   nil,   nil,    66,    43,    43,    43,    43,    43,
    43,    43,    43,   nil,   nil,   nil,   nil,    44,   nil,   nil,
   nil,   nil,    44,    44,   nil,   nil,    43,    44,    44,    44,
    44,    44,    44,    44,    44,   nil,   nil,   nil,   nil,    45,
   nil,   nil,   nil,   nil,    45,    45,   nil,   nil,    44,    45,
    45,    45,    45,    45,    45,    45,    45,   nil,   nil,   nil,
   nil,    65,   nil,   nil,   nil,   nil,    65,    65,   nil,   nil,
    45,    65,    65,    65,    65,    65,    65,    65,    65,   nil,
   nil,   nil,   nil,    35,   nil,   nil,   nil,   nil,    35,    35,
   nil,   nil,    65,    35,    35,    35,    35,    35,    35,    35,
    35,    54,    54,    54,    54,    54,    54,    54,    54,    54,
    54,   nil,   nil,   nil,    35,   nil,    54,    54,    55,    55,
    55,    55,    55,    55,    55,    55,    55,    55,   nil,   nil,
   nil,   nil,   nil,    55,    55,    53,    53,    53,    53,    53,
    53,    53,    53,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
    53,    53,     3,     3,     3,     3,     3,     3,     3,     3,
     3,     3,   nil,   nil,   nil,   nil,   nil,     3,     3,    95,
    95,    95,    95,    95,    95,    95,    95,    95,    95,   nil,
   nil,   nil,   nil,   nil,    95,    95,    51,    51,    51,    51,
    51,    51,    51,    51,    51,    51,   nil,   nil,   nil,   nil,
   nil,    51,    51,    80,    80,    80,    80,    80,    80,    80,
    80,    80,    80,   nil,   nil,   nil,   nil,   nil,    80,    80,
    52,    52,    52,    52,    52,    52,    52,    52,    52,   nil,
   nil,   nil,   nil,   nil,   nil,    52,    52,    68,    68,    68,
    68,    68,    68,    68,    68,    68,    68,   nil,   nil,   nil,
   nil,   nil,    68,    68,    69,    69,    69,    69,    69,    69,
    69,    69,    69,    69,   nil,   nil,   nil,   nil,   nil,    69,
    69,    70,    70,    70,    70,    70,    70,    70,    70,    70,
    70,   nil,   nil,   nil,   nil,   nil,    70,    70,    41,    41,
    41,    41,    41,    41,    41,    41,    41,    41,   nil,   nil,
   nil,    41,   nil,    41,    41 ]

racc_action_pointer = [
   114,   137,    -6,   741,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   185,   nil,   nil,   nil,   nil,   nil,   nil,
   nil,    89,    53,    46,    59,   229,   251,    90,   295,   317,
   339,   361,   427,   383,   405,   691,   449,   471,   493,   515,
   537,   877,     6,   603,   625,   647,    -2,   122,    -3,    25,
   nil,   775,   809,   724,   690,   707,    20,    58,    87,   149,
   -20,   174,    29,    23,   nil,   669,   581,   -20,   826,   843,
   860,   109,    88,   108,    -1,   101,   559,    39,   273,     6,
   792,   nil,   207,   nil,    -4,    51,   nil,    85,    82,   -14,
   nil,   154,   nil,   129,   nil,   758,   102,   102,    97,     0,
   nil,   -19,   nil,   nil,   nil,   113,   nil,   123,   125,   nil,
    56,   132,    -5,   nil ]

racc_action_default = [
    -1,   -59,    -2,    -3,    -6,    -7,    -8,    -9,   -10,   -11,
   -12,   -13,   -14,   -59,   -16,   -17,   -18,   -19,   -20,   -21,
   -22,   -59,   -59,   -40,   -59,   -59,   -59,   -59,    -5,   -59,
   -59,   -59,   -59,   -59,   -59,   -59,   -59,   -59,   -59,   -59,
   -59,   -59,   -59,   -25,   -59,   -59,   -59,   -59,   -59,   -59,
   114,    -4,   -28,   -29,   -30,   -31,   -32,   -33,   -34,   -35,
   -36,   -37,   -38,   -39,   -15,   -25,   -59,   -59,   -26,   -41,
   -43,   -59,   -50,   -59,   -59,   -59,   -59,   -59,   -59,   -59,
   -42,   -24,   -59,   -44,   -49,   -59,   -51,   -59,   -59,   -50,
   -53,   -59,   -55,   -59,   -23,   -27,   -59,   -59,   -59,   -58,
   -46,   -59,   -54,   -56,   -48,   -59,   -52,   -59,   -59,   -45,
   -59,   -59,   -57,   -47 ]

racc_goto_table = [
    28,     2,    41,     1,   nil,   nil,   nil,    71,    67,    75,
    77,   nil,   nil,   nil,    48,    49,   nil,    51,    52,    53,
    54,    55,    56,    57,    58,    59,    60,    61,    62,    63,
    79,    85,    68,    69,    70,    88,   nil,   nil,   nil,    83,
   nil,   nil,   nil,    90,   nil,    92,   nil,   nil,   101,   nil,
   nil,   nil,   nil,   nil,    68,    80,   100,   nil,   105,   102,
   nil,   103,   nil,   nil,   nil,    91,   nil,    93,   nil,   111,
   nil,    95,   nil,   109,   nil,   nil,   nil,   nil,   nil,   113,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,    99,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,    28,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
    28,   112 ]

racc_goto_check = [
     4,     2,     3,     1,   nil,   nil,   nil,    14,    13,    14,
    14,   nil,   nil,   nil,     3,     3,   nil,     3,     3,     3,
     3,     3,     3,     3,     3,     3,     3,     3,     3,     3,
    13,    16,     3,     3,     3,    14,   nil,   nil,   nil,    15,
   nil,   nil,   nil,    15,   nil,    15,   nil,   nil,    16,   nil,
   nil,   nil,   nil,   nil,     3,     3,    15,   nil,    14,    15,
   nil,    15,   nil,   nil,   nil,     3,   nil,     3,   nil,    14,
   nil,     3,   nil,    15,   nil,   nil,   nil,   nil,   nil,    15,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,     2,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,     4,   nil,   nil,
   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil,
     4,     2 ]

racc_goto_pointer = [
   nil,     3,     1,   -11,    -2,   nil,   nil,   nil,   nil,   nil,
   nil,   nil,   nil,   -35,   -39,   -32,   -41 ]

racc_goto_default = [
   nil,   nil,   nil,     3,     4,     5,     6,     7,     8,     9,
    10,    11,    12,   nil,   nil,   nil,   nil ]

racc_reduce_table = [
  0, 0, :racc_error,
  0, 39, :_reduce_1,
  1, 39, :_reduce_2,
  1, 40, :_reduce_3,
  3, 40, :_reduce_4,
  2, 40, :_reduce_5,
  1, 40, :_reduce_6,
  1, 41, :_reduce_none,
  1, 41, :_reduce_none,
  1, 41, :_reduce_none,
  1, 41, :_reduce_none,
  1, 41, :_reduce_none,
  1, 41, :_reduce_none,
  1, 41, :_reduce_none,
  1, 41, :_reduce_none,
  3, 41, :_reduce_15,
  1, 42, :_reduce_none,
  1, 42, :_reduce_none,
  1, 43, :_reduce_18,
  1, 43, :_reduce_19,
  1, 43, :_reduce_20,
  1, 43, :_reduce_21,
  1, 43, :_reduce_22,
  5, 44, :_reduce_23,
  4, 44, :_reduce_24,
  0, 51, :_reduce_25,
  1, 51, :_reduce_26,
  3, 51, :_reduce_27,
  3, 45, :_reduce_28,
  3, 45, :_reduce_29,
  3, 45, :_reduce_30,
  3, 45, :_reduce_31,
  3, 45, :_reduce_32,
  3, 45, :_reduce_33,
  3, 45, :_reduce_34,
  3, 45, :_reduce_35,
  3, 45, :_reduce_36,
  3, 45, :_reduce_37,
  3, 45, :_reduce_38,
  3, 45, :_reduce_39,
  1, 46, :_reduce_40,
  3, 47, :_reduce_41,
  4, 47, :_reduce_42,
  3, 47, :_reduce_43,
  4, 48, :_reduce_44,
  7, 48, :_reduce_45,
  5, 48, :_reduce_46,
  8, 48, :_reduce_47,
  3, 53, :_reduce_none,
  1, 53, :_reduce_none,
  0, 54, :_reduce_50,
  1, 54, :_reduce_51,
  3, 54, :_reduce_52,
  4, 49, :_reduce_53,
  5, 49, :_reduce_54,
  4, 50, :_reduce_55,
  5, 50, :_reduce_56,
  6, 52, :_reduce_57,
  3, 52, :_reduce_58 ]

racc_reduce_n = 59

racc_shift_n = 114

racc_token_table = {
  false => 0,
  :error => 1,
  :IF => 2,
  :THEN => 3,
  :ELSE => 4,
  :ELSIF => 5,
  :END => 6,
  :UNLESS => 7,
  :DEF => 8,
  :INDENT => 9,
  :DEDENT => 10,
  :NEWLINE => 11,
  :NUMBER => 12,
  :STRING => 13,
  :TRUE => 14,
  :FALSE => 15,
  :NIL => 16,
  :IDENTIFIER => 17,
  :CONSTANT => 18,
  :SCOPE_MODIFIER => 19,
  "!" => 20,
  "*" => 21,
  "/" => 22,
  "+" => 23,
  "-" => 24,
  ">" => 25,
  ">=" => 26,
  "<" => 27,
  "<=" => 28,
  "&&" => 29,
  "||" => 30,
  "=" => 31,
  "," => 32,
  "(" => 33,
  ")" => 34,
  ";" => 35,
  "==" => 36,
  "!=" => 37 }

racc_nt_base = 38

racc_use_result_var = true

Racc_arg = [
  racc_action_table,
  racc_action_check,
  racc_action_default,
  racc_action_pointer,
  racc_goto_table,
  racc_goto_check,
  racc_goto_default,
  racc_goto_pointer,
  racc_nt_base,
  racc_reduce_table,
  racc_token_table,
  racc_shift_n,
  racc_reduce_n,
  racc_use_result_var ]

Racc_token_to_s_table = [
  "$end",
  "error",
  "IF",
  "THEN",
  "ELSE",
  "ELSIF",
  "END",
  "UNLESS",
  "DEF",
  "INDENT",
  "DEDENT",
  "NEWLINE",
  "NUMBER",
  "STRING",
  "TRUE",
  "FALSE",
  "NIL",
  "IDENTIFIER",
  "CONSTANT",
  "SCOPE_MODIFIER",
  "\"!\"",
  "\"*\"",
  "\"/\"",
  "\"+\"",
  "\"-\"",
  "\">\"",
  "\">=\"",
  "\"<\"",
  "\"<=\"",
  "\"&&\"",
  "\"||\"",
  "\"=\"",
  "\",\"",
  "\"(\"",
  "\")\"",
  "\";\"",
  "\"==\"",
  "\"!=\"",
  "$start",
  "Root",
  "Expressions",
  "Expression",
  "Terminator",
  "Literal",
  "Call",
  "Operator",
  "Constant",
  "Assign",
  "Def",
  "If",
  "Unless",
  "ArgList",
  "Block",
  "End",
  "ParamList" ]

Racc_debug_parser = false

##### State transition tables end #####

# reduce 0 omitted

module_eval(<<'.,.,', 'grammar.y', 28)
  def _reduce_1(val, _values, result)
     result = Nodes.new([]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 29)
  def _reduce_2(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 34)
  def _reduce_3(val, _values, result)
     result = Nodes.new([ val[0] ]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 35)
  def _reduce_4(val, _values, result)
     result = val[0] << val[2] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 36)
  def _reduce_5(val, _values, result)
     result = val[0] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 37)
  def _reduce_6(val, _values, result)
     result = Nodes.new([]) 
    result
  end
.,.,

# reduce 7 omitted

# reduce 8 omitted

# reduce 9 omitted

# reduce 10 omitted

# reduce 11 omitted

# reduce 12 omitted

# reduce 13 omitted

# reduce 14 omitted

module_eval(<<'.,.,', 'grammar.y', 50)
  def _reduce_15(val, _values, result)
     result = val[1] 
    result
  end
.,.,

# reduce 16 omitted

# reduce 17 omitted

module_eval(<<'.,.,', 'grammar.y', 60)
  def _reduce_18(val, _values, result)
     result = NumberNode.new(val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 61)
  def _reduce_19(val, _values, result)
     result = StringNode.new(val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 62)
  def _reduce_20(val, _values, result)
     result = TrueNode.new 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 63)
  def _reduce_21(val, _values, result)
     result = FalseNode.new 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 64)
  def _reduce_22(val, _values, result)
     result = NilNode.new 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 69)
  def _reduce_23(val, _values, result)
     result = CallNode.new(val[0], val[1], val[3]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 70)
  def _reduce_24(val, _values, result)
     result = CallNode.new(nil, val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 74)
  def _reduce_25(val, _values, result)
     result = [] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 75)
  def _reduce_26(val, _values, result)
     result = val 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 76)
  def _reduce_27(val, _values, result)
     result = val[0] << val[2] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 81)
  def _reduce_28(val, _values, result)
     result = BinaryOperatorNode.new(val[1], [val[0]] << val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 82)
  def _reduce_29(val, _values, result)
     result = BinaryOperatorNode.new(val[1], [val[0]] << val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 83)
  def _reduce_30(val, _values, result)
     result = BinaryOperatorNode.new(val[1], [val[0]] << val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 84)
  def _reduce_31(val, _values, result)
     result = BinaryOperatorNode.new(val[1], [val[0]] << val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 85)
  def _reduce_32(val, _values, result)
     result = BinaryOperatorNode.new(val[1], [val[0]] << val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 86)
  def _reduce_33(val, _values, result)
     result = BinaryOperatorNode.new(val[1], [val[0]] << val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 87)
  def _reduce_34(val, _values, result)
     result = BinaryOperatorNode.new(val[1], [val[0]] << val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 88)
  def _reduce_35(val, _values, result)
     result = BinaryOperatorNode.new(val[1], [val[0]] << val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 89)
  def _reduce_36(val, _values, result)
     result = BinaryOperatorNode.new(val[1], [val[0]] << val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 90)
  def _reduce_37(val, _values, result)
     result = BinaryOperatorNode.new(val[1], [val[0]] << val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 91)
  def _reduce_38(val, _values, result)
     result = BinaryOperatorNode.new(val[1], [val[0]] << val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 92)
  def _reduce_39(val, _values, result)
     result = BinaryOperatorNode.new(val[1], [val[0]] << val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 96)
  def _reduce_40(val, _values, result)
     result = GetConstantNode.new(val[0]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 101)
  def _reduce_41(val, _values, result)
     result = SetVariableNode.new(nil, val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 102)
  def _reduce_42(val, _values, result)
     result = SetVariableNode.new(val[0], val[1], val[3]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 103)
  def _reduce_43(val, _values, result)
     result = SetConstantNode.new(val[0], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 109)
  def _reduce_44(val, _values, result)
     indent = val[2].pop; result = DefNode.new(nil,    val[1], [],     val[2], indent) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 110)
  def _reduce_45(val, _values, result)
     indent = val[5].pop; result = DefNode.new(nil,    val[1], val[3], val[5], indent) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 111)
  def _reduce_46(val, _values, result)
     indent = val[3].pop; result = DefNode.new(val[1], val[2], [],     val[3], indent) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 112)
  def _reduce_47(val, _values, result)
     indent = val[6].pop; result = DefNode.new(val[1], val[2], val[4], val[6], indent) 
    result
  end
.,.,

# reduce 48 omitted

# reduce 49 omitted

module_eval(<<'.,.,', 'grammar.y', 121)
  def _reduce_50(val, _values, result)
     result = [] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 122)
  def _reduce_51(val, _values, result)
     result = val 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 123)
  def _reduce_52(val, _values, result)
     result = val[0] << val[2] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 128)
  def _reduce_53(val, _values, result)
     indent = val[2].pop; result = IfNode.new(val[1], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 129)
  def _reduce_54(val, _values, result)
     result = IfNode.new( val[1], Nodes.new([val[3]]) ) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 133)
  def _reduce_55(val, _values, result)
     indent = val[2].pop; result = UnlessNode.new(val[1], val[2]) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 134)
  def _reduce_56(val, _values, result)
     result = UnlessNode.new( val[1], Nodes.new([val[3]]) ) 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 140)
  def _reduce_57(val, _values, result)
     result = val[2] << ElseNode.new(val[5]) << val[1] 
    result
  end
.,.,

module_eval(<<'.,.,', 'grammar.y', 141)
  def _reduce_58(val, _values, result)
     result = val[2] << val[1] 
    result
  end
.,.,

def _reduce_none(val, _values, result)
  val[0]
end

  end   # class Parser
  end   # module Riml

module Mineshift
  COLORS = [
    [
      Rl::Color.new(r: 255_u8, g: 255_u8, b: 255_u8, a: 255_u8),
      Rl::Color.new(r: 170_u8, g: 170_u8, b: 170_u8, a: 255_u8),
      Rl::Color.new(r: 100_u8, g: 100_u8, b: 100_u8, a: 255_u8),
      Rl::Color.new(r: 50_u8, g: 50_u8, b: 50_u8, a: 255_u8),
      Rl::Color.new(r: 0_u8, g: 0_u8, b: 0_u8, a: 255_u8),
    ],
    [
      Rl::Color.new(r: 0xe2_u8, g: 0xf1_u8, b: 0xaf_u8, a: 255_u8),
      Rl::Color.new(r: 0xe3_u8, g: 0xd8_u8, b: 0x88_u8, a: 255_u8),
      Rl::Color.new(r: 0x84_u8, g: 0x71_u8, b: 0x4f_u8, a: 255_u8),
      Rl::Color.new(r: 0x5a_u8, g: 0x3a_u8, b: 0x31_u8, a: 255_u8),
      Rl::Color.new(r: 0x31_u8, g: 0x23_u8, b: 0x1e_u8, a: 255_u8),

    ],

    [
      Rl::Color.new(r: 0xdd_u8, g: 0xf3_u8, b: 0xb5_u8, a: 255_u8),
      Rl::Color.new(r: 0x83_u8, g: 0xc9_u8, b: 0x23_u8, a: 255_u8),
      Rl::Color.new(r: 0x74_u8, g: 0xa3_u8, b: 0x1d_u8, a: 255_u8),
      Rl::Color.new(r: 0x57_u8, g: 0x7a_u8, b: 0x15_u8, a: 255_u8),
      Rl::Color.new(r: 0x39_u8, g: 0x51_u8, b: 0x0e_u8, a: 255_u8),

    ],

    [
      Rl::Color.new(r: 0xec_u8, g: 0xfe_u8, b: 0xe8_u8, a: 255_u8),
      Rl::Color.new(r: 0xc2_u8, g: 0xef_u8, b: 0xeb_u8, a: 255_u8),
      Rl::Color.new(r: 0x6e_u8, g: 0xa4_u8, b: 0xbf_u8, a: 255_u8),
      Rl::Color.new(r: 0x41_u8, g: 0x33_u8, b: 0x7a_u8, a: 255_u8),
      Rl::Color.new(r: 0x33_u8, g: 0x1e_u8, b: 0x36_u8, a: 255_u8),

    ],

    [
      Rl::Color.new(r: 0xf0_u8, g: 0xf3_u8, b: 0xbd_u8, a: 255_u8),
      Rl::Color.new(r: 0x02_u8, g: 0xc3_u8, b: 0x9a_u8, a: 255_u8),
      Rl::Color.new(r: 0x00_u8, g: 0xa8_u8, b: 0x96_u8, a: 255_u8),
      Rl::Color.new(r: 0x02_u8, g: 0x80_u8, b: 0x90_u8, a: 255_u8),
      Rl::Color.new(r: 0x06_u8, g: 0x66_u8, b: 0x8d_u8, a: 255_u8),

    ],

    [
      Rl::Color.new(r: 0xff_u8, g: 0xcd_u8, b: 0xB2_u8, a: 255_u8),
      Rl::Color.new(r: 0xff_u8, g: 0xb4_u8, b: 0xa2_u8, a: 255_u8),
      Rl::Color.new(r: 0xe5_u8, g: 0x98_u8, b: 0x9b_u8, a: 255_u8),
      Rl::Color.new(r: 0xb5_u8, g: 0x83_u8, b: 0x8d_u8, a: 255_u8),
      Rl::Color.new(r: 0x6d_u8, g: 0x68_u8, b: 0x75_u8, a: 255_u8),

    ],

    [
      Rl::Color.new(r: 0x6f_u8, g: 0xff_u8, b: 0xe9_u8, a: 255_u8),
      Rl::Color.new(r: 0x5b_u8, g: 0xc0_u8, b: 0xbe_u8, a: 255_u8),
      Rl::Color.new(r: 0x3a_u8, g: 0x50_u8, b: 0x6b_u8, a: 255_u8),
      Rl::Color.new(r: 0x1c_u8, g: 0x25_u8, b: 0x41_u8, a: 255_u8),
      Rl::Color.new(r: 0x0b_u8, g: 0x13_u8, b: 0x2b_u8, a: 255_u8),

    ],

    [
      Rl::Color.new(r: 0xd8_u8, g: 0xdb_u8, b: 0xe2_u8, a: 255_u8),
      Rl::Color.new(r: 0xa9_u8, g: 0xbc_u8, b: 0xd0_u8, a: 255_u8),
      Rl::Color.new(r: 0x58_u8, g: 0xa4_u8, b: 0xb0_u8, a: 255_u8),
      Rl::Color.new(r: 0x37_u8, g: 0x3f_u8, b: 0x51_u8, a: 255_u8),
      Rl::Color.new(r: 0x1b_u8, g: 0x1b_u8, b: 0x1e_u8, a: 255_u8),

    ],

    [
      Rl::Color.new(r: 0xf6_u8, g: 0xaa_u8, b: 0x1c_u8, a: 255_u8),
      Rl::Color.new(r: 0xbc_u8, g: 0x39_u8, b: 0x08_u8, a: 255_u8),
      Rl::Color.new(r: 0x94_u8, g: 0x1b_u8, b: 0x0c_u8, a: 255_u8),
      Rl::Color.new(r: 0x62_u8, g: 0x17_u8, b: 0x08_u8, a: 255_u8),
      Rl::Color.new(r: 0x22_u8, g: 0x09_u8, b: 0x01_u8, a: 255_u8),

    ],

    [
      Rl::Color.new(r: 0xe0_u8, g: 0xfb_u8, b: 0xfc_u8, a: 255_u8),
      Rl::Color.new(r: 0xc2_u8, g: 0xdf_u8, b: 0xe3_u8, a: 255_u8),
      Rl::Color.new(r: 0x9d_u8, g: 0xb4_u8, b: 0xc0_u8, a: 255_u8),
      Rl::Color.new(r: 0x5c_u8, g: 0x6b_u8, b: 0x73_u8, a: 255_u8),
      Rl::Color.new(r: 0x25_u8, g: 0x32_u8, b: 0x37_u8, a: 255_u8),

    ],

    [
      Rl::Color.new(r: 0x97_u8, g: 0x42_u8, b: 0xa1_u8, a: 255_u8),
      Rl::Color.new(r: 0x7c_u8, g: 0x30_u8, b: 0x85_u8, a: 255_u8),
      Rl::Color.new(r: 0x61_u8, g: 0x1f_u8, b: 0x69_u8, a: 255_u8),
      Rl::Color.new(r: 0x4a_u8, g: 0x15_u8, b: 0x4b_u8, a: 255_u8),
      Rl::Color.new(r: 0x34_u8, g: 0x0f_u8, b: 0x34_u8, a: 255_u8),

    ],

    [
      Rl::Color.new(r: 0xc4_u8, g: 0xff_u8, b: 0xf9_u8, a: 255_u8),
      Rl::Color.new(r: 0x9c_u8, g: 0xea_u8, b: 0xef_u8, a: 255_u8),
      Rl::Color.new(r: 0x68_u8, g: 0xd8_u8, b: 0xd6_u8, a: 255_u8),
      Rl::Color.new(r: 0x3d_u8, g: 0xcc_u8, b: 0xc7_u8, a: 255_u8),
      Rl::Color.new(r: 0x07_u8, g: 0xbe_u8, b: 0xb8_u8, a: 255_u8),

    ],

    [
      Rl::Color.new(r: 0xff_u8, g: 0xff_u8, b: 0xff_u8, a: 255_u8),
      Rl::Color.new(r: 0x5b_u8, g: 0xc0_u8, b: 0xbe_u8, a: 255_u8),
      Rl::Color.new(r: 0x3a_u8, g: 0x50_u8, b: 0x6b_u8, a: 255_u8),
      Rl::Color.new(r: 0x1c_u8, g: 0x25_u8, b: 0x41_u8, a: 255_u8),
      Rl::Color.new(r: 0x0b_u8, g: 0x13_u8, b: 0x2b_u8, a: 255_u8),

    ],

    [
      Rl::Color.new(r: 0xff_u8, g: 0x9b_u8, b: 0x54_u8, a: 255_u8),
      Rl::Color.new(r: 0xff_u8, g: 0x7f_u8, b: 0x51_u8, a: 255_u8),
      Rl::Color.new(r: 0xce_u8, g: 0x42_u8, b: 0x57_u8, a: 255_u8),
      Rl::Color.new(r: 0x72_u8, g: 0x00_u8, b: 0x26_u8, a: 255_u8),
      Rl::Color.new(r: 0x4f_u8, g: 0x00_u8, b: 0x0b_u8, a: 255_u8),

    ],

    [
      Rl::Color.new(r: 0xed_u8, g: 0xee_u8, b: 0xc9_u8, a: 255_u8),
      Rl::Color.new(r: 0xdd_u8, g: 0xe7_u8, b: 0xc7_u8, a: 255_u8),
      Rl::Color.new(r: 0xbf_u8, g: 0xd8_u8, b: 0xbd_u8, a: 255_u8),
      Rl::Color.new(r: 0x98_u8, g: 0xc9_u8, b: 0xa3_u8, a: 255_u8),
      Rl::Color.new(r: 0x77_u8, g: 0xbf_u8, b: 0xa3_u8, a: 255_u8),

    ],

    [
      Rl::Color.new(r: 0xb8_u8, g: 0xf3_u8, b: 0xff_u8, a: 255_u8),
      Rl::Color.new(r: 0x8a_u8, g: 0xc6_u8, b: 0xd0_u8, a: 255_u8),
      Rl::Color.new(r: 0x63_u8, g: 0x76_u8, b: 0x8d_u8, a: 255_u8),
      Rl::Color.new(r: 0x55_u8, g: 0x49_u8, b: 0x71_u8, a: 255_u8),
      Rl::Color.new(r: 0x36_u8, g: 0x21_u8, b: 0x3e_u8, a: 255_u8),

    ],

    [
      Rl::Color.new(r: 0xf0_u8, g: 0xeb_u8, b: 0xd8_u8, a: 255_u8),
      Rl::Color.new(r: 0x74_u8, g: 0x8c_u8, b: 0xab_u8, a: 255_u8),
      Rl::Color.new(r: 0x3e_u8, g: 0x5c_u8, b: 0x76_u8, a: 255_u8),
      Rl::Color.new(r: 0x1d_u8, g: 0x2d_u8, b: 0x44_u8, a: 255_u8),
      Rl::Color.new(r: 0x0d_u8, g: 0x13_u8, b: 0x21_u8, a: 255_u8),

    ],

    [
      Rl::Color.new(r: 0xf9_u8, g: 0xdb_u8, b: 0xbd_u8, a: 255_u8),
      Rl::Color.new(r: 0xff_u8, g: 0xa5_u8, b: 0xab_u8, a: 255_u8),
      Rl::Color.new(r: 0xda_u8, g: 0x62_u8, b: 0x7d_u8, a: 255_u8),
      Rl::Color.new(r: 0xa5_u8, g: 0x38_u8, b: 0x60_u8, a: 255_u8),
      Rl::Color.new(r: 0x45_u8, g: 0x09_u8, b: 0x20_u8, a: 255_u8),

    ],

    [
      Rl::Color.new(r: 0xe0_u8, g: 0x9f_u8, b: 0x7d_u8, a: 255_u8),
      Rl::Color.new(r: 0xef_u8, g: 0x5d_u8, b: 0x60_u8, a: 255_u8),
      Rl::Color.new(r: 0xec_u8, g: 0x40_u8, b: 0x67_u8, a: 255_u8),
      Rl::Color.new(r: 0xa0_u8, g: 0x1a_u8, b: 0x7d_u8, a: 255_u8),
      Rl::Color.new(r: 0x31_u8, g: 0x18_u8, b: 0x47_u8, a: 255_u8),

    ],

    [
      Rl::Color.new(r: 0x53_u8, g: 0xb3_u8, b: 0xcb_u8, a: 255_u8),
      Rl::Color.new(r: 0xf9_u8, g: 0xc2_u8, b: 0x2e_u8, a: 255_u8),
      Rl::Color.new(r: 0xf1_u8, g: 0x59_u8, b: 0x46_u8, a: 255_u8),
      Rl::Color.new(r: 0xe0_u8, g: 0x1a_u8, b: 0x4f_u8, a: 255_u8),
      Rl::Color.new(r: 0x0c_u8, g: 0x09_u8, b: 0x0d_u8, a: 255_u8),

    ],

    [
      Rl::Color.new(r: 0xfe_u8, g: 0xfc_u8, b: 0xfb_u8, a: 255_u8),
      Rl::Color.new(r: 0x12_u8, g: 0x82_u8, b: 0xa2_u8, a: 255_u8),
      Rl::Color.new(r: 0x03_u8, g: 0x40_u8, b: 0x78_u8, a: 255_u8),
      Rl::Color.new(r: 0x00_u8, g: 0x1f_u8, b: 0x54_u8, a: 255_u8),
      Rl::Color.new(r: 0x0a_u8, g: 0x11_u8, b: 0x28_u8, a: 255_u8),

    ],

    [
      Rl::Color.new(r: 0xe0_u8, g: 0xd6_u8, b: 0x8a_u8, a: 255_u8),
      Rl::Color.new(r: 0xcb_u8, g: 0x91_u8, b: 0x73_u8, a: 255_u8),
      Rl::Color.new(r: 0x8e_u8, g: 0x44_u8, b: 0x3d_u8, a: 255_u8),
      Rl::Color.new(r: 0x51_u8, g: 0x17_u8, b: 0x30_u8, a: 255_u8),
      Rl::Color.new(r: 0x32_u8, g: 0x0a_u8, b: 0x28_u8, a: 255_u8),

    ],

    [
      Rl::Color.new(r: 0xf3_u8, g: 0xc6_u8, b: 0x77_u8, a: 255_u8),
      Rl::Color.new(r: 0xf9_u8, g: 0x56_u8, b: 0x4f_u8, a: 255_u8),
      Rl::Color.new(r: 0xb3_u8, g: 0x3f_u8, b: 0x62_u8, a: 255_u8),
      Rl::Color.new(r: 0x7b_u8, g: 0x1e_u8, b: 0x7a_u8, a: 255_u8),
      Rl::Color.new(r: 0x0c_u8, g: 0x0a_u8, b: 0x3e_u8, a: 255_u8),

    ],

    [
      Rl::Color.new(r: 0xef_u8, g: 0xd9_u8, b: 0xce_u8, a: 255_u8),
      Rl::Color.new(r: 0xde_u8, g: 0xc0_u8, b: 0xf1_u8, a: 255_u8),
      Rl::Color.new(r: 0xb7_u8, g: 0x9c_u8, b: 0xed_u8, a: 255_u8),
      Rl::Color.new(r: 0x95_u8, g: 0x7f_u8, b: 0xef_u8, a: 255_u8),
      Rl::Color.new(r: 0x71_u8, g: 0x61_u8, b: 0xef_u8, a: 255_u8),

    ],

    [
      Rl::Color.new(r: 0xf0_u8, g: 0xf4_u8, b: 0x65_u8, a: 255_u8),
      Rl::Color.new(r: 0x9c_u8, g: 0xec_u8, b: 0x5b_u8, a: 255_u8),
      Rl::Color.new(r: 0x50_u8, g: 0xc5_u8, b: 0xb7_u8, a: 255_u8),
      Rl::Color.new(r: 0x61_u8, g: 0x84_u8, b: 0xdb_u8, a: 255_u8),
      Rl::Color.new(r: 0x53_u8, g: 0x3a_u8, b: 0x71_u8, a: 255_u8),

    ],

    [
      Rl::Color.new(r: 0xad_u8, g: 0x28_u8, b: 0x31_u8, a: 255_u8),
      Rl::Color.new(r: 0x80_u8, g: 0x0e_u8, b: 0x13_u8, a: 255_u8),
      Rl::Color.new(r: 0x64_u8, g: 0x0d_u8, b: 0x14_u8, a: 255_u8),
      Rl::Color.new(r: 0x38_u8, g: 0x04_u8, b: 0x0e_u8, a: 255_u8),
      Rl::Color.new(r: 0x25_u8, g: 0x09_u8, b: 0x02_u8, a: 255_u8),
    ],
  ]

  class_property colors : Array(Array(Rl::Color)) = COLORS + COLORS.map(&.reverse)
end

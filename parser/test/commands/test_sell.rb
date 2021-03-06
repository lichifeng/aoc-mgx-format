﻿require_relative '../../../parser/structures/body/sell'

require_relative '../test_helper'

class TestSell < MiniTest::Test
  def setup
    @files = Dir.glob(__dir__ + '/../fixtures/sell/*.dump')
  end
	
	def test_structure
		Dir.glob(__dir__ + '/../parser/data/buy/*.dump') do |dump|
			io = File.open(dump)
			struct = Sell.read(io)
			
			assert((1..8).member?(struct.player_id), "Player id not in range: " + struct.player_id.to_s) 		
			assert((0..4).member?(struct.resource_type), "Resource type not in range" + dump) 
			assert((0..9999).member?(struct.amount), "Amount type not in range" + dump)
			assert(struct.obj_id.is_a?(Numeric), "Gebäude id keine Nummer")
			assert_equal(0, struct.zero, "Last 4 Bytes not zero" + struct.zero.to_s)
			
		end
	end
end
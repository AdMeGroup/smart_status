module Fixtures
  def self.attributes_list
    {
      :raw_read_error_rate => { :id => 1, :threshold_value => 100, :threshold_value_worst => 100, :threshold_level => 62, :type => :pre_fail,:updated => :always,:raw => 0, :when_failed => '-'},
      :throughput_performance => {  :id => 2, :threshold_value => 100, :threshold_value_worst => 100, :threshold_level => 40, :type => :pre_fail,:updated => :offline,:raw => 0, :when_failed => '-'},
      :spin_up_time => { :id => 3, :threshold_value => 220, :threshold_value_worst => 220, :threshold_level => 33, :type => :pre_fail,:updated => :always,:raw => 1, :when_failed => '-'},
      :start_stop_count => { :id => 4, :threshold_value => 100, :threshold_value_worst => 100, :threshold_level => 0, :type => :old_age,:updated => :always,:raw => 354, :when_failed => '-'},
      :reallocated_sector_ct => { :id => 5, :threshold_value => 100, :threshold_value_worst => 100, :threshold_level => 5, :type => :pre_fail,:updated => :always,:raw => 0, :when_failed => '-'},
      :seek_error_rate => { :id => 7, :threshold_value => 100, :threshold_value_worst => 100, :threshold_level => 67, :type => :pre_fail,:updated => :always,:raw => 0, :when_failed => '-'},
      :seek_time_performance => { :id => 8, :threshold_value => 100, :threshold_value_worst => 100, :threshold_level => 40, :type => :pre_fail,:updated => :offline,:raw => 0, :when_failed => '-'},
      :power_on_hours => { :id => 9, :threshold_value => 98, :threshold_value_worst => 98, :threshold_level => 0, :type => :old_age,:updated => :always,:raw => 1153, :when_failed => '-'},
      :spin_retry_count => { :id => 10, :threshold_value => 100, :threshold_value_worst => 100, :threshold_level => 60, :type => :pre_fail,:updated => :always,:raw => 0, :when_failed => '-'},
      :power_cycle_count => { :id => 12, :threshold_value => 100, :threshold_value_worst => 100, :threshold_level => 0, :type => :old_age,:updated => :always,:raw => 352, :when_failed => '-'},
      :g_sense_error_rate => { :id => 191, :threshold_value => 100, :threshold_value_worst => 100, :threshold_level => 0, :type => :old_age,:updated => :always,:raw => 0, :when_failed => '-'},
      :power_off_retract_count => { :id => 192, :threshold_value => 100, :threshold_value_worst => 100, :threshold_level => 0, :type => :old_age,:updated => :always,:raw => 35, :when_failed => '-'},
      :load_cycle_count => { :id => 193,:threshold_value => 100, :threshold_value_worst => 100, :threshold_level => 0, :type => :old_age,:updated => :always,:raw => 2884, :when_failed => '-'},
      :temperature_celsius => { :id => 194, :threshold_value => 150, :threshold_value_worst => 150, :threshold_level => 0, :type => :old_age,:updated => :always,:raw => 40, :when_failed => '-'},
      :reallocated_event_count => { :id => 196, :threshold_value => 100, :threshold_value_worst => 100, :threshold_level => 0, :type => :old_age,:updated => :always,:raw => 1, :when_failed => '-'},
      :current_pending_sector => { :id => 197, :threshold_value => 100, :threshold_value_worst => 100, :threshold_level => 0, :type => :old_age,:updated => :always,:raw => 0, :when_failed => '-'},
      :offline_uncorrectable => { :id => 198, :threshold_value => 100, :threshold_value_worst => 100, :threshold_level => 0, :type => :old_age,:updated => :offline,:raw => 0, :when_failed => '-'},
      :udma_crc_error_count => { :id => 199, :threshold_value => 200, :threshold_value_worst => 200, :threshold_level => 0, :type => :old_age,:updated => :always,:raw => 0, :when_failed => '-'},
      :load_retry_count => { :id => 223, :threshold_value => 100, :threshold_value_worst => 100, :threshold_level => 0, :type => :old_age,:updated => :always,:raw => 0, :when_failed => '-'}
    }.dup
  end
end

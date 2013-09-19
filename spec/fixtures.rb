module Fixtures
  def self.attributes_list
    {
      :raw_read_error_rate => { :id => 1, :raw_name => "Raw_Read_Error_Rate", :formatted_name => "Raw Read Error Rate", :threshold_value => 100, :threshold_value_worst => 100, :threshold_level => 62, :type => :pre_fail, :item => "Health percent", :updated => :always,:raw => 0, :when_failed => '-'},
      :throughput_performance => {  :id => 2, :raw_name => "Throughput_Performance", :formatted_name => "Throughput Performance", :threshold_value => 100, :threshold_value_worst => 100, :threshold_level => 40, :type => :pre_fail, :item => "Health percent", :updated => :offline,:raw => 0, :when_failed => '-'},
      :spin_up_time => { :id => 3, :raw_name => "Spin_Up_Time", :formatted_name => "Spin Up Time", :threshold_value => 220, :threshold_value_worst => 220, :threshold_level => 33, :type => :pre_fail, :item => "Health percent", :updated => :always, :raw => 1, :when_failed => '-'},
      :start_stop_count => { :id => 4, :raw_name => "Start_Stop_Count", :formatted_name => "Start Stop Count", :threshold_value => 100, :threshold_value_worst => 100, :threshold_level => 0, :type => :old_age, :item => "Count", :updated => :always, :raw => 354, :when_failed => '-'},
      :reallocated_sector_ct => { :id => 5, :raw_name => "Reallocated_Sector_Ct", :formatted_name => "Reallocated Sector Count", :threshold_value => 100, :threshold_value_worst => 100, :threshold_level => 5, :type => :pre_fail, :item => "Health percent", :updated => :always,:raw => 0, :when_failed => '-'},
      :seek_error_rate => { :id => 7, :raw_name => "Seek_Error_Rate", :formatted_name => "Seek Error Rate", :threshold_value => 100, :threshold_value_worst => 100, :threshold_level => 67, :type => :pre_fail, :item => "Health percent", :updated => :always,:raw => 0, :when_failed => '-'},
      :seek_time_performance => { :id => 8, :raw_name => "Seek_Time_Performance", :formatted_name => "Seek Time Performance", :threshold_value => 100, :threshold_value_worst => 100, :threshold_level => 40, :type => :pre_fail, :item => "Health percent", :item => "Health percent", :updated => :offline,:raw => 0, :when_failed => '-'},
      :power_on_hours => { :id => 9, :raw_name => "Power_On_Hours", :formatted_name => "Power On Hours", :threshold_value => 98, :threshold_value_worst => 98, :threshold_level => 0, :type => :old_age, :item => "Hours", :updated => :always,:raw => 1153, :when_failed => '-'},
      :spin_retry_count => { :id => 10, :raw_name => "Spin_Retry_Count", :formatted_name => "Spin Retry Count", :threshold_value => 100, :threshold_value_worst => 100, :threshold_level => 60, :type => :pre_fail, :item => "Health percent", :updated => :always,:raw => 0, :when_failed => '-'},
      :power_cycle_count => { :id => 12, :raw_name => "Power_Cycle_Count", :formatted_name => "Power Cycle Count", :threshold_value => 100, :threshold_value_worst => 100, :threshold_level => 0, :type => :old_age, :item => "Count", :updated => :always,:raw => 352, :when_failed => '-'},
      :g_sense_error_rate => { :id => 191, :raw_name => "G-Sense_Error_Rate", :formatted_name => "G-Sense Error Rate", :threshold_value => 100, :threshold_value_worst => 100, :threshold_level => 0, :type => :old_age, :item => "Rate", :updated => :always,:raw => 0, :when_failed => '-'},
      :power_off_retract_count => { :id => 192, :raw_name => "Power-Off_Retract_Count", :formatted_name => "Power-Off Retract Count", :threshold_value => 100, :threshold_value_worst => 100, :threshold_level => 0, :type => :old_age, :item => "Count", :updated => :always,:raw => 35, :when_failed => '-'},
      :load_cycle_count => { :id => 193, :raw_name => "Load_Cycle_Count", :formatted_name => "Load Cycle Count", :threshold_value => 100, :threshold_value_worst => 100, :threshold_level => 0, :type => :old_age, :item => "Count", :updated => :always,:raw => 2884, :when_failed => '-'},
      :temperature_celsius => { :id => 194, :raw_name => "Temperature_Celsius", :formatted_name => "Temperature Celsius", :threshold_value => 150, :threshold_value_worst => 150, :threshold_level => 0, :type => :old_age, :item => "Celsius", :updated => :always,:raw => 40, :when_failed => '-'},
      :reallocated_event_count => { :id => 196, :raw_name => "Reallocated_Event_Count", :formatted_name => "Reallocated Event Count", :threshold_value => 100, :threshold_value_worst => 100, :threshold_level => 0, :type => :old_age, :item => "Count", :updated => :always,:raw => 1, :when_failed => '-'},
      :current_pending_sector => { :id => 197, :raw_name => "Current_Pending_Sector", :formatted_name => "Current Pending Sector", :threshold_value => 100, :threshold_value_worst => 100, :threshold_level => 0, :type => :old_age, :item => "Count", :updated => :always,:raw => 0, :when_failed => '-'},
      :offline_uncorrectable => { :id => 198, :raw_name => "Offline_Uncorrectable", :formatted_name => "Offline Uncorrectable", :threshold_value => 100, :threshold_value_worst => 100, :threshold_level => 0, :type => :old_age, :item => "Count", :updated => :offline,:raw => 0, :when_failed => '-'},
      :udma_crc_error_count => { :id => 199, :raw_name => "UDMA_CRC_Error_Count", :formatted_name => "UDMA CRC Error Count", :threshold_value => 200, :threshold_value_worst => 200, :threshold_level => 0, :type => :old_age, :item => "Count", :updated => :always,:raw => 0, :when_failed => '-'},
      :load_retry_count => { :id => 223, :raw_name => "Load_Retry_Count", :formatted_name => "Load Retry Count", :threshold_value => 100, :threshold_value_worst => 100, :threshold_level => 0, :type => :old_age, :item => "Count", :updated => :always,:raw => 0, :when_failed => '-'}
    }.dup
  end

  def self.prefail_attribute
    self.prefail_attribute_nonfailing
  end

  def self.prefail_attribute_nonfailing
    self.attributes_list[:raw_read_error_rate]
  end

  def self.prefail_attribute_failing
    attribute = self.attributes_list[:raw_read_error_rate]
    attribute[:threshold_value] = 61
    attribute
  end

  def self.oldage_attribute
    self.attributes_list[:start_stop_count]
  end
end

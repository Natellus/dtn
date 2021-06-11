# frozen_string_literal: true

module Dtn
  module Requests
    module Historical
      # Interval datapoint requests
      class IntervalDay < Interval
        TEMPLATE =
          "HID,%<symbol>s,%<interval>d,%<days>d,%<max_datapoints>d,%<begin_filter_time>s,"\
          "%<end_filter_time>s,%<data_direction>d,%<id>d,%<datapoints_per_send>d,%<interval_type>s\r\n"

        # HID - Retrieves [Days] days of interval data for the specified [Symbol].
        #
        # Example message
        #
        #   HID,[Symbol],[Interval],[Days],[MaxDatapoints],[BeginFilterTime],[EndFilterTime],
        #   [DataDirection],[RequestID],[DatapointsPerSend],[IntervalType]<CR><LF>
        def call(symbol:, interval:, days:, **options)
          self.combined_options = defaults(**options).merge(
            {
              symbol: symbol.to_s.upcase,
              days: Integer(days) > MAX_INT16 ? MAX_INT16 : days,
              interval: Integer(interval),
              interval_type: validate_interval_type(interval_type: options[:interval_type])
            }
          )
          super
        end
      end
    end
  end
end

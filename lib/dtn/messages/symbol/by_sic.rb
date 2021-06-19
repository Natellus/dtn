# frozen_string_literal: true

module Dtn
  module Messages
    module Symbol
      # By SIC code
      class BySic < Base
        class << self
          def fields
            @fields ||= {
              request_id: :to_i,
              sic_code_id: :to_i,
              symbol: :to_s,
              listed_market_id: :to_i,
              security_type_id: :to_i,
              description: :to_s
            }
          end
        end

        def sic_code
          Dtn.sic_codes_catalog[sic_code_id]
        end
      end
    end
  end
end

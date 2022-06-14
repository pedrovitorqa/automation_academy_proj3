# frozen_string_literal: true
require 'report_builder'

at_exit do
    ReportBuilder.input_path = 'data/report/report.json'
    ReportBuilder.configure do |config|
      config.report_path = 'data/report/run'
      config.report_types = %i[html]
    end
    options = {
      report_title: 'Trila 3 QA'
    }
    ReportBuilder.build_report options
end
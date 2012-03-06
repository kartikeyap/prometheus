module Report

require 'report/rextable'
require 'report/html'
require 'report/text'

def report_firewall(firewall, analysis, output, format)

	include Report::TextReport

	report = nil
	case format.downcase
		when "text"
			report = generate_text_report(firewall, analysis)
		when "html"
			report = html_report(firewall, analysis)
		else
			raise ReportError, "Unknown report type #{type}"
	end
	save_report(output, report)
end

def save_report(output, report)
	print_status("Saving report to #{output}.")
	file = ::File.open(output, "w")
	file.write(report)
	file.close
	print_status("Report successfully written.")
end

end

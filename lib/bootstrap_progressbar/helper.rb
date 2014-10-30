module BootstrapProgressbar
  module Helper
    module Private

      def self.check_percent(percent)
        if percent < 0 || percent > 1
          throw ArgumentError.new('the percent(first argument) should between 0 to 1')
        end
      end

      # Params:
      # +percent+:: +Fixnum+ between 0 to 1.00
      # +options+::
      # alternative: ['success', 'danger', 'warning', 'info']
      # striped: boolean
      # active: boolean
      # label: boolean
      # class: a string contained more given class
      def self.only_progress_bar(percent, options = {})
        percent *= 100
        percent = percent.to_i

        case options[:alternative]
          when 'success'
          alternative = 'progress-bar-success'
          when 'danger'
          alternative = 'progress-bar-danger'
          when 'warning'
          alternative = 'progress-bar-warning'
          when 'info'
          alternative = 'progress-bar-info'
          else
          alternative = ''
        end

        if options[:active]
          striped = "progress-bar-striped active"
        elsif options[:striped]
          striped = "progress-bar-striped"
        else
          striped = ""
        end

        clazz = [options[:class], 'progress-bar', alternative, striped].join(' ').strip()
        unless options[:label]
          percent_and_label = "<span class='sr-only'>#{percent}%</span>"
        else
          percent_and_label = "#{percent}%"
        end

        style = ["width: #{percent}%", options[:style]].join().strip()
        id = " id='#{options[:id]}'" if options[:id]

        "<div class='#{clazz}'#{id} role='progressbar' aria-valuenow='#{percent}' aria-valuemin='0' aria-valuemax='100' style='#{style}'>#{percent_and_label}</div>"
      end

    end

    include Private

    # generate progress and progress-bar inside
    def progress_bar(percent, options = {})
      Private.check_percent(percent)

      clazz = [options.delete(:class), 'progress'].join(' ').strip()
      id = " id='#{options.delete(:id)}' " if options[:id]
      style = " style='#{options.delete(:style)}' " if options[:style]

      progress_bar = Private.only_progress_bar(percent, options)

      raw "<div class='#{clazz}'#{id}#{style}>#{progress_bar}</div>"
    end

    # only generate the progress-bar
    def simple_progress_bar(percent, options = {})
      Private.check_percent(percent)
      raw Private.only_progress_bar(percent, options)
    end

  end
end

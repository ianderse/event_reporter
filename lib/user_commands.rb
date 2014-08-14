module UserCommands
  attr_reader :command, :attribute, :criteria, :criteria_two

  def process_user_commands
    @command = @choice[0]
    @attribute = @choice[1]
    @criteria = @choice[2]
    @criteria_two = @choice[3]

    case
    when command == 'help' || command == 'h'
      help(attribute)
    when command == 'load'
      load_command
    when command == 'find'
      find_command
    when command == 'queue'
      queue_command
    when quit?
      @messenger.quit
      # return 0
    else @messenger.invalid_command
    end
  end

  def load_command
    if @attribute == nil
      loader
    else
      loader(@attribute)
    end
  end

  def queue_command
    case attribute
    when nil
      @messenger.invalid_queue_command
    when 'print'
      queue_print
    when 'count'
      @messenger.queue_size(@queue.results)
    when 'clear'
      @queue.clear
      @messenger.queue_cleared
    when 'save'
      queue_save
    end
  end

  def queue_print
    if criteria.nil?
      @messenger.print_queue(@queue)
    elsif criteria == 'by'
      queue_print_by
    end
  end

  def queue_print_by
    if has_directory_methods? && directory_is_populated?
      @messenger.print_sorted_queue(@queue, criteria_two)
    else
      @messenger.invalid_print
    end
  end

  def has_directory_methods?
    @directory.directory.first.methods.include?(criteria_two.to_sym)
  end

  def queue_save
    if criteria != 'as'
      @messenger.invalid_save
    else
      @queue.save(criteria_two)
      @messenger.queue_saved
    end
  end

  def directory_is_populated?
    @directory.directory != nil
  end

  def find_command
    if attribute == nil
      @messenger.invalid_find
    else
      directory_is_populated? ? find_by : @messenger.no_directory_loaded
    end
  end

  def find_by
    element = @choice[2..-1].join(' ')

    if @directory.find_by(attribute.to_sym, element) != "invalid"
      @queue.results = @directory.find_by(attribute.to_sym, element)
      @messenger.queue_loaded
    else
      @messenger.invalid_search
    end

  end

  def loader(file_name = "event_attendees.csv")
    #!@directory.file_exist?("data/" +"#{file_name}")? ? @messenger.file_does_not_exist : begin @directory.load_content(file_name); @messenger.content_loaded end

    if !@directory.file_exist?("data/" +"#{file_name}")
      @messenger.file_does_not_exist
    else
      @directory.load_content(file_name)
      @messenger.content_loaded
    end
  end

  def help(param)
    case param
    when nil
      @messenger.list_commands
    when "queue"
      help_queue
    when "load"
      @messenger.explain_load
    when "find"
      @messenger.explain_find
    end
  end

  def help_queue
    if criteria_two != nil
      param = criteria + criteria_two
    else
      param = criteria
    end

    case param
    when nil
      @messenger.explain_queue
    when 'count'
      @messenger.explain_queue_count
    when 'printby'
      @messenger.explain_queue_print_by
    when 'print'
      @messenger.explain_queue_print
    when 'clear'
      @messenger.explain_queue_clear
    when 'saveto'
      @messenger.explain_queue_save_to
    else
      @messenger.does_not_exist
    end

  end
end

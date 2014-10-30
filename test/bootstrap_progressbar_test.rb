require 'test_helper'

class BootstrapProgressbarTest < ActionView::TestCase
  include BootstrapProgressbar::Helper

  test "check percent: the percent should between 0 to 1" do
    begin
      progress_bar(2)
    rescue ArgumentError => e
      assert_equal 'uncaught throw #<ArgumentError: the percent(first argument) should between 0 to 1>', e.message
    end
  end

  test "generate progress bar ok" do
    result = progress_bar(0.5)
    assert_equal "<div class='progress'><div class='progress-bar' role='progressbar' aria-valuenow='50' aria-valuemin='0' aria-valuemax='100' style='width: 50%'><span class='sr-only'>50%</span></div></div>", result
  end

  test "generate progress bar with label" do
    result = progress_bar(0.5, label: true)
    assert_equal "<div class='progress'><div class='progress-bar' role='progressbar' aria-valuenow='50' aria-valuemin='0' aria-valuemax='100' style='width: 50%'>50%</div></div>", result
  end

  test "generate progress bar with alternative: success" do
    result = progress_bar(0.5, alternative: 'success')
    assert_equal "<div class='progress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='50' aria-valuemin='0' aria-valuemax='100' style='width: 50%'><span class='sr-only'>50%</span></div></div>", result
  end

  test "generate progress bar with alternative: info" do
    result = progress_bar(0.5, alternative: 'info')
    assert_equal "<div class='progress'><div class='progress-bar progress-bar-info' role='progressbar' aria-valuenow='50' aria-valuemin='0' aria-valuemax='100' style='width: 50%'><span class='sr-only'>50%</span></div></div>", result
  end

  test "generate progress bar with alternative: danger" do
    result = progress_bar(0.5, alternative: 'danger')
    assert_equal "<div class='progress'><div class='progress-bar progress-bar-danger' role='progressbar' aria-valuenow='50' aria-valuemin='0' aria-valuemax='100' style='width: 50%'><span class='sr-only'>50%</span></div></div>", result
  end

  test "generate progress bar with alternative: warning" do
    result = progress_bar(0.5, alternative: 'warning')
    assert_equal "<div class='progress'><div class='progress-bar progress-bar-warning' role='progressbar' aria-valuenow='50' aria-valuemin='0' aria-valuemax='100' style='width: 50%'><span class='sr-only'>50%</span></div></div>", result
  end

  test "support striped progress bar" do
    result = progress_bar(0.5, alternative: 'success', striped: true)
    assert_equal "<div class='progress'><div class='progress-bar progress-bar-success progress-bar-striped' role='progressbar' aria-valuenow='50' aria-valuemin='0' aria-valuemax='100' style='width: 50%'><span class='sr-only'>50%</span></div></div>", result
  end

  test "support active, striped progress bar" do
    # set active true will also set striped true
    result = progress_bar(0.5, alternative: 'success', active: true)
    assert_equal "<div class='progress'><div class='progress-bar progress-bar-success progress-bar-striped active' role='progressbar' aria-valuenow='50' aria-valuemin='0' aria-valuemax='100' style='width: 50%'><span class='sr-only'>50%</span></div></div>", result
  end

  test "support adding extra class to progress" do
    # you can add min-width css rule for class more
    result = progress_bar(0.5, class: 'more')
    assert_equal "<div class='more progress'><div class='progress-bar' role='progressbar' aria-valuenow='50' aria-valuemin='0' aria-valuemax='100' style='width: 50%'><span class='sr-only'>50%</span></div></div>", result
  end

  # simple_progress_bar support all options for progress_bar
  test "use simple_progress_bar to generate simple progress-bar" do
    # so that stacked progress bars can be supported
    result = simple_progress_bar(0.5)
    assert_equal "<div class='progress-bar' role='progressbar' aria-valuenow='50' aria-valuemin='0' aria-valuemax='100' style='width: 50%'><span class='sr-only'>50%</span></div>", result
  end

  test "support adding extra class to progress-bar" do
    result = simple_progress_bar(0.5, class: 'more')
    assert_equal "<div class='more progress-bar' role='progressbar' aria-valuenow='50' aria-valuemin='0' aria-valuemax='100' style='width: 50%'><span class='sr-only'>50%</span></div>", result
  end

  test "support selecting an id for progress-bar" do
    result = simple_progress_bar(0.5, id: 'this-progress-bar')
    assert_equal "<div class='progress-bar' id='this-progress-bar' role='progressbar' aria-valuenow='50' aria-valuemin='0' aria-valuemax='100' style='width: 50%'><span class='sr-only'>50%</span></div>", result
  end

  test "support selecting an id for progress" do
    result = progress_bar(0.5, id: 'this-progress')
    assert_equal "<div class='progress' id='this-progress' ><div class='progress-bar' role='progressbar' aria-valuenow='50' aria-valuemin='0' aria-valuemax='100' style='width: 50%'><span class='sr-only'>50%</span></div></div>", result
  end

  test "support defining style for progress" do
    result = progress_bar(0.5, style: 'min-width: 20px;')
    assert_equal "<div class='progress' style='min-width: 20px;' ><div class='progress-bar' role='progressbar' aria-valuenow='50' aria-valuemin='0' aria-valuemax='100' style='width: 50%'><span class='sr-only'>50%</span></div></div>", result
  end

end

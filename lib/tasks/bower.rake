require 'json'

namespace :bower do
  # desc "updates JS version references in README and VERSION files"
  # task :bump do
  #   bump_readme_file
  #   bump_version_file
  # end

  desc 'updates javascripts from bower package manager'
  task :update do
    puts `bower install https://github.com/daviscabral/gentelella.git#1.4.1 --save`
  end

  desc 'vendors javascripts and stylesheets for rails assets pipeline'
  task :vendor do
    Dir.glob('bower_components/gentelella/vendors/google-code-prettify/src/*.js') { |fn| cp_asset fn, 'prettify' }
    Dir.glob('bower_components/gentelella/vendors/google-code-prettify/src/*.css') { |fn| cp_asset fn, 'prettify' }
    Dir.glob('bower_components/gentelella/vendors/DateJS/build/*.js') do |fn|
      cp_asset fn, 'DateJS' unless File.basename(fn) == 'date.js'
    end
    cp_asset 'bower_components/gentelella/vendors/DateJS/build/date.js', 'DateJS', 'core.js'

    cp_js_assets 'bower_components/gentelella/vendors/jqvmap/dist/maps', 'jqvmap/maps'

    cp_asset 'bower_components/gentelella/vendors/autosize/dist/autosize.js'
    cp_asset 'bower_components/gentelella/vendors/bootstrap-progressbar/bootstrap-progressbar.js'
    cp_asset 'bower_components/gentelella/vendors/bootstrap-progressbar/scss/bootstrap-progressbar-3.3.0-3.x.x.scss'
    cp_asset 'bower_components/gentelella/vendors/bootstrap-wysiwyg/css/style.css', nil, 'bootstrap-wysiwyg.css'
    cp_asset 'bower_components/gentelella/vendors/bootstrap-wysiwyg/src/bootstrap-wysiwyg.js'
    cp_asset 'bower_components/gentelella/vendors/Chart.js/dist/Chart.js'

    cp_asset 'bower_components/gentelella/vendors/cropperjs/dist/cropper.css'
    cp_asset 'bower_components/gentelella/vendors/cropperjs/dist/cropper.js'
    cp_asset 'bower_components/gentelella/vendors/jquery-cropper/dist/jquery-cropper.js'

    cp_asset 'bower_components/gentelella/vendors/datatables.net-bs/css/dataTables.bootstrap.css', 'data-tables', 'net-bs.bootstrap.css'
    cp_asset 'bower_components/gentelella/vendors/datatables.net-bs/js/dataTables.bootstrap.js', 'data-tables', 'net-bs.bootstrap.js'
    cp_asset 'bower_components/gentelella/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.css', 'data-tables', 'net-buttons-bs.buttons.css'
    cp_asset 'bower_components/gentelella/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.js', 'data-tables', 'net-buttons-bs.buttons.js'
    cp_asset 'bower_components/gentelella/vendors/datatables.net-buttons/js/buttons.flash.js', 'data-tables', 'net-buttons.buttons.flash.js'
    cp_asset 'bower_components/gentelella/vendors/datatables.net-buttons/js/buttons.html5.js', 'data-tables', 'net-buttons.buttons.html5.js'
    cp_asset 'bower_components/gentelella/vendors/datatables.net-buttons/js/buttons.print.js', 'data-tables', 'net-buttons.buttons.print.js'
    cp_asset 'bower_components/gentelella/vendors/datatables.net-buttons/js/dataTables.buttons.js', 'data-tables', 'net-buttons.buttons.js'
    cp_asset 'bower_components/gentelella/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.css', 'data-tables', 'net-fixedheader-bs.bootstrap.css'
    cp_asset 'bower_components/gentelella/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.js', 'data-tables', 'net-fixedheader.js'
    cp_asset 'bower_components/gentelella/vendors/datatables.net-keytable/js/dataTables.keyTable.js', 'data-tables', 'net-keytable.js'
    cp_asset 'bower_components/gentelella/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.css', 'data-tables', 'net-responsive-bs.bootstrap.css'
    cp_asset 'bower_components/gentelella/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js', 'data-tables', 'net-responsive-bs.js'
    cp_asset 'bower_components/gentelella/vendors/datatables.net-responsive/js/dataTables.responsive.js', 'data-tables', 'net-responsive.js'
    cp_asset 'bower_components/gentelella/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.css', 'data-tables', 'net-scroller-bs.bootstrap.css'
    cp_asset 'bower_components/gentelella/vendors/datatables.net-scroller/js/dataTables.scroller.js', 'data-tables', 'net-scroller.js'
    cp_asset 'bower_components/gentelella/vendors/datatables.net/js/jquery.dataTables.js', 'data-tables', 'jquery.dataTables.js'
    cp_asset 'bower_components/gentelella/vendors/devbridge-autocomplete/dist/jquery.autocomplete.js'
    cp_asset 'bower_components/gentelella/vendors/echarts/dist/echarts.js'
    cp_asset 'bower_components/gentelella/vendors/echarts/map/js/world.js', nil, 'echarts.map.world.js'
    cp_asset 'bower_components/gentelella/vendors/flot-spline/js/jquery.flot.spline.js'
    cp_asset 'bower_components/gentelella/vendors/flot.curvedlines/curvedLines.js', nil, 'jquery.flot.curved_lines.js'
    cp_asset 'bower_components/gentelella/vendors/flot.orderbars/js/jquery.flot.orderBars.js', nil, 'jquery.flot.order_bars.js'
    cp_asset 'bower_components/gentelella/vendors/fullcalendar/dist/fullcalendar.css'
    cp_asset 'bower_components/gentelella/vendors/fullcalendar/dist/fullcalendar.js'
    cp_asset 'bower_components/gentelella/vendors/fullcalendar/dist/fullcalendar.print.css'
    cp_asset 'bower_components/gentelella/vendors/gauge.js/dist/gauge.coffee'
    cp_asset 'bower_components/gentelella/vendors/jquery-knob/js/jquery.knob.js'
    cp_asset 'bower_components/gentelella/vendors/jquery-mousewheel/jquery.mousewheel.js'
    cp_asset 'bower_components/gentelella/vendors/jQuery-Smart-Wizard/js/jquery.smartWizard.js'
    cp_asset 'bower_components/gentelella/vendors/jquery-sparkline/dist/jquery.sparkline.js'
    cp_asset 'bower_components/gentelella/vendors/jquery.easy-pie-chart/dist/jquery.easypiechart.js'
    cp_asset 'bower_components/gentelella/vendors/jquery.hotkeys/jquery.hotkeys.js'
    cp_asset 'bower_components/gentelella/vendors/jquery.inputmask/dist/jquery.inputmask.bundle.js', nil, 'jquery.inputmask.js'
    cp_asset 'bower_components/gentelella/vendors/jquery.tagsinput/src/jquery.tagsinput.js'
    cp_asset 'bower_components/gentelella/vendors/jqvmap/dist/jquery.vmap.js'
    cp_asset 'bower_components/gentelella/vendors/jqvmap/dist/jqvmap.css'
    cp_asset 'bower_components/gentelella/vendors/jszip/dist/jszip.js'
    cp_asset 'bower_components/gentelella/vendors/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js'
    cp_asset 'bower_components/gentelella/vendors/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.css'
    cp_asset 'bower_components/gentelella/vendors/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.js'
    cp_asset 'bower_components/gentelella/vendors/moment/min/moment-with-locales.js'
    cp_asset 'bower_components/gentelella/vendors/morris.js/morris.css'
    cp_asset 'bower_components/gentelella/vendors/morris.js/morris.js'
    cp_asset 'bower_components/gentelella/vendors/parsleyjs/dist/parsley.js.map'
    cp_asset 'bower_components/gentelella/vendors/pdfmake/build/pdfmake.js'
    cp_asset 'bower_components/gentelella/vendors/pdfmake/build/vfs_fonts.js'
    cp_asset 'bower_components/gentelella/vendors/pnotify/dist/pnotify.buttons.css'
    cp_asset 'bower_components/gentelella/vendors/pnotify/dist/pnotify.buttons.js'
    cp_asset 'bower_components/gentelella/vendors/pnotify/dist/pnotify.css'
    cp_asset 'bower_components/gentelella/vendors/pnotify/dist/pnotify.js'
    cp_asset 'bower_components/gentelella/vendors/pnotify/dist/pnotify.nonblock.css'
    cp_asset 'bower_components/gentelella/vendors/pnotify/dist/pnotify.nonblock.js'
    cp_asset 'bower_components/gentelella/vendors/raphael/raphael.js'
    cp_asset 'bower_components/gentelella/vendors/skycons/skycons.js'
    cp_asset 'bower_components/gentelella/vendors/starrr/dist/starrr.css'
    cp_asset 'bower_components/gentelella/vendors/starrr/dist/starrr.js'
    cp_asset 'bower_components/gentelella/vendors/transitionize/dist/transitionize.js'
    cp_asset 'bower_components/gentelella/vendors/validator/validator.js'
  end
end

def version_from_bower
  data = JSON.load File.read 'bower_components/gentelella/.bower.json'
  data['version']
end

def gem_path
  File.dirname(File.expand_path(File.join(__FILE__, '..', '..')))
end

def assets_path
  File.join(gem_path, 'assets')
end

def javascripts_path
  File.join(assets_path, 'javascripts')
end

def stylesheets_path
  File.join(assets_path, 'stylesheets')
end

def cp_js_assets(src, dest)
  puts [src, dest].join("\t")
  src_path = src + '/'
  dest_path = File.join(javascripts_path, dest) + '/'
  FileUtils.mkdir_p dest_path
  puts `rsync -rav #{src_path} #{dest_path}`
end

def cp_asset(filename, sub_folder = nil, new_name = nil)
  base_filename = File.basename(filename)
  assets_folder = base_filename.include?('.js') || base_filename.include?('.coffee') ? 'javascripts' : 'stylesheets'
  assets_folder += "/#{sub_folder}" if sub_folder
  puts 'vendoring ' + base_filename
  assets_folder = "assets/#{assets_folder}"
  FileUtils.mkdir_p assets_folder
  FileUtils.cp filename, File.join(assets_folder, (new_name || base_filename))
end

def bump_readme_file
  latest_version = "bundled by this gem is [#{version_from_bower}]"
  lines = File.read('README.md')
  File.open('README.md', 'w') { |f| f.puts lines.gsub(README_VERSION_REGEXP, latest_version) }
end

def bump_version_file
  version_filename = File.join('lib', 'medium-editor', 'version.rb')
  latest_version = "MEDIUM_EDITOR_VERSION = '#{version_from_bower}'"
  lines = File.read(version_filename)
  File.open(version_filename, 'w') { |f| f.puts lines.gsub(VERSION_FILE_REGEXP, latest_version) }
end

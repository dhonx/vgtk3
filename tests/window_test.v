import gtk

fn test_window_title() {
	window := gtk.new_window()
	window.set_title('gtk window')
	assert window.get_title() == 'gtk window'
	window.show()
	gtk.main_quit()
}

fn test_window_size() {
	window := gtk.new_window()
	window.set_default_size(500, 250)
	w, h := window.get_default_size()
	assert w == 500
	assert h == 250
	window.show()
	gtk.main_quit()
}

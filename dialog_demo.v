module main

import gtk
import gdk

fn main() {
	// a := gtk.VERSION
	// println(a)
	// a := C.GTK_RESPONSE_NONE
	window := gtk.new_window()
	window.set_title('Main window')
	window.set_default_size(500, 250)

	dialog := gtk.new_dialog_from_parent('Dialog', window, .modal)
	dialog.set_default_size(150, 150)
	dialog.add_button('_CANCEL', .cancel)
	dialog.add_button('_OK', .yes)

	button := gtk.new_button_with_label('Show Dialog')
	button.on('clicked', on_btn_show_dialog_clicked, &dialog)

	window.add(button)

	window.show_all()
	gtk.main()
}

[inline]
fn num(num int) int {
	mut c := 0
	if num > 0 {
		c++
	}
	return c
}

fn on_btn_show_dialog_clicked(button gtk.Button, data voidptr) {
	dialog := &gtk.Dialog(data)

	label := gtk.new_label('Are you sure want to quit?')
	box := dialog.get_content_area()

	println(num(-1))

	label.show()
	res := dialog.run()

	if res == gtk.ResponseType.yes {
		println('Yes')
		gtk.main_quit()
	} else {
		println('Cancel')
		dialog.hide()
	}
}

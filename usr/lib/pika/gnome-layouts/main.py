import gi
gi.require_version("Gtk", "3.0")
from gi.repository import Gtk, Gio
import subprocess
import os
import os.path
from pathlib import Path

import time
import threading

class Application:
    
    ### MAIN WINDOW ###
    def __init__(self):
        self.column_names = False
        self.drop_nan = False
        self.df = None
        application_id="org.pika.layouts"
        
        self.builder = Gtk.Builder()
        self.builder.add_from_file("/usr/lib/pika/gnome-layouts/main.ui")
        self.builder.connect_signals(self)
        win = self.builder.get_object("main_window")
    
        
        ### Enable Extensions
        
        subprocess.run(["gsettings set org.gnome.shell disable-user-extensions false"], shell=True, stdout=subprocess.DEVNULL)
        
        accent_box = self.builder.get_object("accent_box")
        
        accent_output = subprocess.run(["dconf read /org/pika/layouts/pika-theme | grep 1"], shell=True)
        
        if (accent_output.returncode) != 0:
            accent_box.hide()
        
        ### Window props ###
        
        win.connect("destroy", Gtk.main_quit)
        
        self.window = self.builder.get_object("main_window")
        self.window.show()
        
        settings = Gio.Settings.new("org.pika.layouts")
        
        
        ### Themes
    def on_pika_theme_button_pressed(self, widget):
        accent_box = self.builder.get_object("accent_box")
        subprocess.run(["/usr/lib/pika/gnome-layouts/theme.sh pika"], shell=True)
        accent_box.show()
    def on_gnome_theme_button_pressed(self, widget):
        accent_box = self.builder.get_object("accent_box")
        subprocess.run(["/usr/lib/pika/gnome-layouts/theme.sh gnome"], shell=True)
        accent_box.hide()
        
        
        if settings.get_int("layout-num") == 1:
            win10toggle = self.builder.get_object("win10_button")
            win10toggle.set_active(True)
        
        if settings.get_int("layout-num") == 2:
            win11toggle = self.builder.get_object("win11_button")
            win11toggle.set_active(True)       

        if settings.get_int("layout-num") == 3:
            gnometoggle = self.builder.get_object("gnome_button")
            gnometoggle.set_active(True)
            
        if settings.get_int("layout-num") == 4:
            macostoggle = self.builder.get_object("macos_button")
            macostoggle.set_active(True)
        if settings.get_int("layout-num") == 5:
            macostoggle = self.builder.get_object("gnome2_button")
            macostoggle.set_active(True)
        if settings.get_int("layout-num") == 6:
            macostoggle = self.builder.get_object("unity_button")
            macostoggle.set_active(True)

    ### Layouts ###
    
    def on_win10_button_pressed(self, widget):
        settings = Gio.Settings.new("org.pika.layouts")
        settings.set_int("layout-num", 1)
        subprocess.run(["/usr/lib/pika/gnome-layouts/layout-scripts/win10.sh"], shell=True)
        
    def on_win11_button_pressed(self, widget):
        settings = Gio.Settings.new("org.pika.layouts")
        settings.set_int("layout-num", 2)
        subprocess.run(["/usr/lib/pika/gnome-layouts/layout-scripts/win11.sh"], shell=True)        
    def on_gnome_button_pressed(self, widget):
        settings = Gio.Settings.new("org.pika.layouts")
        settings.set_int("layout-num", 3)
        subprocess.run(["/usr/lib/pika/gnome-layouts/layout-scripts/reset.sh"], shell=True)   
    def on_macos_button_pressed(self, widget):
        settings = Gio.Settings.new("org.pika.layouts")
        settings.set_int("layout-num", 4)
        subprocess.run(["/usr/lib/pika/gnome-layouts/layout-scripts/macos.sh"], shell=True)   
    def on_gnome2_button_pressed(self, widget):
        settings = Gio.Settings.new("org.pika.layouts")
        settings.set_int("layout-num", 5)
        subprocess.run(["/usr/lib/pika/gnome-layouts/layout-scripts/gnome2.sh"], shell=True)   
    def on_unity_button_pressed(self, widget):
        settings = Gio.Settings.new("org.pika.layouts")
        settings.set_int("layout-num", 6)
        subprocess.run(["/usr/lib/pika/gnome-layouts/layout-scripts/unity.sh"], shell=True)   
    ### Settings ###
    
    ### Accent Colors

    def blue_accent_button_pressed_cb (self, widget):
        subprocess.run(["/usr/lib/pika/gnome-layouts/dconf-accent.sh Blue"], shell=True)
        subprocess.run(["pkexec /usr/lib/pika/gnome-layouts/papirus-folders -u -C blue"], shell=True)
        subprocess.run(["echo 'theme change done!'"], shell=True)
    def green_accent_button_pressed_cb (self, widget):
        subprocess.run(["/usr/lib/pika/gnome-layouts/dconf-accent.sh Green"], shell=True)
        subprocess.run(["pkexec /usr/lib/pika/gnome-layouts/papirus-folders -u -C green"], shell=True)
        subprocess.run(["echo 'theme change done!'"], shell=True)
    def yellow_accent_button_pressed_cb (self, widget):
        subprocess.run(["/usr/lib/pika/gnome-layouts/dconf-accent.sh Yellow"], shell=True)
        subprocess.run(["pkexec /usr/lib/pika/gnome-layouts/papirus-folders -u -C yellow"], shell=True)
        subprocess.run(["echo 'theme change done!'"], shell=True)
    def orange_accent_button_pressed_cb (self, widget):
        subprocess.run(["/usr/lib/pika/gnome-layouts/dconf-accent.sh Orange"], shell=True)
        subprocess.run(["pkexec /usr/lib/pika/gnome-layouts/papirus-folders -u -C orange"], shell=True)
        subprocess.run(["echo 'theme change done!'"], shell=True)
    def red_accent_button_pressed_cb (self, widget):
        subprocess.run(["/usr/lib/pika/gnome-layouts/dconf-accent.sh Red"], shell=True)
        subprocess.run(["pkexec /usr/lib/pika/gnome-layouts/papirus-folders -u -C red"], shell=True)
        subprocess.run(["echo 'theme change done!'"], shell=True)
    def pink_accent_button_pressed_cb (self, widget):
        subprocess.run(["/usr/lib/pika/gnome-layouts/dconf-accent.sh Pink"], shell=True)
        subprocess.run(["pkexec /usr/lib/pika/gnome-layouts/papirus-folders -u -C pink"], shell=True)
        subprocess.run(["echo 'theme change done!'"], shell=True)
    def purple_accent_button_pressed_cb (self, widget):
        subprocess.run(["/usr/lib/pika/gnome-layouts/dconf-accent.sh Purple"], shell=True)
        subprocess.run(["pkexec /usr/lib/pika/gnome-layouts/papirus-folders -u -C violet"], shell=True)
        subprocess.run(["echo 'theme change done!'"], shell=True)
    def teal_accent_button_pressed_cb (self, widget):
        subprocess.run(["/usr/lib/pika/gnome-layouts/dconf-accent.sh Teal"], shell=True)
        subprocess.run(["pkexec /usr/lib/pika/gnome-layouts/papirus-folders -u -C teal"], shell=True)
        subprocess.run(["echo 'theme change done!'"], shell=True)
    def gray_accent_button_pressed_cb (self, widget):
        subprocess.run(["/usr/lib/pika/gnome-layouts/dconf-accent.sh Grey"], shell=True)
        subprocess.run(["pkexec /usr/lib/pika/gnome-layouts/papirus-folders -u -C grey"], shell=True)
        subprocess.run(["echo 'theme change done!'"], shell=True)
    
Application()
Gtk.main()

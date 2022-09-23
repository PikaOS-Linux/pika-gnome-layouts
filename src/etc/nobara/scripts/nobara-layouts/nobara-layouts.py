import gi
gi.require_version("Gtk", "3.0")
from gi.repository import Gtk, Gio
import subprocess
import os
import os.path
from pathlib import Path

class Application:
    
    ### MAIN WINDOW ###
    def __init__(self):
        self.column_names = False
        self.drop_nan = False
        self.df = None
        application_id="org.nobara.layouts"
        
        self.builder = Gtk.Builder()
        self.builder.add_from_file("/etc/nobara/scripts/nobara-layouts/nobara-layouts.ui")
        self.builder.connect_signals(self)
        win = self.builder.get_object("main_window")
        win.connect("destroy", Gtk.main_quit)
        
        self.window = self.builder.get_object("main_window")
        self.window.show()
        
        settings = Gio.Settings.new("org.nobara.layouts")
        
        print(settings.get_int("layout-num"))
        
        
        win10toggle = self.builder.get_object("win10_button")
        
        win10toggle.set_active(True)
        win10toggle.pressed()
        
    ### Layouts ###
    
        def test1(self, widget):
            print("test1")
            settings = Gio.Settings.new("org.nobara.layouts")
            settings.set_int("layout-num", 3)
        def test2(self, widget):
            print("test2")
        def test3(self, widget):
            print("test3")
        def test4(self, widget):
            print("test4")
        
    ### Settings ###
    
    #### Desktop Switch ####
        
        desktop_switch = self.builder.get_object("desktop_switch")
        
        desktop_output = subprocess.run(["gsettings get org.gnome.shell enabled-extensions | grep ding@rastersoft.com"], shell=True)
    
        if (desktop_output.returncode) == 0:
            desktop_switch.set_active(True)
        
    def on_desktop_switch_active_notify(self, switch, state):
        if switch.get_active() == True :
            subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/desktop.sh"], shell=True)
    
Application()
Gtk.main()

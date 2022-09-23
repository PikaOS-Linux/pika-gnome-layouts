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
    
    #### Audio Switch ####
        
        audio_switch = self.builder.get_object("audio_switch")
        
        audio_output = subprocess.run(["gsettings get org.gnome.shell enabled-extensions | grep volume-mixer@evermiss.net"], shell=True)
    
        if (audio_output.returncode) == 0:
            audio_switch.set_active(True)
        
    def on_audio_switch_active_notify(self, switch, state):
        if switch.get_active() == True :
            subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/audio.sh"], shell=True)

    #### Blur Switch ####
        
        blur_switch = self.builder.get_object("blur_switch")
        
        blur_output = subprocess.run(["gsettings get org.gnome.shell enabled-extensions | grep blur-my-shell@aunetx"], shell=True)
    
        if (blur_output.returncode) == 0:
            blur_switch.set_active(True)
        
    def on_blur_switch_active_notify(self, switch, state):
        if switch.get_active() == True :
            subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/blur.sh"], shell=True)

    #### Tray Switch ####
        
        tray_switch = self.builder.get_object("tray_switch")
        
        tray_output = subprocess.run(["gsettings get org.gnome.shell enabled-extensions | grep trayIconsReloaded@selfmade.pl"], shell=True)
    
        if (tray_output.returncode) == 0:
            tray_switch.set_active(True)
        
    def on_tray_switch_active_notify(self, switch, state):
        if switch.get_active() == True :
            subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/tray.sh"], shell=True)

    #### workspace Switch ####
        
        workspace_switch = self.builder.get_object("workspace_switch")
        
        workspace_output = subprocess.run(["gsettings get org.gnome.shell enabled-extensions | grep auto-move-windows@gnome-shell-extensions.gcampax.github.com"], shell=True)
    
        if (workspace_output.returncode) == 0:
            workspace_switch.set_active(True)
        
    def on_workspace_switch_active_notify(self, switch, state):
        if switch.get_active() == True :
            subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/workspace.sh"], shell=True)
            
            

Application()
Gtk.main()

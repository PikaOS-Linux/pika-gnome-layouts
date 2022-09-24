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
    
        def on_win10_button_pressed(self, widget):
            settings = Gio.Settings.new("org.nobara.layouts")
            settings.set_int("layout-num", 1)
        def test2(self, widget):
            print("test2")
        def test3(self, widget):
            print("test3")
        def test4(self, widget):
            print("test4")
        
    ### Settings ###
        
        
        desktop_switch = self.builder.get_object("desktop_switch")
        desktop_output = subprocess.run(["gsettings get org.gnome.shell enabled-extensions | grep ding@rastersoft.com"], shell=True)
        if (desktop_output.returncode) == 0:
            desktop_switch.set_active(True)
        
        audio_switch = self.builder.get_object("audio_switch")
        audio_output = subprocess.run(["gsettings get org.gnome.shell enabled-extensions | grep volume-mixer@evermiss.net"], shell=True)
        if (audio_output.returncode) == 0:
            audio_switch.set_active(True)
        
        blur_switch = self.builder.get_object("blur_switch")
        blur_output = subprocess.run(["gsettings get org.gnome.shell enabled-extensions | grep blur-my-shell@aunetx"], shell=True)
        if (blur_output.returncode) == 0:
            blur_switch.set_active(True)
        
        tray_switch = self.builder.get_object("tray_switch")
        tray_output = subprocess.run(["gsettings get org.gnome.shell enabled-extensions | grep trayIconsReloaded@selfmade.pl"], shell=True)
        if (tray_output.returncode) == 0:
            tray_switch.set_active(True)
            
        workspace_switch = self.builder.get_object("workspace_switch")
        workspace_output = subprocess.run(["gsettings get org.gnome.shell enabled-extensions | grep auto-move-windows@gnome-shell-extensions.gcampax.github.com"], shell=True)
        if (workspace_output.returncode) == 0:
            workspace_switch.set_active(True)
            
                
        x11_switch = self.builder.get_object("x11_switch")
        x11_output = subprocess.run(["gsettings get org.gnome.shell enabled-extensions | grep x11gestures@joseexposito.github.io"], shell=True)
        if (x11_output.returncode) == 0:
            x11_switch.set_active(True)
        
                
        clipboard_switch = self.builder.get_object("clipboard_switch")
        clipboard_output = subprocess.run(["gsettings get org.gnome.shell enabled-extensions | grep gnome-clipboard@b00f.github.io"], shell=True)
        if (clipboard_output.returncode) == 0:
            clipboard_switch.set_active(True)
        
        supergfxctl_switch = self.builder.get_object("supergfxctl_switch")
        supergfxctl_output = subprocess.run(["gsettings get org.gnome.shell enabled-extensions | grep supergfxctl-gex@asus-linux.org"], shell=True)
        if (supergfxctl_output.returncode) == 0:
            supergfxctl_switch.set_active(True)
            
        caffeine_switch = self.builder.get_object("caffeine_switch")
        caffeine_output = subprocess.run(["gsettings get org.gnome.shell enabled-extensions | grep espresso@coadmunkee.github.com"], shell=True)
        if (caffeine_output.returncode) == 0:
            caffeine_switch.set_active(True)


        kde_switch = self.builder.get_object("kde_switch")
        kde_output = subprocess.run(["gsettings get org.gnome.shell enabled-extensions | grep gsconnect@andyholmes.github.io"], shell=True)
        if (kde_output.returncode) == 0:
            kde_switch.set_active(True)


        weather_switch = self.builder.get_object("weather_switch")
        weather_output = subprocess.run(["gsettings get org.gnome.shell enabled-extensions | grep openweather-extension@jenslody.de"], shell=True)
        if (weather_output.returncode) == 0:
            weather_switch.set_active(True)


        spacebar_switch = self.builder.get_object("spacebar_switch")
        spacebar_output = subprocess.run(["gsettings get org.gnome.shell enabled-extensions | grep space-bar@luchrioh"], shell=True)
        if (spacebar_output.returncode) == 0:
            spacebar_switch.set_active(True)
            
        
        stats_switch = self.builder.get_object("stats_switch")
        stats_output = subprocess.run(["gsettings get org.gnome.shell enabled-extensions | grep Vitals@CoreCoding.com"], shell=True)
        if (stats_output.returncode) == 0:
            stats_switch.set_active(True)
        
        
        hid_switch = self.builder.get_object("hid_switch")
        hid_output = subprocess.run(["gsettings get org.gnome.shell enabled-extensions | grep wireless-hid@chlumskyvaclav.gmail.com"], shell=True)
        if (hid_output.returncode) == 0:
            hid_switch.set_active(True)


    #### Desktop Switch ####
    def on_desktop_switch_active_notify(self, switch, state):
        if switch.get_active() == True :
            subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/desktop.sh"], shell=True)
    pass
    #### Audio Switch ####
    def on_audio_switch_active_notify(self, switch, state):
        if switch.get_active() == True :
                subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/audio.sh"], shell=True)
    pass
    #### Blur Switch ####  
    def on_blur_switch_active_notify(self, switch, state):
        if switch.get_active() == True :
            subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/blur.sh"], shell=True)
    pass
    #### Tray Switch ####  
    def on_tray_switch_active_notify(self, switch, state):
        if switch.get_active() == True :
            subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/tray.sh"], shell=True)
    pass
    #### workspace Switch ####
    def on_workspace_switch_active_notify(self, switch, state):
        if switch.get_active() == True :
                subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/workspace.sh"], shell=True)
    pass
    #### x11 Switch ####
    def on_x11_switch_active_notify(self, switch, state):
        if switch.get_active() == True :
                subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/x11.sh"], shell=True)
    pass
    #### clipboard Switch ####
    def on_clipboard_switch_active_notify(self, switch, state):
        if switch.get_active() == True :
                subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/clipboard.sh"], shell=True)
    pass
    #### caffeine Switch ####
    def on_caffeine_switch_active_notify(self, switch, state):
        if switch.get_active() == True:
                subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/caffeine.sh"], shell=True)
    pass
    #### supergfxctl Switch ####
    def on_supergfxctl_switch_active_notify(self, switch, state):
        if switch.get_active() == True:
            subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/supergfxctl.sh"], shell=True)
    pass
    #### kde Switch ####
    def on_kde_switch_active_notify(self, switch, state):
        if switch.get_active() == True:
                subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/kde.sh"], shell=True)
    pass
    #### weather Switch ####
    def on_weather_switch_active_notify(self, switch, state):
        if switch.get_active() == True:
            subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/weather.sh"], shell=True)
    pass
    #### spacebar Switch ####
    def on_spacebar_switch_active_notify(self, switch, state):
        if switch.get_active() == True:
            subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/spacebar.sh"], shell=True)
    pass
    #### stats Switch ####
    def on_stats_switch_active_notify(self, switch, state):
        if stats_switch.get_active() == True:
                subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/stats.sh"], shell=True)
        else:
                print("test")
    pass
    #### hid Switch ####
    def on_hid_switch_active_notify(self, switch, state):
        if switch.get_active() == True:
                subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/hid.sh"], shell=True)
    pass

Application()
Gtk.main()

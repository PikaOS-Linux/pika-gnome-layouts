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
        
        self.builder.get_object("install_all").hide()
        #win.connect("destroy", Gtk.main_quit)
        
        ### Hidden entries
        
        self.builder.get_object("audio_box").hide()
        
        ### Enable Extensions
        
        subprocess.run(["gsettings set org.gnome.shell disable-user-extensions false"], shell=True, stdout=subprocess.DEVNULL)
        
        accent_box = self.builder.get_object("accent_box")
        
        accent_output = subprocess.run(["dconf read /org/pika/layouts/pika-theme | grep 1"], shell=True)
        
        if (accent_output.returncode) != 0:
            accent_box.hide()
        
        ### Extension refresh ###
        
        global extension_refresh
        extension_refresh = True
        
        def extension_refresh_func(): 
            while extension_refresh == True:
                desktop_switch = self.builder.get_object("desktop_switch")
                desktop_output = subprocess.run(["gsettings get org.gnome.shell enabled-extensions | grep ding@rastersoft.com"], shell=True, stdout=subprocess.DEVNULL)
                if (desktop_output.returncode) == 0:
                    desktop_switch.set_active(True)
                else:
                    desktop_switch.set_active(False) 
                audio_switch = self.builder.get_object("audio_switch")
                audio_output = subprocess.run(["gsettings get org.gnome.shell enabled-extensions | grep volume-mixer@evermiss.net"], shell=True, stdout=subprocess.DEVNULL)
                if (audio_output.returncode) == 0:
                    audio_switch.set_active(True)
                else:
                    audio_switch.set_active(False)
                blur_switch = self.builder.get_object("blur_switch")
                blur_output = subprocess.run(["gsettings get org.gnome.shell enabled-extensions | grep blur-my-shell@aunetx"], shell=True, stdout=subprocess.DEVNULL)
                if (blur_output.returncode) == 0:
                    blur_switch.set_active(True)
                else:
                    blur_switch.set_active(False)
                tray_switch = self.builder.get_object("tray_switch")
                tray_output = subprocess.run(["gsettings get org.gnome.shell enabled-extensions | grep appindicatorsupport@rgcjonas.gmail.com"], shell=True, stdout=subprocess.DEVNULL)
                if (tray_output.returncode) == 0:
                    tray_switch.set_active(True)
                else:
                    tray_switch.set_active(False)
                workspace_switch = self.builder.get_object("workspace_switch")
                workspace_output = subprocess.run(["gsettings get org.gnome.shell enabled-extensions | grep auto-move-windows@gnome-shell-extensions.gcampax.github.com"], shell=True, stdout=subprocess.DEVNULL)
                if (workspace_output.returncode) == 0:
                    workspace_switch.set_active(True)
                else:
                    workspace_switch.set_active(False)              
                x11_switch = self.builder.get_object("x11_switch")
                x11_output = subprocess.run(["gsettings get org.gnome.shell enabled-extensions | grep gestureImprovements@gestures"], shell=True, stdout=subprocess.DEVNULL)
                if (x11_output.returncode) == 0:
                    x11_switch.set_active(True)
                else:
                    x11_switch.set_active(False)            
                clipboard_switch = self.builder.get_object("clipboard_switch")
                clipboard_output = subprocess.run(["gsettings get org.gnome.shell enabled-extensions | grep clipboard-history@alexsaveau.dev"], shell=True, stdout=subprocess.DEVNULL)
                if (clipboard_output.returncode) == 0:
                    clipboard_switch.set_active(True)
                else:
                    clipboard_switch.set_active(False)
                supergfxctl_switch = self.builder.get_object("supergfxctl_switch")
                supergfxctl_output = subprocess.run(["gsettings get org.gnome.shell enabled-extensions | grep supergfxctl-gex@asus-linux.org"], shell=True, stdout=subprocess.DEVNULL)
                if (supergfxctl_output.returncode) == 0:
                    supergfxctl_switch.set_active(True)
                else:
                    supergfxctl_switch.set_active(False)
                caffeine_switch = self.builder.get_object("caffeine_switch")
                caffeine_output = subprocess.run(["gsettings get org.gnome.shell enabled-extensions | grep caffeine@patapon.info"], shell=True, stdout=subprocess.DEVNULL)
                if (caffeine_output.returncode) == 0:
                    caffeine_switch.set_active(True)
                else:
                    caffeine_switch.set_active(False)
                kde_switch = self.builder.get_object("kde_switch")
                kde_output = subprocess.run(["gsettings get org.gnome.shell enabled-extensions | grep gsconnect@andyholmes.github.io"], shell=True, stdout=subprocess.DEVNULL)
                if (kde_output.returncode) == 0:
                    kde_switch.set_active(True)
                else:
                    kde_switch.set_active(False)
                weather_switch = self.builder.get_object("weather_switch")
                weather_output = subprocess.run(["gsettings get org.gnome.shell enabled-extensions | grep openweather-extension@jenslody.de"], shell=True, stdout=subprocess.DEVNULL)
                if (weather_output.returncode) == 0:
                    weather_switch.set_active(True)
                else:
                    weather_switch.set_active(False)
                stats_switch = self.builder.get_object("stats_switch")
                stats_output = subprocess.run(["gsettings get org.gnome.shell enabled-extensions | grep freon@UshakovVasilii_Github.yahoo.com"], shell=True, stdout=subprocess.DEVNULL)
                if (stats_output.returncode) == 0:
                    stats_switch.set_active(True)
                else:
                    stats_switch.set_active(False)
                hid_switch = self.builder.get_object("hid_switch")
                hid_output = subprocess.run(["gsettings get org.gnome.shell enabled-extensions | grep wireless-hid@chlumskyvaclav.gmail.com"], shell=True, stdout=subprocess.DEVNULL)
                if (hid_output.returncode) == 0:
                    hid_switch.set_active(True)
                else:
                    hid_switch.set_active(False)
                pop_switch = self.builder.get_object("pop_switch")
                pop_output = subprocess.run(["gsettings get org.gnome.shell enabled-extensions | grep pop-shell@system76.com"], shell=True, stdout=subprocess.DEVNULL)
                if (pop_output.returncode) == 0:
                   pop_switch.set_active(True)
                else:
                    pop_switch.set_active(False)
                time.sleep(5.0)
        t1 = threading.Thread(target=extension_refresh_func)
        t1.start()
        
        def extension_refresh_kill(self):
            global extension_refresh
            extension_refresh = False
        
        ###
        
        win.connect("destroy", extension_refresh_kill)
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

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
        application_id="org.nobara.layouts"
        
        self.builder = Gtk.Builder()
        self.builder.add_from_file("/etc/nobara/scripts/nobara-layouts/nobara-layouts.ui")
        self.builder.connect_signals(self)
        win = self.builder.get_object("main_window")
        
        self.builder.get_object("install_all").hide()
        #win.connect("destroy", Gtk.main_quit)
        
        ### Enable Extensions
        
        subprocess.run(["gsettings set org.gnome.shell disable-user-extensions false"], shell=True, stdout=subprocess.DEVNULL)
        
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

                spacebar_switch = self.builder.get_object("spacebar_switch")
                spacebar_output = subprocess.run(["gsettings get org.gnome.shell enabled-extensions | grep space-bar@luchrioh"], shell=True, stdout=subprocess.DEVNULL)
                if (spacebar_output.returncode) == 0:
                    spacebar_switch.set_active(True)
                else:
                    spacebar_switch.set_active(False)
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
                pop_output = subprocess.run(["gsettings get org.gnome.shell enabled-extensions | grep pop-shell@system76.com"], shell=True, stdout=subprocess.DEVNULL)
                if (pop_output.returncode) == 0:
                    pop_switch.set_active(True)
                else:
                    pop_switch.set_active(False)
                gamemode_output = subprocess.run(["gsettings get org.gnome.shell enabled-extensions | grep gamemode@christian.kellner.me"], shell=True, stdout=subprocess.DEVNULL)
                if (gamemode_output.returncode) == 0:
                    gamemode_switch.set_active(True)
                else:
                    gamemode_switch.set_active(False)
                time.sleep(10.0)
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
        
        settings = Gio.Settings.new("org.nobara.layouts")
        
        
        
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
        

    ### Layouts ###
    
    def on_win10_button_pressed(self, widget):
        settings = Gio.Settings.new("org.nobara.layouts")
        settings.set_int("layout-num", 1)
        subprocess.run(["/etc/nobara/scripts/nobara-layouts/layout-scripts/win10.sh"], shell=True)
        
    def on_win11_button_pressed(self, widget):
        settings = Gio.Settings.new("org.nobara.layouts")
        settings.set_int("layout-num", 2)
        subprocess.run(["/etc/nobara/scripts/nobara-layouts/layout-scripts/win11.sh"], shell=True)        
    def on_gnome_button_pressed(self, widget):
        settings = Gio.Settings.new("org.nobara.layouts")
        settings.set_int("layout-num", 3)
        subprocess.run(["/etc/nobara/scripts/nobara-layouts/layout-scripts/reset.sh"], shell=True)   
    def on_macos_button_pressed(self, widget):
        settings = Gio.Settings.new("org.nobara.layouts")
        settings.set_int("layout-num", 4)
        subprocess.run(["/etc/nobara/scripts/nobara-layouts/layout-scripts/macos.sh"], shell=True)   

    ### Settings ###

    #### Desktop Switch ####
    def on_desktop_switch_active_notify(self, switch, state):
        if switch.get_active() == True :
            subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/desktop.sh enable"], shell=True)
        else:
            subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/desktop.sh disable"], shell=True)
    pass
    #### Audio Switch ####
    def on_audio_switch_active_notify(self, switch, state):
        if switch.get_active() == True :
            subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/audio.sh enable"], shell=True)
        else:
            subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/audio.sh disable"], shell=True)
    pass
    #### Blur Switch ####  
    def on_blur_switch_active_notify(self, switch, state):
        if switch.get_active() == True :
            subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/blur.sh enable"], shell=True)
        else:
            subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/blur.sh disable"], shell=True)
    pass
    #### Tray Switch ####  
    def on_tray_switch_active_notify(self, switch, state):
        if switch.get_active() == True :
            subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/tray.sh enable"], shell=True)
        else:
            subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/tray.sh disable"], shell=True)
    pass
    #### workspace Switch ####
    def on_workspace_switch_active_notify(self, switch, state):
        if switch.get_active() == True :
            subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/workspace.sh enable"], shell=True)
        else:
            subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/workspace.sh disable"], shell=True)
    pass
    #### x11 Switch ####
    def on_x11_switch_active_notify(self, switch, state):
        if switch.get_active() == True :
            subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/x11.sh enable"], shell=True)
        else:
            subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/x11.sh disable"], shell=True)
    pass
    #### clipboard Switch ####
    def on_clipboard_switch_active_notify(self, switch, state):
        if switch.get_active() == True :
            subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/clipboard.sh enable"], shell=True)
        else:
            subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/clipboard.sh disable"], shell=True)
    pass
    #### caffeine Switch ####
    def on_caffeine_switch_active_notify(self, switch, state):
        if switch.get_active() == True:
            subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/caffeine.sh enable"], shell=True)
        else:
            subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/caffeine.sh disable"], shell=True)
    pass
    #### supergfxctl Switch ####
    def on_supergfxctl_switch_active_notify(self, switch, state):
        if switch.get_active() == True:
            subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/supergfxctl.sh enable"], shell=True)
        else:
            subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/supergfxctl.sh disable"], shell=True)
    pass
    #### kde Switch ####
    def on_kde_switch_active_notify(self, switch, state):
        if switch.get_active() == True:
            subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/kde.sh enable"], shell=True)
        else:
            subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/kde.sh disable"], shell=True)
    pass
    #### weather Switch ####
    def on_weather_switch_active_notify(self, switch, state):
        if switch.get_active() == True:
            subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/weather.sh enable"], shell=True)
        else:
            subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/weather.sh disable"], shell=True)
    pass
    #### spacebar Switch ####
    def on_spacebar_switch_active_notify(self, switch, state):
        if switch.get_active() == True:
            subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/spacebar.sh enable"], shell=True)
        else:
            subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/spacebar.sh disable"], shell=True)
    pass
    #### stats Switch ####
    def on_stats_switch_active_notify(self, switch, state):
        if switch.get_active() == True:
                subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/stats.sh enable"], shell=True)
        else:
            subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/stats.sh disable"], shell=True)
    pass
    #### hid Switch ####
    def on_hid_switch_active_notify(self, switch, state):
        if switch.get_active() == True:
                subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/hid.sh enable"], shell=True)
        else:
            subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/hid.sh disable"], shell=True)
    pass
    #### Pop Switch ####
    def on_pop_switch_active_notify(self, switch, state):
        if switch.get_active() == True:
                subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/pop.sh enable"], shell=True)
        else:
            subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/pop.sh disable"], shell=True)
    pass
    #### gamemode Switch ####
    def on_gamemode_switch_active_notify(self, switch, state):
        if switch.get_active() == True:
                subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/gamemode.sh enable"], shell=True)
        else:
            subprocess.run(["/etc/nobara/scripts/nobara-layouts/settings-scripts/gamemode.sh disable"], shell=True)
    pass

    def on_install_all_pressed(self, widget):
        subprocess.run(["/etc/nobara/scripts/nobara-layouts/all.sh"], shell=True)
    pass
    
Application()
Gtk.main()

--- ./src/simple-scan.vala.orig	2014-04-21 22:32:26.000000000 -0400
+++ ./src/simple-scan.vala	2014-07-20 10:03:40.497628130 -0400
@@ -31,7 +31,6 @@
 
     private ScanDevice? default_device = null;
     private bool have_devices = false;
-    private GUdev.Client udev_client;
     private UserInterface ui;
     private Scanner scanner;
     private Book book;
@@ -63,8 +62,6 @@
         scanner.scanning_changed.connect (scanner_scanning_changed_cb);
 
         string[]? subsystems = { "usb", null };
-        udev_client = new GUdev.Client (subsystems);
-        udev_client.uevent.connect (on_uevent);
 
         if (default_device != null)
         {
@@ -88,7 +85,6 @@
         base.shutdown ();
         book = null;
         ui = null;
-        udev_client = null;
         scanner.free ();
     }
 
@@ -450,11 +446,6 @@
             stderr.printf ("[%+.2fs] %s %s\n", log_timer.elapsed (), prefix, message);
     }
 
-    private void on_uevent (GUdev.Client client, string action, GUdev.Device device)
-    {
-        scanner.redetect ();
-    }
-
     private static void fix_pdf (string filename) throws Error
     {
         uint8[] data;

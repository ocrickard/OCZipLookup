#OCZipLookup#

##Introduction##
This little bit of code is a simple class wrapper for an SQLite zip-code database that allows you to quickly get city, state, and GPS location from a US zip code without having to connect to an online service.

This will allow you to stop asking your user to fill out their city and state information when requesting them to fill out their address.

The SQLite database is somewhat large (1.9MB), so do not include this utility unless you really need it.

##Installation##
Drag in the two source files into your project: OCZipLookupController.h and .m.

Drag in the zip.sqlite file into your project.  Now we have to make sure that this database gets included in the application's bundle.  To do this, click on your project in the left-panel of Xcode.  Select the target, then "build phases".  Add the "zip.sqlite" file to the "Copy Bundle Resources" item.

Now add the libsqlite3.dylib under the "Link Binary with Libraries" item on the same page.

##Usage##
The query to the database returns a dictionary with strings for different values.  You will have to translate these strings into the appropriate format to use them directly.

```
NSDictionary *results = [OCZipLookupController lookupZipCode:95521];
```

The dictionary has the following key/object pairs:
* "state_abbreviation"
* "latitude"
* "longitude"
* "city"
* "state"
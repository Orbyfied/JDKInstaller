# JDKInstaller
## A few scripts that will automate the installation of the Java Development Kit.
> NOTE: This is still under development and other platforms & JDK versions will be added later.

The different JDK versions are under different branches. Switch to one of them to download the scripts.
### Usage
> It is really simple: You can or just double click the script file for it to download and extract the JDK.
> You can also go into a command line to pass in parameters...
>> `-njp` - I will sometimes include a `javapath.txt` file in my projects (Like in the ConnectedTextureMaker) so that you can change the path to your java installation quickly,   this parameter will DISABLE the overwrite/creation to the `javapath.txt` file with the path to your freshly installed JDK.  
>> `-njh` - This will DISABLE the feature to automatically set the `JAVA_HOME` envoirment variable to the location of the installed JDK.  
>> `-nsp` - This will DISABLE the feature automatically update the `PATH` envoirment variable to contain the location of your JDK's executables. (`jdk/bin`)  

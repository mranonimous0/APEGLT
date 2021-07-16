# APEGLitleToy

This implementation is a prototype for an proposal of a type system and a interpreter for APEG.

# Building

This project support being built using stack. If you unfamiliar with Haskell programming the
easiest way is to build an executable. The main module on this system only runs the MicroSugar
implementation.

* Install the Haskell Stack tool, for more detailed information on stack please refer to https://docs.haskellstack.org/en/stable/README/
* Open a terminal in the root directory (or folder) of the project. 
* Type `$ stack upgrade` to make sure it is updated.
* Type `$ stack setup` to prepare the Building environment.
* Type `$ stack build` to compile the sources.

# Running

To run the code type `stack exec -- APEGlt [-a|-d] <lang-name> <input-file>`. The input name is name of the sample grammar of the input. 


* The *`a`* option will make the tool inform only if the input file was
accepted ou rejected. 
* The *`d`* option prints the type context after the execution. The normal beahviour fo the tool is to parse the file, print the deverivation tree built and inform if it was accepted or rejected. 

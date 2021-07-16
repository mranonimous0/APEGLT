module Main where

import APEG.PlayGround
import APEG.AbstractSyntax (ApegGrm, Var)
import APEG.Interpreter.Value (Value)
import APEG.ASTSamples.SamplesList
import System.Environment
import Data.Maybe



main :: IO ()
main = do args <- getArgs
          case args of
               []   -> putStrLn usage >> return () 
               ("-l":_)       -> putStrLn " -------------- Available Languages --------------" >> list
               ("-d":ln:fn:_) -> retriveLang ln >>= \l ->  maybe (return ()) (\(g,e) -> runFile (debugRun g e) fn) l
               ("-a":ln:fn:_) -> retriveLang ln >>= \l ->  maybe (return ()) (\(g,e) -> runFile (runAccept g e) fn) l
               (ln:fn:_)      -> retriveLang ln >>= \l ->  maybe (return ()) (\(g,e) -> runFile (runGrammar g e) fn) l 
               

               
               
list :: IO ()
list = mapM_ (\(n,d,_,_) -> putStrLn (wh lnxs n ++ " : " ++ d)) availableLanguages
    where lnxs   = maximum (map (\(n,d,_,_) -> length n) availableLanguages)
          wh n s = s ++ replicate (max ( n - (length s) ) 0) ' ' 
        

        
        
retriveLang :: String -> IO (Maybe (ApegGrm, [(Var, Value)]) )
retriveLang n  = case [ (g,e) | (n',_,g,e) <- availableLanguages, n' == n] of
                       []     -> putStrLn ("No such predefined language: " ++ n) >> return Nothing 
                       [x]    -> return $ Just x 
                       zs     -> putStrLn ("Conflicting names for language: " ++ n) >> return Nothing

                       
                       
usage :: String
usage
 = unlines ["usge main [-d|-a] language_name file_name",
            "     main -l : list all available predefined languages that can be run from the main app",
            "-a: Only prints if the input was accepted or rejected",
            "-d: Display debug information, including environment value and type tables",
            "The normal behaviour is to run the desired Language on input, informing the result (Derivation tree is printed if all works)"]
            
 

module APEG.ASTSamples.SamplesList where
{-# LANGUAGE OverloadedStrings #-} 

import APEG.Interpreter.APEGInterp
import APEG.Interpreter.MonadicState
import APEG.Interpreter.MaybeString
import APEG.Interpreter.State
import APEG.Interpreter.Value (Value)
import Control.Monad.State.Lazy
import APEG.AbstractSyntax
import APEG.Interpreter.State
import APEG.TypeSystem
import APEG.PlayGround
import Data.String 

{- -------------------------------------------------------------------
    Import any Modules containing the desired language below 
------------------------------------------------------------------- -}

import APEG.ASTSamples.MicroSugar
import APEG.ASTSamples.LangSample

{- -------------------------------------------------------------------
    The following list contains all grammars than can be ran from 
    the main menu. Each element of the list is a quadruplet : 
    A name form the grammar (to be used to call from main app), 
    A brief description of the grammar, the grammar itself, and finally
    the correct initial value environment for the grammar. The language
    attribute should NOT be included in this initial environment and will
    be automatically added by the helper function of APEG.PlayGround.
------------------------------------------------------------------- -}


availableLanguages :: [(String,        -- Name (to used call the grammar from main)
                        String,        -- Grammar Short description 
                        ApegGrm,       -- Grammar
                        [(Var,Value)]  -- Initial environment, without language attribute.  
                       )] 
availableLanguages = [ ("muSugar", "Mirco Sugar implementation", microSugar, []),
                       ("ab", "an.bn ", ex1,[]),
                       ("bind", "APEG binding use example",ex2,[])]
 

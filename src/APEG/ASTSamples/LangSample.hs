 module APEG.ASTSamples.LangSample where

import APEG.Interpreter.APEGInterp
import APEG.Interpreter.MonadicState
import APEG.Interpreter.State
import APEG.Interpreter.MaybeString
import Control.Monad.State.Lazy
import APEG.AbstractSyntax
-- import APEGState
import APEG.TypeSystem
import APEG.PlayGround


alts :: [APeg] -> APeg
alts  = foldl1 Alt

seqs :: [APeg] -> APeg
seqs = foldl1 Seq

chrs :: [Char] -> APeg
chrs = alts.(map (Lit.(:[])))

many1 :: APeg -> APeg
many1 p = Seq p (Kle p) 

g :: Expr
g = EVar "g"

                           
--  ================= EXAMPLE 1 =================
-- Creating a Simple Grammar for a(n).b(n)
-- 
-- S[Lan g] -> 'a' S<g> 'b'
--           / '.'


ex1 :: ApegGrm
ex1 = [r1ex1]
-- S<g> : 'a'S<g> 'b' / '.';

r1ex1 :: ApegRule
r1ex1 = ApegRule "S" 
                 [(TyLanguage,"g")] 
                 [] 
                 ( Alt (Seq (Lit "b")
                            --(Seq (NT "S" [EVar "g"] []) (Lit "b"))
                            (Kle (Lit "b"))
                            )
                       (Lit ".") )

                       
                       
                       
--  ================= EXAMPLE 2 =================
-- Using Bind : 
-- 
-- S[Lan g] returns [out] -> out = VAR 
--                         / out = NUM
-- NUM[Lan g] -> (0 \ 1) (0 \ 1)*
-- VAR[Lan g] -> ('A' \ 'B') ('A' \ 'B')*

ex2 :: ApegGrm
ex2 = [r1ex2,r2ex2,r3ex2]

r1ex2 :: ApegRule
r1ex2 = ApegRule "S" [(TyLanguage, "g")] [(TyStr,EVar "out")]  ( Alt (Bind "out" (NT "VAR" [EVar "g"] [])) 
                                                                     (Bind "out" (NT "NUM" [EVar "g"] [])) )

r2ex2 :: ApegRule
r2ex2 = ApegRule "VAR" [(TyLanguage, "g")] [] (let x = (Alt (Lit "A") (Lit "B")) in Seq x (Kle x))


r3ex2 :: ApegRule
r3ex2 = ApegRule "NUM" [(TyLanguage, "g")] [] (let x = (Alt (Lit "0") (Lit "1")) in Seq x (Kle x))




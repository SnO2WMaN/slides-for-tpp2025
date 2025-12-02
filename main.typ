#import "@preview/touying:0.6.1": *
#import "@preview/ctheorems:1.1.3": *
#import "@preview/numbly:0.1.0": numbly
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
#import "@preview/diagraph:0.3.5": *
#import "@preview/oxifmt:1.0.0": strfmt
#import "@preview/cades:0.3.1": qr-code

#import themes.metropolis: *
#show: thmrules

#let thmplain = thmbox.with(
  breakable: true,
  radius: 0pt,
  inset: (left: 0.5em, top: 0.75em, bottom: 0.75em),
  padding: (y: 0pt),
  base_level: 0,
)
#let theorem = thmplain("theorem", "定理", fill: luma(240))
#let lemma = thmplain("theorem", "補題", fill: luma(240))
#let definition = thmplain("theorem", "定義", fill: luma(240))
#let proposition = thmplain("theorem", "命題", fill: luma(240))
#let corollary = thmplain("theorem", "系", inset: (x: 1.2em, top: 0em, bottom: 0em))
#let example = thmplain("theorem", "例").with(numbering: none)
#let fact = thmplain("theorem", "事実", fill: luma(240))
#let proof = thmproof("proof", "証明")

#let Pred = $serif("Pred")$
#let Sent = $serif("Sent")$
#let Pow(s) = $cal("P")(#s)$
#let True = $serif("True")$
#let False = $serif("False")$
#let setminus = $backslash$
#let vDash = $tack.r.double$
#let nvDash = $tack.r.double.not$

#let mand = $op(amp)$

#let box = $square.stroked$
#let dia = $diamond.stroked$
#let rhd = $triangle.r.stroked$

#let FrameClass = $bb("F")$
#let HilbertSystem = $frak("H")$
#let Thm = $upright("Thm")$

#let proves = $tack.r$
#let nproves = $tack.r.not$

#let Bew = $bold(upright("Pr"))$
#let Con = $bold(upright("Con"))$

#let ulcorner = $⌈$
#let urcorner = $⌉$
#let GoedelNum(x) = $lr(ulcorner #x urcorner)$

#let Axiom(A) = $sans(upright(#A))$
#let AxiomK = $Axiom("K")$
#let AxiomT = $Axiom("T")$
#let Axiom4 = $Axiom("4")$
#let Axiom5 = $Axiom("5")$
#let AxiomB = $Axiom("B")$
#let AxiomD = $Axiom("D")$
#let AxiomP = $Axiom("P")$
#let AxiomL = $Axiom("L")$
#let AxiomM = $Axiom("M")$
#let AxiomDot2 = $Axiom(".2")$
#let AxiomDot3 = $Axiom(".3")$

#let Rule(R) = $upright("(" #R ")")$
#let RuleMP = $Rule("MP")$
#let RuleNec = $Rule("Nec")$
#let RuleLoeb = $Rule("Löb")$
#let RuleHenkin = $Rule("Henkin")$

#let Logic(L) = $bold(upright(#L))$
#let LogicK = $Logic("K")$
#let LogicKT = $Logic("KT")$
#let LogicS4 = $Logic("S4")$
#let LogicS4Dot2 = $Logic("S4.2")$
#let LogicS5 = $Logic("S5")$
#let LogicGL = $Logic("GL")$
#let LogicS = $Logic("S")$
#let LogicN = $Logic("N")$
#let LogicKT4B = $Logic("KT4B")$
#let LogicTriv = $Logic("Triv")$
#let LogicVer = $Logic("Ver")$
#let LogicGrz = $Logic("Grz")$

#let Arith(A) = $bold(upright(#A))$
#let PA = $Arith("PA")$

#let And = $class("relation", \&)$

#show link: set text(blue)

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [解釈可能性論理の形式化についての報告],
    author: [野口 真柊],
    date: datetime.today(),
    institution: [神戸大学システム情報学研究科],
  ),
)
#set text(font: "Shippori Antique B1", size: 16pt)
#show raw: set text(font: "JuliaMono", size: 0.8em)
#show footnote.entry: set text(size: .75em)

#set heading(numbering: numbly("{1}.", default: "1.1"))
#set cite(form: "prose", style: "institute-of-electrical-and-electronics-engineers")

#show link: underline

#title-slide()

#grid(
  columns: (1fr, auto),
  column-gutter: 24pt,
  inset: (x: 24pt),
  [
    - このスライド: #link("https://sno2wman.github.io/slides-for-tpp2025/main.pdf"):
    - 形式化されたLeanのコード: #link("https://github.com/FormalizedFormalLogic/Foundation")
    - より技術的な内容は #link("https://formalizedformallogic.github.io/Foundation/book/Monthly-Reports/Monthly-Report-2025___10") も参考にしてみてください．
  ],
  [
    #qr-code("https://sno2wman.github.io/slides-for-tpp2025/main.pdf", width: 120pt)
  ],
)




= Formalized Formal Logic

== Formalized Formal Logic (FFL)

#link("https://github.com/FormalizedFormalLogic/Foundation")

目標: 数理論理学の諸事実をLeanで形式化する．
例えば以下が形式化済み・進行中．


#grid(
  columns: (auto, auto),
  row-gutter: 16pt,
  column-gutter: 24pt,
  inset: (x: 24pt),
  align: top,
  [
    - 命題論理
      - 自動証明
      - 中間論理
    - 様相命題論理
      - Kripke意味論
      - 近傍意味論
  ],
  [
    - 一階述語論理・算術・集合論
      - 完全性定理
      - カット除去定理
      - Gödelの不完全性定理
      - $bold("ZFC")$ の無矛盾性
    - 証明可能性論理
      - Solovayの算術的完全性定理
      - 分類定理
    - *解釈可能性論理* (今回の報告)
  ],
)


= 解釈可能性論理と今回の成果

== 解釈可能性

2つの数学的理論（公理系）の間に様々な関係がある．

#example[
  理論の間の関係の例
  - Peano算術 $bold("PA")$ は帰納法を弱めた算術 $bold("IΣ"_1)$ の真の拡大である．
  - 標準的な公理的集合論 $bold("ZFC")$ は $bold("PA")$ を内部で実行できる．
    - 言語がそもそも異なる $cal(L)_upright("Set") := {in, =}$, $cal(L)_upright("Arith") := {0, 1, +, times, =}$ が適切に翻訳出来る．
  - Leanは $bold("ZFC")$ や $bold("PA")$ を内部で実行できる．
  - 真のクラスが扱える集合論 $bold("NBG")$ は $bold("ZFC")$ の保守的拡大である．\
    i.e. $bold("NBG")$ で証明可能な集合に関する事実は $bold("ZFC")$ でも証明可能．
]

この現象を2項関係 $rhd$ を用いて $bold("ZFC") rhd bold("PA")$ などと表すことにする．
文脈によって $rhd$ が何を意図しているかは異なる．上の例では *$bold("ZFC")$ は $bold("PA")$ を解釈可能*とする．

== 解釈可能性論理

#let Axiom(L) = $sans(#L)$
#let AxiomK = $Axiom("K")$
#let AxiomL = $Axiom("L")$
#let AxiomJ1 = $Axiom("J1")$
#let AxiomJ2 = $Axiom("J2")$
#let AxiomJ2Plus = $Axiom("J2"^+)$
#let AxiomJ3 = $Axiom("J3")$
#let AxiomJ4 = $Axiom("J4")$
#let AxiomJ4Plus = $Axiom("J4"^+)$
#let AxiomJ5 = $Axiom("J5")$
#let AxiomJ6 = $Axiom("J6")$

#let ruleNec = $upright("(Nec)")$
#let ruleR1 = $upright("(R1)")$
#let ruleR2 = $upright("(R2)")$

#let logic(L) = $bold(#L)$
#let logicGL = $logic("GL")$
#let LogicIL = $logic("IL")$
#let LogicILMinus = $logic("IL"^-)$

1項様相 $box$ と2項様相 $rhd$ を扱う様相論理を解釈可能性論理と呼ぶ．

#grid(
  columns: (auto, auto),
  column-gutter: 24pt,
  align: top,
  [
    - $logicGL := AxiomK + AxiomL + ruleNec$
    - $LogicILMinus := logicGL + AxiomJ3 + AxiomJ6 + ruleR1 + ruleR2$
    - $LogicILMinus(AxiomJ2) := LogicILMinus + AxiomJ2$
    - $LogicIL := logicGL + AxiomJ1 + AxiomJ2 + AxiomJ3 + AxiomJ4 + AxiomJ5$

    #proposition[
      $LogicIL = LogicILMinus(AxiomJ1, AxiomJ2, AxiomJ5)$
    ] <prop:logic_ILMinus_J1_J2_J5_equiv_logic_IL>
  ],
  [
    - $AxiomK: box(p -> q) -> (box p -> box q)$
    - $AxiomL: box (box p -> p) -> box p$
    - $AxiomJ1: box (p -> q) -> (p rhd q)$
    - $AxiomJ2: (p rhd q) -> (q rhd r) -> (p rhd r)$
    - $AxiomJ2Plus: (p rhd (q or r)) -> (q rhd r) -> (p rhd r)$
    - $AxiomJ3: (p rhd q) -> (q rhd r) -> ((p or q) rhd r)$
    - $AxiomJ4: (p rhd q) -> (dia p -> dia q)$
    - $AxiomJ4Plus: box(p -> q) -> (r rhd p -> r rhd q)$
    - $AxiomJ5: dia p -> p$
    - $AxiomJ6: box p <-> (not p rhd bot)$
    - $ruleNec: phi | box phi$
    - $ruleR1: phi -> psi | chi rhd phi -> chi rhd psi$
    - $ruleR2: phi -> psi | psi rhd chi -> phi rhd chi$
  ],
)

== Veltman意味論


#grid(
  columns: (auto, auto),
  column-gutter: 24pt,
  [
    $logicGL$ のKripkeフレーム #footnote[$R$ は推移的かつ逆整礎的: $x_0 R x_1 R x_2 R x_3 dots.c$ は存在しない．] $chevron.l W, R chevron.r$ に
    $W$ の元で添字付けられた関係の族を加えたフレーム $chevron.l W, R, {S_w}_(w in W) chevron.r$ をVeltmanフレーム
    #footnote[正確には右の性質を全て満たすものをVeltmanフレームと呼び，これは$LogicILMinus$-フレームやVeltman prestructureと呼ぶ．]と呼ぶ．
    $upright("(b)")$ は満たすとする．

    モデルは通常通り付値関数 $V : W times upright("PropVar") -> bold("2")$ を加える．

    $rhd$ の意味は次で与える．
    $
      x models A rhd B :<==> forall y. [x R y, y models A => exists z. [y S_x z mand z models B]]
    $

    #proposition[
      任意のフレーム $F$ で $AxiomJ3, AxiomJ6, ruleR1$, $ruleR2$ は成り立つ．
    ] <prop:all_veltman_validates>
    #proposition[
      - $F models upright("(j1)") <==> F models AxiomJ1$
      - $F models upright("(j2)") <==> F models AxiomJ2 <==> F models AxiomJ2Plus$
      - $F models upright("(j4)") <==> F models AxiomJ4 <==> F models AxiomJ4Plus$
      - $F models upright("(j5)") <==> F models AxiomJ5$
    ] <prop:veltman_frame_conditions_1>
  ],
  [
    #figure(caption: [Veltmanモデルの例])[
      #diagram(
        node-stroke: 2pt,
        spacing: 100pt,
        node((0, 0), $x$, radius: 16pt),
        node((1, 0), $y$, radius: 16pt),
        node((2, 0), $z$, radius: 16pt),
        edge((0, 0), (1, 0), "-|>"),
        edge((0, 0), (1, 0), $x$, "~|>", bend: -20deg),
        edge((1, 0), (2, 0), "-|>"),
        edge((1, 0), (2, 0), $x$, "~|>", bend: -20deg),
        edge((0, 0), (2, 0), $x$, "~|>", bend: 40deg),
        edge((0, 0), (2, 0), $z$, "~|>", bend: 20deg),
      )
    ]

    - $upright("(b)"): x S_w y => w R x$
    - $upright("(j1)"): w R x => x S_w x$
    - $upright("(j2)"): x S_w y, y S_w z => x S_w z$
    - $upright("(j4)"): x S_w y => w R y$
    - $upright("(j5)"): w R x, x R y => x S_w y$
  ],
)

== Veltmanフレームの形式化

#figure(caption: [Veltmanフレームとその上の条件のLean上の形式化])[
  ```lean
  structure Modal.Kripke.Frame where
    World : Type
    Rel : HRel World
    [world_nonempty : Nonempty World]

  structure InterpretabilityLogic.Veltman.Frame extends toKripkeFrame : Modal.Kripke.Frame where
    [isGL : toKripkeFrame.IsGL]
    S : (w : World) → HRel World
    S_cond {w x y} : S w x y → w ≺ x

  abbrev SRel' {F : Veltman.Frame} (w : outParam F.World) (x y : F.World) := F.S w x y
  notation:45 x:max " ≺[" w "] " y:max => SRel' w x y

  class HasAxiomJ1 (F : Frame) : Prop where
    S_J1 : ∀ {w x : F.World}, w ≺ x → x ≺[w] x

  class HasAxiomJ2 (F : Frame) extends F.HasAxiomJ4 where
    S_J2 : ∀ {w x y z : F.World}, x ≺[w] y → y ≺[w] z → x ≺[w] z

  class HasAxiomJ4 (F : Frame) : Prop where
    S_J4 : ∀ {w x y : F.World}, x ≺[w] y → w ≺ y

  class HasAxiomJ5 (F : Frame) : Prop where
    S_J5 : ∀ {w x y : F.World}, w ≺ x → x ≺ y → x ≺[w] y
  ```
]

== $LogicIL$ の部分論理についての分離(1)

@prop:logic_ILMinus_J1_J2_J5_equiv_logic_IL，@prop:all_veltman_validates，@prop:veltman_frame_conditions_1 をLeanで形式化した．
以下の $LogicIL$ の部分論理 $LogicILMinus(X)$ は然るべきフレームクラスに対して健全であり，反例モデルを作って以下の包含関係が成り立つことを検証した
#footnote[
  例えば $LogicILMinus(AxiomJ4)$ と $LogicILMinus(AxiomJ4Plus)$ はVeltman意味論では分離できない．
  その意味で $LogicILMinus(AxiomJ4)$ はVeltman意味論に対して完全ではない．cf: @KO21
]．

#figure(caption: [Interpretability Logic Zoo (1)])[
  #raw-render(
    raw(
      "
  digraph ModalTheorysZoo {
    rankdir = RL;

    node [
      shape=none
      margin=0.15
      width=0
      height=0
    ]

    edge [
      style = solid
      arrowhead = vee
      arrowsize = 0.5
    ];

    ILMinus_J1 -> ILMinus;
    ILMinus_J1_J2 -> ILMinus_J1_J4Plus;
    ILMinus_J1_J2 -> ILMinus_J2Plus;
    ILMinus_J1_J2_J5 -> ILMinus_J1_J2;
    ILMinus_J1_J2_J5 -> ILMinus_J1_J4Plus_J5;
    ILMinus_J1_J2_J5 -> ILMinus_J2Plus_J5;
    ILMinus_J1_J4Plus -> ILMinus_J1;
    ILMinus_J1_J4Plus -> ILMinus_J4Plus;
    ILMinus_J1_J4Plus_J5 -> ILMinus_J1_J4Plus;
    ILMinus_J1_J4Plus_J5 -> ILMinus_J1_J5;
    ILMinus_J1_J4Plus_J5 -> ILMinus_J4Plus_J5;
    ILMinus_J1_J5 -> ILMinus_J1;
    ILMinus_J1_J5 -> ILMinus_J5;
    ILMinus_J2Plus -> ILMinus_J4Plus;
    ILMinus_J2Plus_J5 -> ILMinus_J2Plus;
    ILMinus_J2Plus_J5 -> ILMinus_J4Plus_J5;
    ILMinus_J4Plus -> ILMinus;
    ILMinus_J4Plus_J5 -> ILMinus_J4Plus;
    ILMinus_J4Plus_J5 -> ILMinus_J5;
    ILMinus_J5 -> ILMinus;

    ILMinus_J1_J2_J5 -> IL [color=\"black:white:black\" arrowhead=\"none\"]
    {{ rank = same; ILMinus_J1_J2_J5; IL }}
  }",
    ),
    labels: (
      "IL": $LogicIL$,
      "ILMinus_J1_J2_J5": $LogicILMinus(AxiomJ1, AxiomJ2, AxiomJ5)$,
      "ILMinus_J1_J2": $LogicILMinus(AxiomJ1, AxiomJ2)$,
      "ILMinus_J1_J5": $LogicILMinus(AxiomJ1, AxiomJ5)$,
      "ILMinus_J1": $LogicILMinus(AxiomJ1)$,
      "ILMinus_J4": $LogicILMinus(AxiomJ4)$,
      "ILMinus_J5": $LogicILMinus(AxiomJ5)$,
      "ILMinus_J4Plus_J5": $LogicILMinus(AxiomJ4Plus, AxiomJ5)$,
      "ILMinus_J4Plus": $LogicILMinus(AxiomJ4Plus)$,
      "ILMinus_J2Plus": $LogicILMinus(AxiomJ2Plus)$,
      "ILMinus_J1_J4Plus": $LogicILMinus(AxiomJ1, AxiomJ4Plus)$,
      "ILMinus_J2Plus_J5": $LogicILMinus(AxiomJ2Plus, AxiomJ5)$,
      "ILMinus_J1_J4Plus_J5": $LogicILMinus(AxiomJ1, AxiomJ4Plus, AxiomJ5)$,
      "ILMinus": $LogicILMinus$,
    ),
    height: 180pt,
  )
]

== $LogicIL$ の部分論理についての分離(2)

反例モデルの構成は自然数に順序を入れる．この検証は `omega` や `grind` など自動化タクティクが非常に有効．

#figure(
  caption: [$LogicILMinus(AxiomJ1, AxiomJ4Plus) subset.neq LogicILMinus(AxiomJ1, AxiomJ2)$ となる反例モデルの構成のコードの抜粋],
)[
  ```lean
    use {
      toKripkeFrame := ⟨Fin 4, (· < ·)⟩
      isGL := Modal.Kripke.Frame.isGL_of_isFiniteGL {
        trans := by omega;
        irrefl := by omega;
      }
      S w x y := (w < x ∧ x = y) ∨ (w < x ∧ x < y ∧ ¬(w = 0 ∧ x = 1 ∧ y = 3)),
      S_cond := by tauto;
    }
    constructor;
    . constructor;
      exact {
        S_J1 := by tauto;
        S_J4 := by grind;
      }
    . by_contra hC;
      have := Veltman.Frame.HasAxiomJ2.of_validate_axiomJ2 hC |>.S_J2 (w := 0) (x := 1) (y := 2) (z := 3) (by tauto) (by tauto);
      contradiction;
  ```
]

== $LogicIL$ の拡大論理について

#grid(
  columns: (1fr, auto),
  column-gutter: 18pt,
  inset: (right: 24pt),
  [
    $LogicIL$ の拡張論理についても同様にLeanで検証した．
    破線はVeltman意味論では分離できないことを示す．

    - $Axiom("M"): (p rhd q) -> (p and box r) rhd (q and box r)$
    - $Axiom("M")_0: (p rhd q) -> (dia p and box r) rhd (q and box r)$
    - $Axiom("P"): (p rhd dia q) -> box(p rhd q)$
    - $Axiom("P")_0: (p rhd dia q) -> box(p rhd q)$
    - $Axiom("W"): (p rhd q) -> (p rhd (q and box not p))$
    - $Axiom("KW1"^0): ((q and p) rhd dia q) -> (q rhd (q and box not p))$
    - $Axiom("KW2"): (p rhd dia q) -> (q rhd (q and box not p))$
    - $Axiom("W*"): (p rhd q) -> ((q and box r) rhd (q and box r and box not p))$
    - $Axiom("R"): (p rhd q) -> not(p rhd not r) rhd (q and box r)$
    - $Axiom("R*"): (p rhd q) -> not(p rhd not r) rhd (q and box r and box not p)$
    - $Axiom("F"): (p rhd dia p) -> box not p$

    詳細は割愛する．
  ],
  [
    #figure(caption: [Interpretability Logic Zoo (2)])[
      #raw-render(
        raw(
          "
  digraph ModalTheorysZoo {
    rankdir = TB;

    node [
      shape=none
      margin=0.15
      width=0
      height=0
    ]

    edge [
      style = solid
      arrowhead = vee
      arrowsize = 0.5
    ];

    IL_F -> IL
    IL_KW2 -> IL_F [style=dashed]
    IL_M -> IL_R_W
    IL_M₀ -> IL
    IL_M₀_W -> IL_M₀
    IL_P -> IL_R_W
    IL_P₀ -> IL
    IL_R -> IL_P₀  [style=dashed]
    IL_R_W -> IL_M₀_W
    IL_R_W -> IL_R
    IL_W -> IL_KW2 [style=dashed]
    IL_WStar -> IL_W [style=dashed]

    IL_M₀_W -> IL_WStar [color=\"black:white:black\" arrowhead=\"none\"]
    {{ rank = same; IL_M₀_W; IL_WStar }}

    IL_KW1Zero -> IL_KW2 [color=\"black:white:black\" arrowhead=\"none\"]
    {{ rank = same; IL_KW2; IL_KW1Zero }}

    IL_RStar -> IL_R_W [color=\"black:white:black\" arrowhead=\"none\"]
    {{ rank = same; IL_RStar; IL_R_W }}
  }",
        ),
        labels: (
          "IL": $LogicIL$,
          "IL_M₀": $logic("IL")(Axiom("M")_0)$,
          "IL_F": $logic("IL")(Axiom("F"))$,
          "IL_P₀": $logic("IL")(Axiom("P")_0)$,
          "IL_KW2": $logic("IL")(Axiom("KW2"))$,
          "IL_W": $logic("IL")(Axiom("W"))$,
          "IL_WStar": $logic("IL")(Axiom("W*"))$,
          "IL_M₀_W": $logic("IL")(Axiom("M")_0, Axiom("W"))$,
          "IL_R": $logic("IL")(Axiom("R"))$,
          "IL_R_W": $logic("IL")(Axiom("R"), Axiom("W"))$,
          "IL_M": $logic("IL")(Axiom("M"))$,
          "IL_P": $logic("IL")(Axiom("P"))$,
          "IL_RStar": $logic("IL")(Axiom("R*"))$,
          "IL_KW1Zero": $logic("IL")(Axiom("KW1"^0))$,
        ),
        width: 320pt,
      )
    ]
  ],
)


= 展望

== 展望: 完全性について

```lean
class Sound (𝓢 : S) (𝓜 : M) : Prop where
  sound : ∀ {φ : F}, 𝓢 ⊢ φ → 𝓜 ⊧ φ

class Complete (𝓢 : S) (𝓜 : M) : Prop where
  complete : ∀ {φ : F}, 𝓜 ⊧ φ → 𝓢 ⊢ φ

protected class Frame.IsIL (F : Frame) extends F.IsILMinus_J1_J2_J5
protected alias FrameClass.IL := FrameClass.ILMinus_J1_J2_J5

instance : Sound InterpretabilityLogic.IL FrameClass.IL := by ... -- done

instance : Entailment.Consistent InterpretabilityLogic.IL := by ... -- done

instance : Complete InterpretabilityLogic.IL FrameClass.IL := by sorry
```

完全性に関しては何も形式化できていない．

#theorem[
  $forall F. F models LogicIL => F models phi$ なら $LogicIL proves phi$．同様のことが $LogicILMinus$ などについても成り立つ．
]

カノニカルモデルに似た振る舞いをするモデルを作るが，$S_w$ の定義はかなり技巧的で形式化が大変．
しかもそれぞれの論理に対して別個に構成する必要があり，量もかさばる．

== 展望: Verbrugge意味論

いくつかの公理はVeltman意味論では分離できない．

#example[
  $F models upright("(j2)") <==> F models AxiomJ2 <==> F models AxiomJ2Plus$
]

#example[
  $F models bold("IL")$ のとき次は同値．
  1. 公理 $sans("W")$: $F models p rhd q -> p -> (q and box not p)$
  2. 公理 $sans("F")$: $F models p rhd dia p -> box not p$
  3. 任意の $w in W$ に対し，$R$ と $S_w$ の合成 $(R;S_w)$ は逆整礎的．

  ```lean
  abbrev RS {F : Frame} (w : F.World) := Relation.Comp (· ≺ ·) (· ≺[w] ·)
  notation:50 x:max " ≺≺[" w "] " y:max => RS w x y

  class HasAxiomW (F : Frame) : Prop where
    S_W : ∀ w : F.World, ConverseWellFounded $ (· ≺≺[w] ·)

  lemma TFAE_HasAxiomW [F.IsIL] : [
    F.HasAxiomW,
    F ⊧ Axioms.W (.atom 0) (.atom 1),
    F ⊧ Axioms.F (.atom 0)
  ].TFAE := by ...
  ```
]

Veltman意味論の近傍意味論的な拡張であるVerbrugge意味論では上の例を分離できる．技術的取り扱いは煩雑．

@Rov20 はAgdaでVerbrugge意味論を形式化し，いくつかのフレーム条件などを形式化しているが，完全性などは未完．この結果を拡張する．

== 展望: 算術的完全性

証明可能性述語 $upright("Pr")_T (x)$ の挙動は様相演算子 $box$ を通じて様相論理 $logicGL$ と対応する．

解釈可能性述語 $upright("Int")_T (x, y)$ の挙動は様相演算子 $rhd$ を通じて $LogicIL$ の拡張論理に対応する．

#fact[
  - $T$ が $bold("PA")$ の拡大理論ならその証明可能性論理は $LogicIL(AxiomM)$ である．
  - $T$ が有限公理化可能ならその解釈可能性論理は $LogicIL(AxiomP)$ である．
]

解釈そのものの形式化が現在出来ていない．
例えば，$bold("ZFC") rhd bold("PA")$ といったことも形式化出来ていない．

様相論理的には，逆にVeltman意味論を単純化して技術的に扱いやすくしたVisser意味論などの下準備も必要．

やることは多い．

= 参考文献

#pagebreak()

#bibliography(title: none, "references.yml")

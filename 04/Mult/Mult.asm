// このファイルは www.nand2tetris.org の一部です
// および "The Elements of Computing Systems" という本の一部です
// 著者: Nisan and Schocken, MIT Press.
// ファイル名: projects/4/Mult.asm

// R0とR1を掛け算し、その結果をR2に格納します。
// (R0, R1, R2はそれぞれRAM[0], RAM[1], RAM[2]を参照します。)
// このアルゴリズムは繰り返しの加算に基づいています。

//// これは「R0 × R1 の結果を R2 に格納する」という命令です。
//// Hackコンピュータには掛け算命令がないため、R1 回 R0 を加えるという繰り返し処理で掛け算を実現します。

  //初期化
  @R2
  M=0

  // counter = R1
  @R1
  D=M
  @counter
  M=D

(LOOP)
  //if counter === 0 終了
  @counter
  D=M
  @END
  D;JEQ

  //R2 = R0 + R2
  @R0
  D=M
  @R2
  M=D+M

  // counter = counter - 1
  @counter
  M=M-1

  @LOOP
  0;JMP

(END)
  0;JMP
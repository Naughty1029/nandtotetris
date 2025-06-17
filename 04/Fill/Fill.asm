// このファイルは www.nand2tetris.org の一部です
// および "The Elements of Computing Systems" という本の一部です
// 著者: Nisan and Schocken, MIT Press.
// ファイル名: projects/4/Fill.asm

// キーボード入力を監視する無限ループを実行します。
// キーが押されたとき（どのキーでも）、プログラムは画面を黒く塗りつぶします。
// つまり、すべてのピクセルに「黒」を書き込みます。
// キーが押されていないときは、画面をクリアする必要があります。

//// このコメントをあなたのコードに置き換えてください。

  @SCREEN //画面の開始アドレス（16384）
  D=A
  @screen // 現在の画面アドレスを保持する変数
  M=D

  @KBD //キーボードのアドレス（24576）
  D=A
  @keyboard
  M=D

(LOOP)
  // キーボードの状態をチェック
  @keyboard
  A=M
  D=M // D = キーボードの値（0 = キーが押されていない、それ以外 = キーが押されている）

  @FILL // キーが押されている場合
  D;JGT // D > 0 ならFILLにジャンプ

  @CLEAR
  0;JMP // CLEARにジャンプ

(FILL)
  // 画面を黒く塗りつぶす（ -1 = すべてのビットが1 = 黒）
  @screen
  A=M
  M=-1

  @NEXT
  0;JMP

(CLEAR)
  // 画面をクリアする（0 = すべてのビットが0 = 白）
  @screen
  A=M
  M=0 // 現在の画面アドレスに0（白）を書き込む

(NEXT)
  // 次の画面アドレスに移動
  @screen
  M=M+1

  // 画面の終端をチェック
  @KBD
  D=A
  @screen
  D=D-M   // D = キーボードアドレス - 現在の画面アドレス
  @LOOP
  D;JGT   // まだ画面の終端に達していない場合はLOOPに戻る

  // 画面の終端に達したら、最初からやり直し
  @SCREEN
  D=A
  @screen
  M=D     // 画面アドレスを最初に戻す

  @LOOP
  0;JMP   // ループの最初に戻る
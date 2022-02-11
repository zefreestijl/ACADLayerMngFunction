(defun C:Test0 (/ acad doc color2 n1 color1 method1 colorindex)
  ;;; By 3wood 31/03/2016, Change truecolor layer colors to index colors 
  (setq acad (vlax-get-acad-object)
 doc (vla-get-activedocument acad)
 color2 (vla-GetInterfaceObject acad (strcat "AutoCAD.AcCmColor." (substr (vlax-product-key) 28 2)))
 )
  (vla-startundomark doc)
  (vlax-for n1 (vla-get-layers doc)
    (setq color1 (vla-get-truecolor n1)
   method1 (vla-get-colormethod color1)
   colorindex (vla-get-colorindex color1)
   )
    (if (/= method1 195)
      (progn
 (vla-put-colorindex color2 colorindex)
 (vla-put-truecolor n1 color2)
      )
      )
    )
  (vla-endundomark doc)
  (princ)
  )


(defun c:Test1 (/ T_LayMatrix T_LayConfig)
   (setvar "CMDECHO" 0)
   (setvar "CLAYER" "0")
   (setq T_LayMatrix
      '(
	  (1   . "1_DLNSHO-PLAN-结构柱")
	  (2   . "2_DLNSHO-PLAN-平面墙体")
	  (3   . "3")
	  (4   . "4_DLNSHO-PLAN-平面门窗")
	  (6   . "6")
	  (7   . "7_DLNSHO-PLAN-平面文字_SEC-索引符号_DEFPOINTS_0")
	  (8   . "8_DLNSHO-PLAN-型材")
	  (9   . "9_DLNSHO-PLAN-结构柱填充")
	  (10   . "10_DLNSHO-PLAN-平面轴网")
	  (17   . "_7_Detail_Text")
	  (20   . "_20_Dote")
	  (29   . "29_DLNSHO-ELE-立面分割线")
	  (31   . "31_DLNSHO-PLAN-石材幕墙")
	  (32   . "32_DLNSHO-MLP-规划建筑")
	  (33   . "33_DLNSHO-ELE-立面填充-装饰铝板")
	  (44   . "44_DLNSHO-PLAN-节点标注")
	  (45   . "45_DLNSHO-SEC-剖面看线")
	  (46   . "46_DLNSHO-PLAN-涂料")
	  (50   . "50_DLNSHO-SEC-剖面剖切线")
	  (73   . "73_DLNSHO-MLP-总图标高")
	  (130   . "130_DLNSHO-ELE-立面2")
	  (134   . "134_DLNSHO-ELE-立面3")
	  (138   . "138_DLNSHO-ELE-立面4")
	  (140   . "140_DLNSHO-PLAN-楼梯电梯")
	  (143   . "143_DLNSHO-PLAN-玻璃幕墙")
	  (162   . "162_DLNSHO-PLAN-看线或其他")
	  (163   . "163_DLNSHO-PLAN-厨具，洁具")
	  (185   . "185_DLNSHO-PLAN-金属幕墙")
	  (210   . "210_DLNSHO-PLAN-修改备注")
	  (211   . "211_DLNSHO-PLAN-结构边线")
	  (247   . "247_DLNSHO-SEC-剖面构件")
	  (248   . "248")
	  (249   . "249")
	  (250   . "250_DLNSHO-SEC-剖面填充_ELE-立面填充-型材")
	  (251   . "251_DLNSHO-ELE-立面填充-深色玻璃_家具")
	  (252   . "252_DLNSHO-ELE-立面填充-浅色玻璃")
	  (253   . "253")
	  (254   . "254_DLNSHO-ELE-立面填充-超白玻璃")
	  (255   . "255_DLNSHO-ELE-立面1")
       )
   )
   (vla-StartUndoMark (vla-get-ActiveDocument (vlax-get-acad-object)))
   (foreach T_Item (GetLayers)
      (if
         (setq T_LayConfig (assoc (car T_Item) T_LayMatrix))
         (progn
            (if
               (not (tblsearch "LAYER" (cdr T_LayConfig)))
               (command "-LAYER" "N" (cdr T_LayConfig) "C" (car T_LayConfig) (cdr T_LayConfig) "")
            )
            (command "-LAYMRG")
            (foreach T_Lay (cadr T_Item)
               (if
                  (/= T_Lay (cdr T_LayConfig))
                  (command "N" T_Lay)
               )
            )
            (command "" "N" (cdr T_LayConfig) "Y")
         )
      )
   )
   (vla-EndUndoMark (vla-get-ActiveDocument (vlax-get-acad-object)))
   (setvar "CMDECHO" 1)

  (setq Lst (list
'("1_DLNSHO-PLAN-结构柱" 1)
'("2_DLNSHO-PLAN-平面墙体" 2)
'("4_DLNSHO-PLAN-平面门窗" 4)
'("7_DLNSHO-PLAN-平面文字_SEC-索引符号_DEFPOINTS_0" 7)
'("8_DLNSHO-PLAN-型材" 8)
'("9_DLNSHO-PLAN-结构柱填充" 9)
'("10_DLNSHO-PLAN-平面轴网" 10)
'("29_DLNSHO-ELE-立面分割线" 29)
'("31_DLNSHO-PLAN-石材幕墙" 31)
'("32_DLNSHO-MLP-规划建筑" 32)
'("33_DLNSHO-ELE-立面填充-装饰铝板" 33)
'("44_DLNSHO-PLAN-节点标注" 44)
'("45_DLNSHO-SEC-剖面看线" 45)
'("46_DLNSHO-PLAN-涂料" 46)
'("50_DLNSHO-SEC-剖面剖切线" 50)
'("73_DLNSHO-MLP-总图标高" 73)
'("130_DLNSHO-ELE-立面2" 130)
'("134_DLNSHO-ELE-立面3" 134)
'("138_DLNSHO-ELE-立面4" 138)
'("140_DLNSHO-PLAN-楼梯电梯" 140)
'("143_DLNSHO-PLAN-玻璃幕墙" 143)
'("162_DLNSHO-PLAN-看线或其他" 162)
'("163_DLNSHO-PLAN-厨具，洁具" 163)
'("185_DLNSHO-PLAN-金属幕墙" 185)
'("210_DLNSHO-PLAN-修改备注" 210)
'("211_DLNSHO-PLAN-结构边线" 211)
'("247_DLNSHO-SEC-剖面构件" 247)
'("250_DLNSHO-SEC-剖面填充_ELE-立面填充-型材" 250)
'("251_DLNSHO-ELE-立面填充-深色玻璃_家具" 251)
'("252_DLNSHO-ELE-立面填充-浅色玻璃" 252)
'("254_DLNSHO-ELE-立面填充-超白玻璃" 254)
'("255_DLNSHO-ELE-立面1" 255)
'("_143_CW_Glass" 143)
'("_7_Detail_Text" 7)
'("_185_CW_Metal" 185)
'("_29_Elev_Parting" 29)
); end list
); end setq

 (vl-load-com)

 (foreach lay Lst
   (if
     (not
(vl-catch-all-error-p
  (setq curLay(vl-catch-all-apply 'vla-Item
     (list(vla-get-Layers
	     (vla-get-ActiveDocument
		  (vlax-get-acad-object)))(car lay))))))
     (progn
(vla-put-Color curLay(cadr lay))
(setq fLst(list(cons 8(vla-get-Name curLay))))
(if
  (setq laySet(ssget "_X" fLst))
  (progn
    (foreach itm
	     (mapcar 'vlax-ename->vla-object 
                      (vl-remove-if 'listp 
                        (mapcar 'cadr(ssnamex laySet))))
      (vla-put-Color itm acByLayer)
    ); end foreach
  ); end if
); end progn
   ); end progn
 ); end if
); end foreach
   (princ)
   
)

(defun GetLayers (/ GL_Layer GL_Color GL_Name GL_Return)
   (setq GL_Layer (tblnext "Layer" T))
   (while
      GL_Layer
      (if
         (/= (setq GL_Name (cdr (assoc 2 GL_Layer))) "0")
         (if
            (not (assoc (setq GL_Color (cdr (assoc 62 GL_Layer))) GL_Return))
            (setq GL_Return (append GL_Return (list (list GL_Color (list GL_Name)))))
            (setq GL_Return (subst (list GL_Color (append (cadr (assoc GL_Color GL_Return)) (list GL_Name))) (assoc GL_Color GL_Return) GL_Return))
         )
      )
      (setq GL_Layer (tblnext "Layer"))
   )
   GL_Return
)


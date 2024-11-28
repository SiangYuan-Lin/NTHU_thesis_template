NTHU thesis template  
In `NTHUthesis.cls` :  
  When setting up Chinese fonts  
  Check your system's font catalog to see which fonts are available.  
  Use `\setCJKmainfont{'fontname'}` to specify.  
  The current solution for bold-face/italic Chinese characters uses the `AutoFakeBold`/`AutoFakeSlant` options  
  in`\setCJKmainfont[AutoFakeBold=1.8, AutoFakeSlant=0.2]{KaiTi}`  
  If your bold-face/italic Chinese characters are available in your system, you may remove these options  

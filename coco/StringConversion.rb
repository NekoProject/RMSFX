=begin
# 
# Created by Hana Seiran 
#
# Documentation by Hana Seiran
#

Lisense:

Copyright (c) 2012, Seiran
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.
3. All advertising materials mentioning features or use of this software
   must display the following acknowledgement:
   This product includes software developed by Seiran.

THIS SOFTWARE IS PROVIDED BY Seiran ''AS IS'' AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL Seiran BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
=end
class String
        Kernel32 = CocoSimple::DLL.new('Kernel32')
        def toUnicode(cp = 65001)
                buf = "\0"*(2*(len = Kernel32.MultiByteToWideChar(cp, 0, self, -1, 0, 0)))
                Kernel32.MultiByteToWideChar(cp, 0, self, -1, buf, len)
                buf.chop!
        end
        def fromUnicode(cp = 65001)
                buf = "\0"*(len = Kernel32.WideCharToMultiByte(cp, 0, self, -1, 0, 0, 0, 0))
                Kernel32.WideCharToMultiByte(cp, 0, self, -1, buf, len, 0, 0)
                buf.chop!
        end 
end

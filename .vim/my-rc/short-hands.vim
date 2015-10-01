"Short hand

" Note taking abbr
iabbr td TODO:
iabbr ak [ASK]:
iabbr im [IMP]:
iabbr req [REQ]:
iabbr rp [REPEAT]:
iabbr nt [NOTE]:
iabbr oq [OPEN Q]:
iabbr nf [INFO]:
iabbr na [NEXT ACTION]:
iabbr hp [HIGH PRIORITY]:
iabbr aco [ACTION]:
iabbr smd [SOME DAY]:
iabbr wa [WAITING ON]:
iabbr dn [DONE]:
iabbr cav [Caveat]:
iabbr ai [ACTION ITEM]:
iabbr op [OPTIONAL]:
iabbr md [MUST DO]:


" Right punctuation
iabbr eg e.g.,
iabbr ie i.e.,
iabbr et et al.
iabbr etc etc.
iabbr thus thus,
iabbr Thus Thus,
iabbr Moreover Moreover,
iabbr However However,
iabbr Therefore Therefore,

" Salutation
iabbr mr Mr.
iabbr mrs Mrs.
iabbr ms Ms.
iabbr dr Dr.
iabbr pr Professor

iabbr bul ●
iabbr tbul ‣
iabbr dia ♦
iabbr sq ◾
iabbr sn §
iabbr OK ✓
iabbr NOK ✗
iabbr sta ✪



" Math and Symbols
iabbr mu µ
iabbr micro µ
iabbr microsecond µs
iabbr $$ £
iabbr eu €
iabbr i) ⅰ)
iabbr ii) ⅱ)
iabbr iii) ⅲ)
iabbr iv) ⅳ)
iabbr v) ⅴ)
"ⅵ ⅶ ⅷ ⅸ ⅹ ⅺ
iabbr -> →
iabbr => ⇒
iabbr <- ←
iabbr \<= ⇐
iabbr \!= ≠
iabbr \>= ≥
iabbr \<= ≤
iabbr <</ ≪
iabbr >>/ ≫
iabbr ==/ ≡
iabbr alpha α
iabbr beta ß
iabbr gamma γ
iabbr delta δ
iabbr lamda λ
iabbr epsilon ε
iabbr omega Ω
iabbr nset ∅
iabbr phi φ
iabbr pi π
iabbr prop ∝
iabbr sq( √
iabbr esum Ʃ
iabbr 1by4 ¼
iabbr 1by2 ½
iabbr 3by4 ¾
iabbr therefore/ ∴
iabbr because/ ∵
iabbr union/ ∪
iabbr inter/ ∩
iabbr and/ ∧
iabbr or/ ∨


" English words/names
" [NOTE]: Select all the words below and use 'sort -f -k 5' to sort the list
let b:english_words = {
\ 'acc'   : [ 'account', 'accounts'],
\ 'ack'   : [ 'ACK' ],
\ 'addr'  : [ 'address', 'addresses'],
\ 'adv'   : [ 'advertisement', 'advertisements'],
\ 'algo'  : [ 'algorithm', 'algorithms'],
\ 'apt'   : [ 'apartment', 'apartments'],
\ 'api'   : [ 'API', 'APIs' ],
\ 'app'   : [ 'application', 'applications'],
\ 'apr'   : [ 'April' ],
\ 'arch'  : [ 'architecture', 'architectures'],
\ 'asap'  : [ 'as early as possible'],
\ 'aug'   : [ 'August' ],
\ 'avg'   : [ 'average', 'averages'],
\ 'bw'    : [ 'bandwidth', 'bandwidths'],
\ 'bec'   : [ 'because' ],
\ 'btw'   : [ 'between' ],
\ 'bu'    : [ 'business unit' ],
\ 'cali'  : [ 'california' ],
\ 'capc'  : [ 'capacity', 'capacities' ],
\ 'cr'    : [ 'cognitive radio', 'cognitive radios'],
\ 'cmt'   : [ 'comment', 'comments'],
\ 'comm'  : [ 'communication', 'communications'],
\ 'comp'  : [ 'company', 'companies'],
\ 'cy'    : [ 'company', 'companies'],
\ 'com'   : [ 'computer', 'computers'],
\ 'conf'  : [ 'configuration', 'configurations'],
\ 'cc'    : [ 'congestion control' ],
\ 'crc'   : [ 'credit card' ],
\ 'cre'   : [ 'credit' ],
\ 'curr'  : [ 'currently' ],
\ 'dc'    : [ 'data center', 'data centers'],
\ 'ds'    : [ 'data structure', 'data structures'],
\ 'db'    : [ 'database', 'databases'],
\ 'de'    : [ 'Dear' ],
\ 'dec'   : [ 'December' ],
\ 'dept'  : [ 'department', 'departments'],
\ 'diff'  : [ 'different' ],
\ 'dir'   : [ 'directory', 'directories'],
\ 'dist'  : [ 'distributed' ],
\ 'doc'   : [ 'document', 'documents'],
\ 'feb'   : [ 'February' ],
\ 'fw'    : [ 'firewall', 'firewalls' ],
\ 'fwdl'  : [ 'firmware download' ],
\ 'fwd'   : [ 'forward' ],
\ 'freq'  : [ 'frequency', 'frequencies'],
\ 'fri'   : [ 'Friday' ],
\ 'gov'   : [ 'government' ],
\ 'hw'    : [ 'hardware' ],
\ 'howe'  : [ 'however,' ],
\ 'imp'   : [ 'important' ],
\ 'info'  : [ 'information', 'informations'],
\ 'infra' : [ 'infrastructure' ],
\ 'intro' : [ 'introduction', 'introductions'],
\ 'jan'   : [ 'January' ],
\ 'jul'   : [ 'July' ],
\ 'jun'   : [ 'June' ],
\ 'lib'   : [ 'library', 'libraries'],
\ 'lb'    : [ 'load balancer', 'load balancers' ],
\ 'mac'   : [ 'MacBook' ],
\ 'mar'   : [ 'March' ],
\ 'msg'   : [ 'message', 'messages'],
\ 'misc'  : [ 'miscellaneous' ],
\ 'mon'   : [ 'Monday' ],
\ 'ne'    : [ 'neighbor', 'neighbors'],
\ 'neh'   : [ 'neighborhood', 'neighborhoods'],
\ 'nw'    : [ 'network', 'networks'],
\ 'nov'   : [ 'November' ],
\ 'num'   : [ 'number', 'numbers'],
\ 'oct'   : [ 'October' ],
\ 'os'    : [ 'operating system', 'operating systems'],
\ 'pkt'   : [ 'packet', 'packets'],
\ 'phd'   : [ 'Ph. D.' ],
\ 'phy'   : [ 'physical' ],
\ 'poss'  : [ 'possible' ],
\ 'ps'    : [ 'presentation server' ],
\ 'prev'  : [ 'previous' ],
\ 'prob'  : [ 'probability', 'probabilities'],
\ 'proc'  : [ 'processor', 'processors'],
\ 'pf'    : [ 'profile server' ],
\ 'qos'   : [ 'Qos' ],
\ 'reco'  : [ 'recommendation', 'recommendations'],
\ 'sat'   : [ 'Saturday' ],
\ 'sep'   : [ 'September' ],
\ 'sw'    : [ 'software', 'softwares'],
\ 'soln'  : [ 'solution', 'solutions'],
\ 'sai'   : [ 'sudo apt-get -y install' ],
\ 'spi'   : [ 'sudo port install' ],
\ 'summ'  : [ 'summarization'],
\ 'sun'   : [ 'Sunday' ],
\ 'swt'   : [ 'switches' ],
\ 'sys'   : [ 'system', 'systems'],
\ 'tech'  : [ 'technology', 'technologies'],
\ 'temp'  : [ 'temporary' ],
\ 'ther'  : [ 'therefore,' ],
\ 'thu'   : [ 'Thursday' ],
\ 'tlv'   : [ 'TLV', 'TLVs'],
\ 'todo'  : [ 'TODO:' ],
\ 'tue'   : [ 'Tuesday' ],
\ 'univ'  : [ 'university', 'universities'],
\ 'wed'   : [ 'Wednesday' ],
\ 'wh'    : [ 'which' ],
\ 'wifi'  : [ 'WiFi' ],
\ 'wln'   : [ 'wireless networks' ],
\ 'wsn'   : [ 'wireless sensor networks' ],
\ 'wl'    : [ 'wireless' ],
\ 'wrt'   : [ 'with respect to' ],
\ 'wo'    : [ 'without ' ],
\ 'xml'   : [ 'XML' ]
\}


for [b:lhs, b:rhs_list] in items(b:english_words)
  call MyLibs#AddAbbr(b:lhs,b:rhs_list)
endfor


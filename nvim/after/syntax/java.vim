" some characters that cannot be in a java program (outside a string)
syntax match javaError "[\\@`]"
syntax match javaError "<<<\|\.\.\|=>\|||=\|&&=\|\*\/"
syntax match javaError "#\|=<"

syntax match javaOK "\.\.\."

" keyword definitions
syntax keyword javaExternal	native package import
syntax match javaExternal		"\<import\>\(\s\+static\>\)\?"
syntax keyword javaError		goto const
syntax keyword javaConditional	if else switch
syntax keyword javaRepeat		while for do
syntax keyword javaBoolean		true false
syntax keyword javaConstant	null
syntax keyword javaTypedef		this super
syntax keyword javaOperator	var new instanceof
syntax keyword javaType		boolean char byte short int long float double void
syntax keyword javaStatement	return
syntax keyword javaStorageClass	static synchronized transient volatile final strictfp serializable
syntax keyword javaExceptions	throw try catch finally
syntax keyword javaAssert		assert
syntax keyword javaMethodDecl	synchronized throws
syntax keyword javaClassDecl	extends implements interface
" to differentiate the keyword class from MyClass.class we use a match here
syntax match   javaTypedef		"\.\s*\<class\>"ms=s+1
syntax keyword javaClassDecl	enum
" syntax match   javaClassDecl	"^class\>"
syntax keyword   javaClassDecl	class
syntax match   javaClassDecl	"[^.]\s*\<class\>"ms=s+1
syntax match   javaAnnotation	"@\([_$a-zA-Z][_$a-zA-Z0-9]*\.\)*[_$a-zA-Z][_$a-zA-Z0-9]*\>" contains=javaString
syntax match   javaClassDecl	"@interface\>"
syntax keyword javaBranch		break continue nextgroup=javaUserLabelRef skipwhite
syntax match   javaUserLabelRef	"\k\+" contained
syntax match   javaVarArg		"\.\.\."
syntax keyword javaScopeDecl	public protected private abstract

" Java Modules(Since Java 9, for "module-info.java" file)
if fnamemodify(bufname("%"), ":t") == "module-info.java"
    syntax keyword javaModuleStorageClass	module transitive
    syntax keyword javaModuleStmt		open requires exports opens uses provides
    syntax keyword javaModuleExternal	to with
    syntax cluster javaTop add=javaModuleStorageClass,javaModuleStmt,javaModuleExternal
endif

" java.lang.*
syntax match javaLangClass "\<System\>"
syntax cluster javaTop add=javaR_JavaLang
syntax cluster javaClasses add=javaR_JavaLang
highlight link javaR_JavaLang javaR_Java
syntax keyword javaC_JavaLang Process RuntimePermission StringKeySet CharacterData01 Class ThreadLocal ThreadLocalMap CharacterData0E Package Character StringCoding Long ProcessImpl ProcessEnvironment Short AssertionStatusDirectives 1PackageInfoProxy UnicodeBlock InheritableThreadLocal AbstractStringBuilder StringEnvironment ClassLoader ConditionalSpecialCasing CharacterDataPrivateUse StringBuffer StringDecoder Entry StringEntry WrappedHook StringBuilder StrictMath State ThreadGroup Runtime CharacterData02 MethodArray Object CharacterDataUndefined Integer Gate Boolean Enum Variable Subset StringEncoder Void Terminator CharsetSD IntegerCache CharacterCache Byte CharsetSE Thread SystemClassLoaderAction CharacterDataLatin1 StringValues StackTraceElement Shutdown ShortCache String ConverterSD ByteCache Lock EnclosingMethodInfo Math Float Value Double SecurityManager LongCache ProcessBuilder StringEntrySet Compiler Number UNIXProcess ConverterSE ExternalData CaseInsensitiveComparator CharacterData00 NativeLibrary
syntax cluster javaTop add=javaC_JavaLang
syntax cluster javaClasses add=javaC_JavaLang
highlight link javaC_JavaLang javaC_Java
syntax keyword javaE_JavaLang IncompatibleClassChangeError InternalError UnknownError ClassCircularityError AssertionError ThreadDeath IllegalAccessError NoClassDefFoundError ClassFormatError UnsupportedClassVersionError NoSuchFieldError VerifyError ExceptionInInitializerError InstantiationError LinkageError NoSuchMethodError Error UnsatisfiedLinkError StackOverflowError AbstractMethodError VirtualMachineError OutOfMemoryError
syntax cluster javaTop add=javaE_JavaLang
syntax cluster javaClasses add=javaE_JavaLang
highlight link javaE_JavaLang javaE_Java
syntax keyword javaX_JavaLang CloneNotSupportedException Exception NoSuchMethodException IllegalAccessException NoSuchFieldException Throwable InterruptedException ClassNotFoundException InstantiationException
syntax cluster javaTop add=javaX_JavaLang
syntax cluster javaClasses add=javaX_JavaLang
highlight link javaX_JavaLang javaX_Java

highlight link javaR_Java javaR_
highlight link javaC_Java javaC_
highlight link javaE_Java javaE_
highlight link javaX_Java javaX_
highlight link javaX_		     javaExceptions
highlight link javaR_		     javaExceptions
highlight link javaE_		     javaExceptions
highlight link javaC_		     javaConstant

syntax keyword javaLangObject clone equals finalize getClass hashCode
syntax keyword javaLangObject notify notifyAll toString wait
highlight link javaLangObject		     javaConstant
syntax cluster javaTop add=javaLangObject

if filereadable(expand("<sfile>:p:h")."/javaid.vim")
  source <sfile>:p:h/javaid.vim
endif

syntax region  javaLabelRegion	transparent matchgroup=javaLabel start="\<case\>" matchgroup=NONE end=":" contains=javaNumber,javaCharacter,javaString
syntax match   javaUserLabel	"^\s*[_$a-zA-Z][_$a-zA-Z0-9_]*\s*:"he=e-1 contains=javaLabel
syntax keyword javaLabel		default

" The following cluster contains all java groups except the contained ones
syntax cluster javaTop add=javaExternal,javaError,javaBranch,javaLabelRegion,javaLabel,javaConditional,javaRepeat,javaBoolean,javaConstant,javaTypedef,javaOperator,javaType,javaPrimitive,javaStatement,javaStorageClass,javaAssert,javaExceptions,javaMethodDecl,javaClassDecl,javaScopeDecl,javaUserLabel,javaLangObject,javaAnnotation,javaVarArg


" Comments
syntax keyword javaTodo		 contained TODO FIXME XXX
syntax region  javaCommentString    contained start=+"+ end=+"+ end=+$+ end=+\*/+me=s-1,he=s-1 contains=javaSpecial,javaCommentStar,javaSpecialChar,@Spell
syntax region  javaComment2String   contained start=+"+	end=+$\|"+  contains=javaSpecial,javaSpecialChar,@Spell
syntax match   javaCommentCharacter contained "'\\[^']\{1,6\}'" contains=javaSpecialChar
syntax match   javaCommentCharacter contained "'\\''" contains=javaSpecialChar
syntax match   javaCommentCharacter contained "'[^\\]'"
syntax cluster javaCommentSpecial add=javaCommentString,javaCommentCharacter,javaNumber
syntax cluster javaCommentSpecial2 add=javaComment2String,javaCommentCharacter,javaNumber
syntax region  javaComment		 start="/\*"  end="\*/" contains=@javaCommentSpecial,javaTodo,@Spell
syntax match   javaCommentStar	 contained "^\s*\*[^/]"me=e-1
syntax match   javaCommentStar	 contained "^\s*\*$"
syntax match   javaLineComment	 "//.*" contains=@javaCommentSpecial2,javaTodo,@Spell
highlight link javaCommentString javaString
highlight link javaComment2String javaString
highlight link javaCommentCharacter javaCharacter

syntax cluster javaTop add=javaComment,javaLineComment

syntax case ignore

syntax region  javaDocComment	start="/\*\*"  end="\*/" keepend contains=javaCommentTitle,@javaHtml,javaDocTags,javaDocSeeTag,javaTodo,@Spell
syntax region  javaCommentTitle	contained matchgroup=javaDocComment start="/\*\*"   matchgroup=javaCommentTitle keepend end="\.$" end="\.[ \t\r<&]"me=e-1 end="[^{]@"me=s-2,he=s-1 end="\*/"me=s-1,he=s-1 contains=@javaHtml,javaCommentStar,javaTodo,@Spell,javaDocTags,javaDocSeeTag

syntax region javaDocTags	 contained start="{@\(code\|link\|linkplain\|inherit[Dd]oc\|doc[rR]oot\|value\)" end="}"
syntax match  javaDocTags	 contained "@\(param\|exception\|throws\|since\)\s\+\S\+" contains=javaDocParam
syntax match  javaDocParam	 contained "\s\S\+"
syntax match  javaDocTags	 contained "@\(version\|author\|return\|deprecated\|serial\|serialField\|serialData\)\>"
syntax region javaDocSeeTag	 contained matchgroup=javaDocTags start="@see\s\+" matchgroup=NONE end="\_."re=e-1 contains=javaDocSeeTagParam
syntax match  javaDocSeeTagParam  contained @"\_[^"]\+"\|<a\s\+\_.\{-}</a>\|\(\k\|\.\)*\(#\k\+\((\_[^)]\+)\)\=\)\=@ extend
syntax case match

" match the special comment /**/
syntax match   javaComment		 "/\*\*/"

" Strings and constants
syntax match   javaSpecialError	 contained "\\."
syntax match   javaSpecialCharError contained "[^']"
syntax match   javaSpecialChar	 contained "\\\([4-9]\d\|[0-3]\d\d\|[\"\\'ntbrf]\|u\x\{4\}\)"
syntax region  javaString		start=+"+ end=+"+ end=+$+ contains=javaSpecialChar,javaSpecialError,@Spell
syntax match   javaCharacter	 "'[^']*'" contains=javaSpecialChar,javaSpecialCharError
syntax match   javaCharacter	 "'\\''" contains=javaSpecialChar
syntax match   javaCharacter	 "'[^\\]'"
syntax match   javaNumber		 "\<\(0[bB][0-1]\+\|0[0-7]*\|0[xX]\x\+\|\d\(\d\|_\d\)*\)[lL]\=\>"
syntax match   javaNumber		 "\(\<\d\(\d\|_\d\)*\.\(\d\(\d\|_\d\)*\)\=\|\.\d\(\d\|_\d\)*\)\([eE][-+]\=\d\(\d\|_\d\)*\)\=[fFdD]\="
syntax match   javaNumber		 "\<\d\(\d\|_\d\)*[eE][-+]\=\d\(\d\|_\d\)*[fFdD]\=\>"
syntax match   javaNumber		 "\<\d\(\d\|_\d\)*\([eE][-+]\=\d\(\d\|_\d\)*\)\=[fFdD]\>"

" Unicode characters
syntax match   javaSpecial "\\u\d\{4\}"

syntax cluster javaTop add=javaString,javaCharacter,javaNumber,javaSpecial,javaStringError

" This line catches method declarations at any indentation>0, but it assumes...
"	1. class names are always capitalized (ie: 'Button')
"	2. method names are never capitalized (except constructors, of course)
syntax region javaFuncDef start=+^\s\+\(\(public\|protected\|private\|static\|abstract\|final\|native\|synchronized\)\s\+\)*\(<.*>\s\+\)\?\(\(void\|boolean\|char\|byte\|short\|int\|long\|float\|double\|\([A-Za-z_][A-Za-z0-9_$]*\.\)*[A-Z][A-Za-z0-9_$]*\)\(<[^(){}]*>\)\=\(\[\]\)*\s\+[a-z][A-Za-z0-9_$]*\|[A-Z][A-Za-z0-9_$]*\)\s*(+ end=+)+ contains=javaScopeDecl,javaPrimitive,javaType,javaStorageClass,javaComment,javaLineComment,@javaClasses,javaAnnotation,javaVariable
syntax match javaLambdaDef "[a-zA-Z_][a-zA-Z0-9_]*\s*->"
syntax match  javaBraces  "[{}]"
" syntax cluster javaTop add=javaFuncDef,javaBraces,javaLambdaDef

syntax match javaLambdaDef "([a-zA-Z0-9_<>\[\], \t]*)\s*->"

" The default highlighting.
highlight link javaLambdaDef		Function
highlight link javaFuncDef		Function
highlight link javaVarArg			Function
highlight javaBraces ctermfg=7
highlight link javaBranch			Conditional
highlight link javaUserLabelRef		javaUserLabel
highlight link javaLabel			Label
highlight link javaUserLabel		Label
highlight link javaConditional		Conditional
highlight link javaRepeat			Repeat
highlight link javaExceptions		Exception
highlight link javaAssert			Statement
highlight link javaStorageClass		StorageClass
highlight link javaMethodDecl		javaStorageClass
highlight link javaClassDecl		javaStorageClass
highlight link javaScopeDecl		javaStorageClass

highlight link javaBoolean		Boolean
highlight link javaSpecial		Special
highlight link javaSpecialError		Error
highlight link javaSpecialCharError	Error
highlight link javaString			String
highlight link javaCharacter		Character
highlight link javaSpecialChar		SpecialChar
highlight link javaNumber			Number
highlight link javaError			Error
highlight link javaStringError		Error
highlight link javaStatement		Statement
highlight link javaOperator		Operator
highlight link javaComment		Comment
highlight link javaDocComment		Comment
highlight link javaLineComment		Comment
highlight link javaConstant		Constant
highlight link javaTypedef		Typedef
highlight link javaTodo			Todo
highlight link javaAnnotation		PreProc

highlight link javaCommentTitle		SpecialComment
highlight link javaDocTags		Special
highlight link javaDocParam		Function
highlight link javaDocSeeTagParam		Function
highlight link javaCommentStar		javaComment

highlight link javaPrimitive			Type
highlight link javaType			Type
highlight link javaExternal		Include

highlight link javaSpaceError		Error

if fnamemodify(bufname("%"), ":t") == "module-info.java"
    hi link javaModuleStorageClass	StorageClass
    hi link javaModuleStmt		Statement
    hi link javaModuleExternal	Include
endif


syntax match javaVariable '\<\(\U\i\+\)\+\>'
highlight link javaVariable Variable

syntax match javaMemberVariable '\.\@<=\<\(\l\i\+\)\+\>\((\)\@!'
highlight link javaMemberVariable Variable

syntax match javaMemberFunction '\.\@<=\<\(\l\i\+\)\+\>\((\)\@='
highlight link javaMemberFunction Function

syntax match javaInstantiation '\<\i\+\>\s\+\<\i\+\>'
" Match class names written in PascalCase
"
syntax match javaFunction '\<\h\w*\>\((\)\@='
highlight link javaFunction Function

syntax match javaClass '\(\<\u\i\+\>\)\+'
" Match variable names written in camelCase
highlight link javaClass Class

syntax match javaExceptions '\u\i\*\(Exception\|Error\)'
highlight link javaExceptions Class

highlight link Variable Identifier
highlight Exception ctermfg=11

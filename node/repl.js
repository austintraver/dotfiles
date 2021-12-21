const repl = require('repl')

function notify(context) {
  notified=true
  console.log('Reset has occurred')
}

function depart() {
  // console.log('Goodbye')
  return
}

/* Build up the prompt string */
prompt_string = ""
prompt_string+="\x1b[0;37m"
prompt_string+="("
prompt_string+="\x1b[1;33m"
prompt_string+=process.env.USER
prompt_string+="\x1b[0;37m"
prompt_string+=")"
prompt_string+="\x1b[1;37m"
prompt_string+=" @ "
prompt_string+="\x1b[0;37m"
prompt_string+="("
prompt_string+="\x1b[1;35m"
prompt_string+="node"
prompt_string+="\x1b[0;37m"
prompt_string+=")"
prompt_string+="\x1b[1;31m"
prompt_string+=" & "
prompt_string+="\x1b[0m"


server = repl.start({
  prompt: prompt_string,
  input: process.stdin, // default
  output: process.stdout, // default
  useColors: true,
  useGlobal: true,
  /* Do not output return value when there isn't one */
  ignoreUndefined: true, 

  /* stop evaluating the current piece of code when SIGINT is received, 
  such as when Ctrl+C is pressed */
  breakEvalOnSigint: true 

})

// Call depart() function when user inputs `.exit` or <C-d>
server.on('exit', depart) 

// Call notify() function when user inputs `.clear`
server.on('reset', notify)

server.defineCommand('pwd', () => {
  console.log(process.cwd())
})

export default function (res, defSucMsg, defErrMsg) {
  let messageType, defMsg, success
  if (res.errorCode === '0000') {
    messageType = 'success'
    defMsg = defSucMsg
    success = true
  } else {
    messageType = 'error'
    defMsg = defErrMsg
    success = false
  }

  return { messageType, defMsg, success }
}

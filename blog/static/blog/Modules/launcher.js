var launcherData = {

    postWindowsLauncher: function(){

        var listener = $("#listenerWindows").val();

        if (listener == '' || listener == undefined || listener == null) {
          $("#listenerWindowsValidation").css("display", "block");
          return;
        }
        else $("#listenerWindowsValidation").css("display", "none");
        var time = $("#timeW").val()  == '' ? 5 :  $("#timeW").val();

        var model =
        {
            listener: listener,
            time : time
        }

        $.ajax({
            url: `/payload-Gen/`,
            type: "POST",
            data: model,
            success: function (data) {
                if (data) {

                    var payload = data;
                    $(document).Toasts('create', {
                        class: 'bg-success',
                        title: 'PowerShell Payload',
                        subtitle: 'Windows',
                        body: payload.payload,
                      })     
                      $("#divCopyElement").removeAttr('hidden')
                      $("#copyTarget").val(payload.payload)
                      $("#modal-windows-launcher").modal('hide');

                } else {
                    Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                }
            },
            error: function () {
                Swal.fire({
                    title: "Saved Failed",
                    text: '',
                    confirmButtonText: "Ok",
                    icon: 'error',
                })
            }
        })

    },

    postLinuxLauncher: function(){
 
      var listener = $("#listenerLinux").val();

      if (listener == '' || listener == undefined || listener == null) {
        $("#listenerLinuxValidation").css("display", "block");
        return;
      }
      else{
        $("#listenerLinuxValidation").css("display", "none");
      }

      var time = $("#timeL").val()  == '' ? 5 :  $("#timeL").val();
      
      var model =
      {
          listener: listener,
          time : time
      }

        $.ajax({
            url: `/lin_payload-Gen/`,
            type: "POST",
            data: model,
            success: function (data) {
                if (data) {
                    var payload = data;
                    $(document).Toasts('create', {
                        class: 'bg-success',
                        title: 'Bash Payload',
                        subtitle: 'Linux',
                        body: payload.payload,
                      })
                      $("#divCopyElement").removeAttr('hidden')
                      $("#copyTarget").val(payload.payload)
                      $("#modal-linux-launcher").modal('hide');
                } else {
                    Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                }
            },
            error: function () {
                Swal.fire({
                    title: "Saved Failed",
                    text: '',
                    confirmButtonText: "Ok",
                    icon: 'error',
                })
            }
        })
    },
    timeChangeInput : function(inp){
        var inpValue = inp.value;
        var inputTime =  inpValue >= 30 ? (inp.value = 30) : inpValue;
        $("time").val(inputTime)
      },

    ClearWindowsLauncher: function(){
        debugger;
        $("#modal-windows-launcher").modal('show')
        $("#listenerWindows").val('eth0');
        $("#timeW").val(5);
        $("#listenerWindowsValidation").css("display", "none");
    },

    ClearLinuxLauncher: function(){
        debugger;
        $("#modal-linux-launcher").modal('show')
        $("#listenerLinux").val('eth0');
        $("#timeL").val(5);
        $("#listenerLinuxValidation").css("display", "none");
    }

}
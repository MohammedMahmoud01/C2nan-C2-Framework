var launcherData = {

    postWindowsLauncher: function(){

        var listener = $("#listenerWindows").val();

        if (listener == '' || listener == undefined || listener == null) {
          $("#listenerWindowsValidation").css("display", "block");
          return;
        }
        else{
          $("#listenerWindowsValidation").css("display", "none");
        }
        debugger;

        var model = {
          listener: listener
        }

        $.ajax({
            url: `/payload-Gen/`,
            type: "POST",
            data: model,
            success: function (data) {
                debugger;
                if (data) {

                    var payload = data;
                    debugger;
                    $(document).Toasts('create', {
                        class: 'bg-maroon',
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

      debugger;

      var model = {
        listener: listener
      }


        debugger;
        $.ajax({
            url: `/lin_payload-Gen/`,
            type: "POST",
            data: model,
            success: function (data) {
                debugger;
                if (data) {

                    var payload = data;
                    debugger;
                    $(document).Toasts('create', {
                        class: 'bg-maroon',
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


    ClearWindowsLauncher: function(){
        debugger;
        $("#modal-windows-launcher").modal('show')
        $("#listenerWindows").val('');
        $("#listenerWindowsValidation").css("display", "none");
    },

    ClearLinuxLauncher: function(){
        debugger;
        $("#modal-linux-launcher").modal('show')
        $("#listenerLinux").val('');
        $("#listenerLinuxValidation").css("display", "none");
    }

}
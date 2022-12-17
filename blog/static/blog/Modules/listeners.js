var operatingSystem = '';

var listenerData = {

    postListener: function () {

        if (operatingSystem == '' || operatingSystem == undefined || operatingSystem == null) {
            $("#operatingSystem").css("display", "block");
            return;
          }
          else{
            $("#operatingSystem").css("display", "none");
          }

      var listener = $("#listener").val();

      if (listener == '' || listener == undefined || listener == null) {
        $("#listenerValidation").css("display", "block");
        return;
      }
      else{
        $("#listenerValidation").css("display", "none");
      }

      debugger;

      var model = {
        listener: listener
      }

      $.ajax({
        url: `/postlistener/`,
        type: "POST",
        data: model,
        success: function (data) {
          debugger;
          if (data) {
            
            Swal.fire({
              title: "Listener Created Successfully",
              text: '',
              confirmButtonText: "Ok",
              icon: 'success',
              confirmButtonColor: '#26B99A',
            }).then((result) => {

              
              ////////////////////////////////////////////////////////////  payload generation for windows  
              
              if(operatingSystem == '1'){

                debugger;
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
                                class: 'bg-success',
                                title: 'PowerShell Payload',
                                subtitle: 'Windows',
                                body: payload.payload,
                              })     
                              $("#divCopyElement").removeAttr('hidden')
                              $("#copyTarget").val(payload.payload)
                              $("#modal-listener").modal('hide');
    
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


              }   
              
              ///////////////////////////////////////////////////////////// End
            //////////////////////////////////////////////////////// payload generation for linux 
              if(operatingSystem == '2'){


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
                                class: 'bg-success',
                                title: 'Linux Payload',
                                subtitle: 'Linux',
                                body: payload.payload,
                              })     
                              $("#divCopyElement").removeAttr('hidden')
                              $("#copyTarget").val(payload.payload)
                              $("#modal-listener").modal('hide');
    
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


             }

             ///////////////////////////////////////////////////////////// End

                //location.href = "/payload-Gen/"
            });
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

    operatingSystemSelected: function (event) {
        operatingSystem = event.target.value;
        debugger;
    },
    clearModal: function(){
        $("#operatingSystem").css("display", "none");
        $("#listenerValidation").css("display", "none");
        $("#listener").val('');
        document.getElementById('Windows').checked = false;
        document.getElementById('Linux').checked = false;
        operatingSystem = '';

        $("#modal-listener").modal('show');
    },

  
}

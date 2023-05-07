
var TasksData = {

    allModules: [],

    filterdModules: [],


    GetFileResults : function() {
        
        $("#btnTask").attr('disabled' , '');
            $.ajax({
            url: `/getFileResult/${agentName}`,
            type: "GET",
            success: function (data) {
                //var filterData = data.replace(/\n/g, '')
                $("#fileResults").html(data)
            },
            error: function () {
                //alert("Error");
            }
        });
    
    },

    GetAgentHsitory: function(){
        debugger
        $("#btnTask").attr('disabled' , '');
            $.ajax({
            url: `/getAgentTasks/${agentName}/`,
            type: "GET",
            success: function (data) {
                
                TasksDraw.DrawAgentHistory(data);
            },
            error: function () {
                //alert("Error");
            }
        })

    },

    GetData: function () {
        $("#btnTask").attr('disabled' , '');
            $.ajax({
            url: `/tasksApi/0/`,
            type: "GET",
            success: function (data) {
                TasksData.allModules = data;
                TasksDraw.DrawDataTable();
                TasksDraw.DrawSelectTasks();
            },
            error: function () {
                //alert("Error");
            }
        })
    },

    StartWindowsAttack: function (id) {
        if (id == '1') {
            
            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id
            }

            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/applocker/`,
                type: "POST",
                data: model,
                success: function (data) {
                    
                    if (data) {

                        

                        Swal.fire({
                            title: "AppLocker Rules Start",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'success',
                            confirmButtonColor: '#26B99A',
                        }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

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
                    $("#btnTask").removeAttr('disabled');
                }
            })

        }
        else if (id == '2') {

            var path = $("#directoryListingPath").val();

            if (path == '' || path == undefined || path == null) {
                $("#directoryListingPathValidation").css("display", "block");
                return;
            }
            else {
                $("#directoryListingPathValidation").css("display", "none");
            }
            var model = {
                path: path,
                agent: agentName,
                agentId: agentId,
                moduleId:id
            }



            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/directorylist/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                        //location.href = "/payload-Gen/"
                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })


        }
        else if (id == '3') {

            var url = $("#uRLDownloadWindows").val();

            if (url == '' || url == undefined || url == null) {
                $("#uRLDownloadWindowsValidation").css("display", "block");
                return;
            }
            else {
                $("#uRLDownloadWindowsValidation").css("display", "none");
            }

            var outPath = $("#outPath").val();

            if (outPath == '' || outPath == undefined || outPath == null) {
                $("#outPathValidation").css("display", "block");
                return;
            }
            else {
                $("#outPathValidation").css("display", "none");
            }
            var model = {
                url: url,
                outpath: outpath,
                agent: agentName,
                agentId: agentId,
                moduleId:id
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/download/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })

        }
        else if (id == '4') {

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/envvar/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        else if (id == '5') {

            var phraseWindows = $("#phraseWindows").val();

            if (phraseWindows == '' || phraseWindows == undefined || phraseWindows == null) {
                $("#phraseWindowsValidation").css("display", "block");
                return;
            }
            else {
                $("#phraseWindowsValidation").css("display", "none");
            }

            var model = {
                agent: agentName,
                phrase: phraseWindows,
                agentId: agentId,
                moduleId:id
            }

            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/phrasefinder/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        else if (id == '6') {

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/ipswindows/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        else if (id == '7') {

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/loggedusers/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        else if (id == '8') {

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/netconnections/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        else if (id == '9') {

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/programs/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        else if (id == '10') {

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/processeswindows/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        else if (id == '11') {

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/screenshot/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        else if (id == '12') {

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/winuserinfo/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        else if (id == '13') {

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/systeminfo/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        else if (id == '14') {

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/updateswindows/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        else if (id == '15') {

            var file_path = $("#filePath").val();

            if (file_path == '' || file_path == undefined || file_path == null) {
                $("#filePathValidation").css("display", "block");
                return;
            }
            else $("#filePathValidation").css("display", "none");
            

            var destination = $("#fileDestination").val();

            if (destination == '' || destination == undefined || destination == null) {
                $("#fileDestinationValidation").css("display", "block");
                return;
            }
            else $("#fileDestinationValidation").css("display", "none");
            


            var model = {
                file_path: file_path,
                destination: destination,
                agent: agentName,
                agentId: agentId,
                moduleId:id,
                ip: ip
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/uploads/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        else if (id == '16') {

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/windefstat/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
       
        else if (id == '17') {

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/namedpipes/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
      
        else if (id == '18') {

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/juicypotato/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }

        else if (id == '69') {

            var url = $("#URLofFile").val();

            if (url == '' || url == undefined || url == null) {
                $("#URLofFileValidation").css("display", "block");
                return;
            }
            else $("#URLofFileValidation").css("display", "none");
            

            var OutputFilePath = $("#OutputFilePath").val();

            if (OutputFilePath == '' || OutputFilePath == undefined || OutputFilePath == null) {
                $("#OutputFilePathValidation").css("display", "block");
                return;
            }
            else $("#OutputFilePathValidation").css("display", "none");


            var model = {
                agent: agentName,
                agentId: agentId,
                url: url,
                outpath: OutputFilePath,
                moduleId:id
            }

            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/DownloadFileAsync/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
     
        else if (id == '70') {

            var url = $("#url").val();

            if (url == '' || url == undefined) {
                $("#urlValidation").css("display", "block");
                return;
            }
            else $("#urlValidation").css("display", "none");


            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id,
                url : url
            }

            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/DownloadString/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }

        else if (id == '71') {

            var url = $("#url").val();

            if (url == '' || url == undefined) {
                $("#urlValidation").css("display", "block");
                return;
            }
            else $("#urlValidation").css("display", "none");


            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id,
                url : url
            }

            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/Download_SMB/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }

        else if (id == '72') {

            var outpath = $("#outpath").val();

            if (outpath == '' || outpath == undefined) {
                $("#outpathValidation").css("display", "block");
                return;
            }
            else $("#outpathValidation").css("display", "none");

            var filename = $("#filename").val();

            if (filename == '' || filename == undefined) {
                $("#filenameValidation").css("display", "block");
                return;
            }
            else $("#filenameValidation").css("display", "none");


            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id,
                filename : filename,
                outpath: outpath
            }

            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/Download_FTP/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }

        else if (id == '73') {

            var serverport = $("#serverport").val();

            if (serverport == '' || serverport == undefined) {
                $("#serverportValidation").css("display", "block");
                return;
            }
            else $("#serverportValidation").css("display", "none");

            var filepath = $("#filepath").val();

            if (filepath == '' || filepath == undefined) {
                $("#filepathValidation").css("display", "block");
                return;
            }
            else $("#filepathValidation").css("display", "none");


            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id,
                filepath : filepath,
                serverport: serverport
            }

            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/Invoke_fileUpload/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }

        else if (id == '74') {

            var serverport = $("#serverport").val();

            if (serverport == '' || serverport == undefined) {
                $("#serverportValidation").css("display", "block");
                return;
            }
            else $("#serverportValidation").css("display", "none");

            var filepath = $("#filepath").val();

            if (filepath == '' || filepath == undefined) {
                $("#filepathValidation").css("display", "block");
                return;
            }
            else $("#filepathValidation").css("display", "none");


            var outfile = $("#outfile").val();

            if (outfile == '' || outfile == undefined) {
                $("#outfileValidation").css("display", "block");
                return;
            }
            else $("#outfileValidation").css("display", "none");

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id,
                filepath : filepath,
                serverport: serverport,
                outfile:outfile
            }

            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/FTP_fileUpload/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }

        else if (id == '75') {

            var serverport = $("#serverport").val();

            if (serverport == '' || serverport == undefined) {
                $("#serverportValidation").css("display", "block");
                return;
            }
            else $("#serverportValidation").css("display", "none");

            var timeout = $("#timeout").val();

            if (timeout == '' || timeout == undefined) {
                $("#timeoutValidation").css("display", "block");
                return;
            }
            else $("#timeoutValidation").css("display", "none");


            var directory = $("#directory").val();

            if (directory == '' || directory == undefined) {
                $("#directoryValidation").css("display", "block");
                return;
            }
            else $("#directoryValidation").css("display", "none");

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id,
                timeout : timeout,
                serverport: serverport,
                directory:directory
            }

            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/open_pythonserver/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }

        else if (id == '76') {

            var serverport = $("#serverport").val();

            if (serverport == '' || serverport == undefined) {
                $("#serverportValidation").css("display", "block");
                return;
            }
            else $("#serverportValidation").css("display", "none");

            var timeout = $("#timeout").val();

            if (timeout == '' || timeout == undefined) {
                $("#timeoutValidation").css("display", "block");
                return;
            }
            else $("#timeoutValidation").css("display", "none");


            var directory = $("#directory").val();

            if (directory == '' || directory == undefined) {
                $("#directoryValidation").css("display", "block");
                return;
            }
            else $("#directoryValidation").css("display", "none");

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id,
                timeout : timeout,
                serverport: serverport,
                directory:directory
            }

            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/open_SMBserver/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }

        else if (id == '77') {

            var serverport = $("#serverport").val();

            if (serverport == '' || serverport == undefined) {
                $("#serverportValidation").css("display", "block");
                return;
            }
            else $("#serverportValidation").css("display", "none");

            var timeout = $("#timeout").val();

            if (timeout == '' || timeout == undefined) {
                $("#timeoutValidation").css("display", "block");
                return;
            }
            else $("#timeoutValidation").css("display", "none");


            var directory = $("#directory").val();

            if (directory == '' || directory == undefined) {
                $("#directoryValidation").css("display", "block");
                return;
            }
            else $("#directoryValidation").css("display", "none");

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id,
                timeout : timeout,
                serverport: serverport,
                directory:directory
            }
            HelperV2.AjaxCallPost(`/open_FTPserver/`, model, function (data) {
                SwalFireMessage.SuccessMessage();
            });
        }

        else if (id == '78') {

            var serverport = $("#serverport").val();

            if (serverport == '' || serverport == undefined) {
                $("#serverportValidation").css("display", "block");
                return;
            }
            else $("#serverportValidation").css("display", "none");

            var timeout = $("#timeout").val();

            if (timeout == '' || timeout == undefined) {
                $("#timeoutValidation").css("display", "block");
                return;
            }
            else $("#timeoutValidation").css("display", "none");


            var directory = $("#directory").val();

            if (directory == '' || directory == undefined) {
                $("#directoryValidation").css("display", "block");
                return;
            }
            else $("#directoryValidation").css("display", "none");

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id,
                timeout : timeout,
                serverport: serverport,
                directory:directory
            }
            HelperV2.AjaxCallPost(`/open_PY_UploadServer/`, model, function (data) {
                SwalFireMessage.SuccessMessage();
            });
        }

        else if (id == '79') {

            var serverport = $("#serverport").val();

            if (serverport == '' || serverport == undefined) {
                $("#serverportValidation").css("display", "block");
                return;
            }
            else $("#serverportValidation").css("display", "none");

            var timeout = $("#timeout").val();

            if (timeout == '' || timeout == undefined) {
                $("#timeoutValidation").css("display", "block");
                return;
            }
            else $("#timeoutValidation").css("display", "none");


            var directory = $("#directory").val();

            if (directory == '' || directory == undefined) {
                $("#directoryValidation").css("display", "block");
                return;
            }
            else $("#directoryValidation").css("display", "none");

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id,
                timeout : timeout,
                serverport: serverport,
                directory:directory
            }
            HelperV2.AjaxCallPost(`/open_FTP_UploadServer/`, model, function (data) {
                SwalFireMessage.SuccessMessage();
            });
        }

        else if (id == '80') {

            var listenport  = $("#listenport").val();

            if (listenport == '' || listenport == undefined) {
                $("#listenportValidation").css("display", "block");
                return;
            }
            else $("#listenportValidation").css("display", "none");

            var myip = $("#myip").val();

            if (myip == '' || myip == undefined) {
                $("#myipValidation").css("display", "block");
                return;
            }
            else $("#myipValidation").css("display", "none");


            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id,
                myip:myip
            }
            HelperV2.AjaxCallPost(`/printspoofer/`, model, function (data) {
                SwalFireMessage.SuccessMessage();
            });
        }

        else if (id == '81') {

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id
            }
            HelperV2.AjaxCallPost(`/Perm_pip/`, model, function (data) {
                SwalFireMessage.SuccessMessage();
            });
        }

        else if (id == '82') {

            var Args = $("#Args").val();

            if (Args == '' || Args == undefined) {
                $("#ArgsValidation").css("display", "block");
                return;
            }
            else $("#ArgsValidation").css("display", "none");

            var timeout = $("#timeout").val();

            if (exeFile == '' || exeFile == undefined) {
                $("#exeFileValidation").css("display", "block");
                return;
            }
            else $("#exeFileValidation").css("display", "none");


            var dmpFile = $("#dmpFile").val();

            if (dmpFile == '' || dmpFile == undefined) {
                $("#dmpFileValidation").css("display", "block");
                return;
            }
            else $("#dmpFileValidation").css("display", "none");


            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id,
                Args: Args,
                exeFile: exeFile,
                dmpFile:dmpFile,
            }
            HelperV2.AjaxCallPost(`/procdump/`, model, function (data) {
                SwalFireMessage.SuccessMessage();
            });
        }

        else if (id == '83') {

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/tasklist/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }

     
 

        else if (id == '84') {

            var path_to_execute = $("#path_to_execute").val();

            if (path_to_execute == '' || path_to_execute == undefined || path_to_execute == null) {
                $("#path_to_executeValidation").css("display", "block");
                return;
            }
            else $("#path_to_executeValidation").css("display", "none");

            var pid = $("#pid").val();

            if (pid == '' || pid == undefined || pid == null) {
                $("#pidValidation").css("display", "block");
                return;
            }
            else $("#pidValidation").css("display", "none");

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id,
                path_to_execute:path_to_execute,
                pid:pid
            }

            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/SeDebugPrivilege/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
 
        else if (id == '85') {

            var Module_Path = $("#Module_Path").val();

            if (Module_Path == '' || Module_Path == undefined || Module_Path == null) {
                $("#Module_PathValidation").css("display", "block");
                return;
            }
            else $("#Module_PathValidation").css("display", "none");


            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id,
                module_Path : Module_Path
            }

            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/Import_Module/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }

        else if (id == '86') {

            var Module_Path = $("#Module_Path").val();

            if (Module_Path == '' || Module_Path == undefined || Module_Path == null) {
                $("#Module_PathValidation").css("display", "block");
                return;
            }
            else $("#Module_PathValidation").css("display", "none");


            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id,
                module_Path : Module_Path
            }

            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/Exec_Module/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }

        else if (id == '87') {

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/Chk_File_Owner/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }

        else if (id == '88') {

            var FilePath = $("#FilePath").val();

            if (FilePath == '' || FilePath == undefined) {
                $("#FilePathValidation").css("display", "block");
                return;
            }
            else $("#FilePathValidation").css("display", "none");


            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id,
                FilePath : FilePath
            }

            HelperV2.AjaxCallPost(`/Take_Own/`, model, function (data) {
                SwalFireMessage.SuccessMessage();
            });
        }

        else if (id == '89') {

    
            var FilePath = $("#FilePath").val();

            if (FilePath == '' || FilePath == undefined) {
                $("#FilePathValidation").css("display", "block");
                return;
            }
            else $("#FilePathValidation").css("display", "none");

            var UserName = $("#UserName").val();

            if (UserName == '' || UserName == undefined) {
                $("#UserNameValidation").css("display", "block");
                return;
            }
            else $("#UserNameValidation").css("display", "none");

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id,
                UserName : UserName
            }

            HelperV2.AjaxCallPost(`/ACL_modify/`, model, function (data) {
                SwalFireMessage.SuccessMessage();
            });
        }

        else if (id == '90') {

            var FileToCopy = $("#FileToCopy").val();

            if (FileToCopy == '' || FileToCopy == undefined) {
                $("#FileToCopyValidation").css("display", "block");
                return;
            }
            else $("#fFileToCopyValidation").css("display", "none");

            var outPut = $("#outPut").val();

            if (outPut == '' || outPut == undefined) {
                $("#outPutValidation").css("display", "block");
                return;
            }
            else $("#outPutValidation").css("display", "none");

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id,
                outPut : outPut,
                FileToCopy: FileToCopy
            }

            HelperV2.AjaxCallPost(`/SeBackUpPrivelege/`, model, function (data) {
                SwalFireMessage.SuccessMessage();
            });
        }

        setTimeout(function () { TasksData.GetFileResults(); }, 10000);
        setTimeout(function () { TasksData.GetAgentHsitory(); }, 10000);
        $("#agentHistoryTb").DataTable().destroy();
    },


    StartLinuxAttack: function (id) {
        //Apache
        if (id == '19') {

            
            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id
            }

            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/apache/`,
                type: "POST",
                data: model,
                success: function (data) {
                    
                    if (data) {
                        Swal.fire({
                            title: "Done",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'success',
                            confirmButtonColor: '#26B99A',
                        }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

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
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        // Available Shell
        else if (id == '20') {

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id
            }
 
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/availableshell/`,
                type: "POST",
                data: model,
                success: function (data) {
                    
                    if (data) {

                        

                        Swal.fire({
                            title: "Done",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'success',
                            confirmButtonColor: '#26B99A',
                        }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

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
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        // Cronjobs
        else if (id == '21') {

            
            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id
            }

            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/cronjobs/`,
                type: "POST",
                data: model,
                success: function (data) {
                    
                    if (data) {

                        

                        Swal.fire({
                            title: "Done",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'success',
                            confirmButtonColor: '#26B99A',
                        }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

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
                    $("#btnTask").removeAttr('disabled');
                }
            })

        }
        //Hidden Files
        else if (id == '22') {

            
            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id
            }

            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/hiddenfiles/`,
                type: "POST",
                data: model,
                success: function (data) {
                    
                    if (data) {

                        

                        Swal.fire({
                            title: "Done",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'success',
                            confirmButtonColor: '#26B99A',
                        }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

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
                    $("#btnTask").removeAttr('disabled');
                }
            })

        }
        //Lsof
        else if (id == '23') {

            
            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id
            }

            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/lsof/`,
                type: "POST",
                data: model,
                success: function (data) {
                    
                    if (data) {

                        

                        Swal.fire({
                            title: "Done",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'success',
                            confirmButtonColor: '#26B99A',
                        }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

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
                    $("#btnTask").removeAttr('disabled');
                }
            })

        }
        //OS info
        else if (id == '24') {

            
            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id
            }

            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/osinfo/`,
                type: "POST",
                data: model,
                success: function (data) {
                    
                    if (data) {

                        

                        Swal.fire({
                            title: "Done",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'success',
                            confirmButtonColor: '#26B99A',
                        }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

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
                    $("#btnTask").removeAttr('disabled');
                }
            })

        }
        //Processes
        else if (id == '25') {

            
            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id
            }

            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/processeslinux/`,
                type: "POST",
                data: model,
                success: function (data) {
                    
                    if (data) {

                        

                        Swal.fire({
                            title: "Done",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'success',
                            confirmButtonColor: '#26B99A',
                        }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

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
                    $("#btnTask").removeAttr('disabled');
                }
            })

        }
        //Selinux
        else if (id == '26') {

            
            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id
            }

            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/selinux/`,
                type: "POST",
                data: model,
                success: function (data) {
                    
                    if (data) {

                        

                        Swal.fire({
                            title: "Done",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'success',
                            confirmButtonColor: '#26B99A',
                        }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

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
                    $("#btnTask").removeAttr('disabled');
                }
            })

        }
        //SpecialPermissions
        else if (id == '27') {

            
            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id
            }

            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/specialpermissions/`,
                type: "POST",
                data: model,
                success: function (data) {
                    
                    if (data) {

                        

                        Swal.fire({
                            title: "Done",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'success',
                            confirmButtonColor: '#26B99A',
                        }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

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
                    $("#btnTask").removeAttr('disabled');
                }
            })

        }
        //TCP_UDP
        else if (id == '28') {

            
            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id
            }

            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/tcpudp/`,
                type: "POST",
                data: model,
                success: function (data) {
                    
                    if (data) {

                        

                        Swal.fire({
                            title: "Done",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'success',
                            confirmButtonColor: '#26B99A',
                        }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

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
                    $("#btnTask").removeAttr('disabled');
                }
            })

        }
        //usr_priv
        else if (id == '29') {

            
            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id
            }

            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/userpermissions/`,
                type: "POST",
                data: model,
                success: function (data) {
                    
                    if (data) {

                        

                        Swal.fire({
                            title: "Done",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'success',
                            confirmButtonColor: '#26B99A',
                        }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

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
                    $("#btnTask").removeAttr('disabled');
                }
            })

        }
        //Usrs info
        else if (id == '30') {

            
            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id
            }

            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/linuserinfo/`,
                type: "POST",
                data: model,
                success: function (data) {
                    
                    if (data) {

                        

                        Swal.fire({
                            title: "Done",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'success',
                            confirmButtonColor: '#26B99A',
                        }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

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
                    $("#btnTask").removeAttr('disabled');
                }
            })

        }
        //Whoami
        else if (id == '31') {

            
            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id
            }

            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/whoami/`,
                type: "POST",
                data: model,
                success: function (data) {
                    
                    if (data) {

                        

                        Swal.fire({
                            title: "Done",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'success',
                            confirmButtonColor: '#26B99A',
                        }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

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
                    $("#btnTask").removeAttr('disabled');
                }
            })

        }
        else if (id == '51'){

            var path = $("#changeDirectoryPath").val();

            if (path == '' || path == undefined || path == null) {
                $("#changeDirectoryPathValidation").css("display", "block");
                return;
            }
            else {
                $("#directoryListingPathValidation").css("display", "none");
            }
            var model = {
                path: path,
                agent: agentName,
                agentId: agentId,
                moduleId:id
            }

            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/linuxChangeDirectory/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                        //location.href = "/payload-Gen/"
                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })


        }
        else if (id == '52'){
            var mode = $("#linuxMode").val();

            if (mode == '' || mode == undefined || mode == null) {
                $("#linuxModeValidation").css("display", "block");
                return;
            }
            else {
                $("#linuxModeValidation").css("display", "none");
            }

            var filePath = $("#filePath").val();

            if (filePath == '' || filePath == undefined || filePath == null) {
                $("#filePathValidation").css("display", "block");
                return;
            }
            else {
                $("#filePathValidation").css("display", "none");
            }

            var model = {
                mode: mode,
                filePath:filePath,
                agent: agentName,
                agentId: agentId,
                moduleId:id
            }

            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/linuxChmod/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                        //location.href = "/payload-Gen/"
                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })

        }
        else if (id == '53'){
            var path1 = $("#path1").val();

            if (path1 == '' || path1 == undefined || path1 == null) {
                $("#path1Validation").css("display", "block");
                return;
            }
            else {
                $("#path1Validation").css("display", "none");
            }

            var path2 = $("#path2").val();

            if (path2 == '' || path2 == undefined || path2 == null) {
                $("#path2Validation").css("display", "block");
                return;
            }
            else {
                $("#path2Validation").css("display", "none");
            }

            var model = {
                path1: path1,
                path2: path2,
                agent: agentName,
                agentId: agentId,
                moduleId:id
            }

            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/linuxcp/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');
                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })

        }
        else if (id == '54'){

            var cfile = $("#cfile").val();

            if (cfile == '' || cfile == undefined || cfile == null) {
                $("#cfileValidation").css("display", "block");
                return;
            }
            else {
                $("#cfileValidation").css("display", "none");
            }

            var option = $("#option").val();

            if (option == '' || option == undefined || option == null) {
                $("#optionValidation").css("display", "block");
                return;
            }
            else {
                $("#optionValidation").css("display", "none");
            }

            var bfile = $("#bfile").val();

            if (bfile == '' || bfile == undefined || bfile == null) {
                $("#bfileValidation").css("display", "block");
                return;
            }
            else {
                $("#bfileValidation").css("display", "none");
            }

            var model = {
                cfile: cfile,
                agent: agentName,
                agentId: agentId,
                moduleId:id,
                option:option,
                bfile:bfile
            }

            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/linuxgcc/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');
                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })

        }
        else if (id == '55'){
            var path = $("#directoryListingPath").val();

            if (path == '' || path == undefined || path == null) {
                $("#directoryListingPathValidation").css("display", "block");
                return;
            }
            else {
                $("#directoryListingPathValidation").css("display", "none");
            }
            var model = {
                path: path,
                agent: agentName,
                agentId: agentId,
                moduleId:id,
            }

            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/linuxDirectoryListingDetails/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');
                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })

        }
        else if (id == '56'){
            var path = $("#directoryListingPath").val();

            if (path == '' || path == undefined || path == null) {
                $("#directoryListingPathValidation").css("display", "block");
                return;
            }
            else {
                $("#directoryListingPathValidation").css("display", "none");
            }
            var model = {
                path: path,
                agent: agentName,
                agentId: agentId,
                moduleId:id,
            }

            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/linuxDirectoryListing/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');
                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })

        }
        else if (id == '57'){
            var dirName = $("#makeDirectory").val();

            if (dirName == '' || dirName == undefined || dirName == null) {
                $("#makeDirectoryValidation").css("display", "block");
                return;
            }
            else {
                $("#makeDirectoryValidation").css("display", "none");
            }
            var model = {
                dirName: dirName,
                agent: agentName,
                agentId: agentId,
                moduleId:id,
            }

            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/linuxMakeDirectory/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');
                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })

        }
        else if (id == '58'){
            var option = $("#option").val();

            if (option == '' || option == undefined || option == null) {
                $("#optionValidation").css("display", "block");
                return;
            }
            else {
                $("#optionValidation").css("display", "none");
            }

            var atr = $("#atr").val();

            if (atr == '' || atr == undefined || atr == null) {
                $("#atrValidation").css("display", "block");
                return;
            }
            else {
                $("#atrValidation").css("display", "none");
            }

            var model = {
                option: option,
                agent: agentName,
                agentId: agentId,
                moduleId:id,
                atr:atr
            }

            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/linuxNetdiscover/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');
                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })

        }
        else if (id == '59'){
            var fileName = $("#fileName").val();
        
            if (fileName == '' || fileName == undefined || fileName == null) {
                $("#fileNameValidation").css("display", "block");
                return;
            }
            else {
                $("#fileNameValidation").css("display", "none");
            }
            var model = {
                fileName: fileName,
                agent: agentName,
                agentId: agentId,
                moduleId:id
            }

            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/linuxTouch/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');
                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })

        }
        else if (id == '60'){
            var command = $("#command").val();

            if (command == '' || command == undefined || command == null) {
                $("#commandValidation").css("display", "block");
                return;
            }
            else {
                $("#commandValidation").css("display", "none");
            }
            var model = {
                command: command,
                agent: agentName,
                agentId: agentId,
                moduleId:id
            }

            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/linuxBash/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');
                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })

        }
        else if (id == '61'){
            var arg = $("#arg").val();
            var model = {
                arg: arg,
                agent: agentName,
                agentId: agentId,
                moduleId:id
            }

            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/linuxWfuzz/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');
                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })

        }
        else if (id == '62'){
            var username = $("#userName").val();

            if (username == '' || username == undefined || username == null) {
                $("#userNameValidation").css("display", "block");
                return;
            }
            else {
                $("#userNameValidation").css("display", "none");
            }


            var password = $("#password").val();

            if (password == '' || password == undefined || password == null) {
                $("#passwordValidation").css("display", "block");
                return;
            }
            else {
                $("#passwordValidation").css("display", "none");
            }


            var command = $("#command").val();

            if (command == '' || command == undefined || command == null) {
                $("#commandValidation").css("display", "block");
                return;
            }
            else {
                $("#commandValidation").css("display", "none");
            }


            var model = {
                password: password,
                command:command,
                username:username,
                agent: agentName,
                agentId: agentId,
                moduleId:id
            }

            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/executeCommandWithSpecUser/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');
                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })

        }
        else if (id == '63'){
            var url = $("#url").val();

            if (url == '' || url == undefined || url == null) {
                $("#urlValidation").css("display", "block");
                return;
            }
            else {
                $("#urlValidation").css("display", "none");
            }


            var output = $("#output").val();


            var model = {
                output: output,
                url:url,
                agent: agentName,
                agentId: agentId,
                moduleId:id
            }

            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/linuxdownload/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');
                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })

        }        

        setTimeout(function () { TasksData.GetFileResults(); }, 10000);
        setTimeout(function () { TasksData.GetAgentHsitory(); }, 10000);
        $("#agentHistoryTb").DataTable().destroy();

    },

    StartActiveDirectoryAttack: function (id) {

        if (id == '32') {
            
            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id,
            }

            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/SPNUsersforKerb/`,
                type: "POST",
                data: model,
                success: function (data) {
                    
                    if (data) {

                        

                        Swal.fire({
                            title: "AppLocker Rules Start",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'success',
                            confirmButtonColor: '#26B99A',
                        }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

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
                    $("#btnTask").removeAttr('disabled');
                }
            })

        }
        else if (id == '33') {

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id,
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/acclisting/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        else if (id == '34') {

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id,
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/adapter/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        else if (id == '35') {

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id,
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/arptable/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        else if (id == '36') {

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id,
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/defensecheck/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        else if (id == '37') {

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id,
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/domaininfo/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        else if (id == '38') {

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id,
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/domainusers/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        else if (id == '39') {

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id,
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/downloadwindows/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        else if (id == '40') {

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id,
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/envactivedirectoryvalue/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        else if (id == '41') {

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id,
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/groupslisting/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        else if (id == '42') {

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id,
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/groups/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        else if (id == '43') {

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id,
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/hotfixes/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        else if (id == '44') {

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id,
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/ip4route/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        else if (id == '45') {

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id,
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/listexecpolicies/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        else if (id == '46') {

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id,
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/listingmodules/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        else if (id == '48') {

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id,
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/sysacclisting/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        else if (id == '49') {

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id,
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/trustmap/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        else if (id == '50') {

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id,
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/trustrelation/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        else if (id == '65') {

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id,
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/activedirSystemInfo/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        else if (id == '66') {

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id,
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/activedirDomainInfo/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        else if (id == '67') {

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id,
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/activedirDomainUsers/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        else if (id == '92') 
        {
            var linkedin_mail = $("#linkedin_mail").val();

            if (linkedin_mail == '' || linkedin_mail == undefined || linkedin_mail == null) {
                $("#linkedin_mailValidation").css("display", "block");
                return;
            }
            else {
                $("#linkedin_mailValidation").css("display", "none");
            }
            
            var comp = $("#comp").val();

            if (comp == '' || comp == undefined || comp == null) {
                $("#compValidation").css("display", "block");
                return;
            }
            else {
                $("#compValidation").css("display", "none");
            }

            var linkedin_password = $("#linkedin_password").val();

            if (linkedin_password == '' || linkedin_password == undefined || linkedin_password == null) {
                $("#linkedin_passwordValidation").css("display", "block");
                return;
            }
            else {
                $("#linkedin_passwordValidation").css("display", "none");
            }

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id,
                linkedin_mail:linkedin_mail,
                linkedin_password:linkedin_password,
                comp:comp
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/linkedinusers/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        else if (id == '93') 
        {
            var username = $("#username").val();

            if (username == '' || username == undefined || username == null) {
                $("#usernameValidation").css("display", "block");
                return;
            }
            else {
                $("#usernameValidation").css("display", "none");
            }
            
            var password = $("#password").val();

            if (password == '' || password == undefined || password == null) {
                $("#passwordValidation").css("display", "block");
                return;
            }
            else {
                $("#passwordValidation").css("display", "none");
            }

            var ip = $("#ip").val();

            if (ip == '' || ip == undefined || ip == null) {
                $("#ipValidation").css("display", "block");
                return;
            }
            else {
                $("#ipValidation").css("display", "none");
            }


            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id,
                username:username,
                password:password,
                ip:ip
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/EnumSMBShares/`,
                type: "POST",
                data: model,
                success: function (data) {
                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        else if (id == '94') 
        {
            var username = $("#username").val();

            if (username == '' || username == undefined || username == null) {
                $("#usernameValidation").css("display", "block");
                return;
            }
            else {
                $("#usernameValidation").css("display", "none");
            }
            
            var password = $("#password").val();

            if (password == '' || password == undefined || password == null) {
                $("#passwordValidation").css("display", "block");
                return;
            }
            else {
                $("#passwordValidation").css("display", "none");
            }

            var ip = $("#ip").val();

            if (ip == '' || ip == undefined || ip == null) {
                $("#ipValidation").css("display", "block");
                return;
            }
            else {
                $("#ipValidation").css("display", "none");
            }


            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id,
                username:username,
                password:password,
                ip:ip
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/TestingCredsonDC/`,
                type: "POST",
                data: model,
                success: function (data) {
                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        else if (id == '95') 
        {
            var username = $("#username").val();

            if (username == '' || username == undefined || username == null) {
                $("#usernameValidation").css("display", "block");
                return;
            }
            else {
                $("#usernameValidation").css("display", "none");
            }
            
            var password = $("#password").val();

            if (password == '' || password == undefined || password == null) {
                $("#passwordValidation").css("display", "block");
                return;
            }
            else {
                $("#passwordValidation").css("display", "none");
            }

            var ip = $("#ip").val();

            if (ip == '' || ip == undefined || ip == null) {
                $("#ipValidation").css("display", "block");
                return;
            }
            else {
                $("#ipValidation").css("display", "none");
            }

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id,
                username:username,
                password:password,
                ip:ip
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/userenumwithcreds/`,
                type: "POST",
                data: model,
                success: function (data) {
                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        else if (id == '96') 
        {
            var iprange = $("#iprange").val();

            if (iprange == '' || iprange == undefined || iprange == null) {
                $("#iprangeValidation").css("display", "block");
                return;
            }
            else {
                $("#iprangeValidation").css("display", "none");
            }
            var agent = $("#agent").val();

            if (agent == '' || agent == undefined || agent == null) {
                $("#agentValidation").css("display", "block");
                return;
            }
            else {
                $("#agentValidation").css("display", "none");
            }

            var model = {
                agent: agentName,
                agentId: agentId,
                moduleId:id,
                iprange:iprange,
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/fbing/`,
                type: "POST",
                data: model,
                success: function (data) {
                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        else if (id == '97') 
        {

            var agent = $("#agent").val();

            if (agent == '' || agent == undefined || agent == null) {
                $("#agentValidation").css("display", "block");
                return;
            }
            else {
                $("#agentValidation").css("display", "none");
            }

            var domain = $("#domain").val();

            if (domain == '' || domain == undefined || domain == null) {
                $("#domainValidation").css("display", "block");
                return;
            }
            else {
                $("#domainValidation").css("display", "none");
            }

            var model = {
                agentId: agentId,
                moduleId:id,
                domain:domain,
                agent:agent
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/DomainControllers/`,
                type: "POST",
                data: model,
                success: function (data) {
                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        else if (id == '111') 
        {    
            var domain = $("#domain").val();

            if (domain == '' || domain == undefined || domain == null) {
                $("#domainValidation").css("display", "block");
                return;
            }
            else {
                $("#domainValidation").css("display", "none");
            }

            var users_list = $("#users_list").val();

            if (users_list == '' || users_list == undefined || users_list == null) {
                $("#users_listValidation").css("display", "block");
                return;
            }
            else {
                $("#users_listValidation").css("display", "none");
            }

            var dc_ip = $("#dc_ip").val();

            if (dc_ip == '' || dc_ip == undefined || dc_ip == null) {
                $("#dc_ipValidation").css("display", "block");
                return;
            }
            else {
                $("#dc_ipValidation").css("display", "none");
            }

            var model = {
                agentId: agentId,
                moduleId:id,
                domain:domain,
                agent:agentName,
                dc_ip:dc_ip,
                users_list:users_list
            }

            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/DomainControllers/`,
                type: "POST",
                data: model,
                success: function (data) {
                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');
                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        else if (id == '112') 
        {

            var DCip = $("#DCip").val();

            if (DCip == '' || DCip == undefined || DCip == null) {
                $("#DCipValidation").css("display", "block");
                return;
            }
            else {
                $("#DCipValidation").css("display", "none");
            }

            var users_list = $("#users_list").val();

            if (users_list == '' || users_list == undefined || users_list == null) {
                $("#users_listValidation").css("display", "block");
                return;
            }
            else {
                $("#users_listValidation").css("display", "none");
            }

            var password = $("#password").val();

            if (password == '' || password == undefined || password == null) {
                $("#passwordValidation").css("display", "block");
                return;
            }
            else {
                $("#passwordValidation").css("display", "none");
            }
            var model = {
                agentId: agentId,
                moduleId:id,
                password:password,
                agent: agentName,
                DCip:DCip,
                users_list:users_list
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/CMEpassspray/`,
                type: "POST",
                data: model,
                success: function (data) {
                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        else if (id == '113') 
        {

            var domain = $("#domain").val();

            if (domain == '' || domain == undefined || domain == null) {
                $("#domainValidation").css("display", "block");
                return;
            }
            else {
                $("#domainValidation").css("display", "none");
            }

            var ip = $("#ip").val();

            if (ip == '' || ip == undefined || ip == null) {
                $("#ipValidation").css("display", "block");
                return;
            }
            else {
                $("#ipValidation").css("display", "none");
            }

            var username = $("#username").val();

            if (username == '' || username == undefined || username == null) {
                $("#usernameValidation").css("display", "block");
                return;
            }
            else {
                $("#usernameValidation").css("display", "none");
            }
            
            var password = $("#password").val();

            var PassTheHash = $("#PassTheHash").val();

            var model = {
                agentId: agentId,
                moduleId:id,
                password:password,
                ip:ip,
                domain:domain,
                agent: agentName,
                username : username,
                PassTheHash:PassTheHash
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/LateralMovRDP/`,
                type: "POST",
                data: model,
                success: function (data) {
                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        else if (id == '114') 
        {

            var domain = $("#domain").val();

            if (domain == '' || domain == undefined || domain == null) {
                $("#domainValidation").css("display", "block");
                return;
            }
            else {
                $("#domainValidation").css("display", "none");
            }

            var DCip = $("#DCip").val();

            if (DCip == '' || DCip == undefined || DCip == null) {
                $("#DCipValidation").css("display", "block");
                return;
            }
            else {
                $("#DCipValidation").css("display", "none");
            }

            var username = $("#username").val();
            var password = $("#password").val();
            var hexkey = $("#hexkey").val();
            var hashes = $("#hashes").val();

            var model = {
                agentId: agentId,
                moduleId:id,
                password:password,
                username : username,
                domain:domain,
                agent: agentName,
                hexkey : hexkey,
                hashes : hashes,
                DCip:DCip
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/TGSticketsGetSPNusers/`,
                type: "POST",
                data: model,
                success: function (data) {
                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        else if (id == '115') 
        {

            var username = $("#username").val();

            if (username == '' || username == undefined || username == null) {
                $("#usernameValidation").css("display", "block");
                return;
            }
            else {
                $("#usernameValidation").css("display", "none");
            }

            var password = $("#password").val();

            if (password == '' || password == undefined || password == null) {
                $("#passwordValidation").css("display", "block");
                return;
            }
            else {
                $("#passwordValidation").css("display", "none");
            }

            var DCip = $("#DCip").val();

            if (DCip == '' || DCip == undefined || DCip == null) {
                $("#DCipValidation").css("display", "block");
                return;
            }
            else {
                $("#DCipValidation").css("display", "none");
            }
            var DomainName = $("#DomainName").val();

            if (DomainName == '' || DomainName == undefined || DomainName == null) {
                $("#DomainNameValidation").css("display", "block");
                return;
            }
            else {
                $("#DomainNameValidation").css("display", "none");
            }
             

            var model = {
                agentId: agentId,
                moduleId:id,
                password:password,
                username : username,
                agent: agentName,
                DomainName : DomainName,
                DCip:DCip
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/sharp/`,
                type: "POST",
                data: model,
                success: function (data) {
                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        else if (id == '116') 
        {

            var user = $("#user").val();

            if (user == '' || user == undefined || user == null) {
                $("#userValidation").css("display", "block");
                return;
            }
            else {
                $("#userValidation").css("display", "none");
            }

            var model = {
                agentId: agentId,
                moduleId:id,
                agent: agentName,
                user : user
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/UserGeneralInfo/`,
                type: "POST",
                data: model,
                success: function (data) {
                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        else if (id == '117') 
        {
        
            var contoleduser = $("#contoleduser").val();

            if (contoleduser == '' || contoleduser == undefined || contoleduser == null) {
                $("#contoleduserValidation").css("display", "block");
                return;
            }
            else $("#contoleduserValidation").css("display", "none");
            
            var password = $("#password").val();

            if (password == '' || password == undefined || password == null) {
                $("#passwordValidation").css("display", "block");
                return;
            }
            else {
                $("#passwordValidation").css("display", "none");
            }

            var wanteduser = $("#wanteduser").val();

            if (wanteduser == '' || wanteduser == undefined || wanteduser == null) {
                $("#wanteduserValidation").css("display", "block");
                return;
            }
            else {
                $("#wanteduserValidation").css("display", "none");
            }

            var wantedpassword = $("#wantedpassword").val();

            if ( wantedpassword == '' || wantedpassword == undefined || wantedpassword == null) {
                $("#wantedpasswordValidation").css("display", "block");
                return;
            }
            else  $("#wantedpasswordValidation").css("display", "none");
            
            var model = {
                agentId: agentId,
                moduleId:id,
                agent: agentName,
                contoleduser : contoleduser,
                password : password,
                wanteduser : wanteduser,
                wantedpassword : wantedpassword
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/forceChangePassDomainUserPassword/`,
                type: "POST",
                data: model,
                success: function (data) {
                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        else if (id == '118') 
        {
        
            var username = $("#username").val();

            if (username == '' || username == undefined || username == null) {
                $("#usernameValidation").css("display", "block");
                return;
            }
            else $("#usernameValidation").css("display", "none");
            
            var password = $("#password").val();

            if (password == '' || password == undefined || password == null) {
                $("#passwordValidation").css("display", "block");
                return;
            }
            else {
                $("#passwordValidation").css("display", "none");
            }

            var domain = $("#domain").val();

            if (domain == '' || domain == undefined || domain == null) {
                $("#domainValidation").css("display", "block");
                return;
            }
            else {
                $("#domainValidation").css("display", "none");
            }

            var computername = $("#computername").val();

            if ( computername == '' || computername == undefined || computername == null) {
                $("#computernameValidation").css("display", "block");
                return;
            }
            else  $("#computernameValidation").css("display", "none");
            
            var model = {
                agentId: agentId,
                moduleId:id,
                agent: agentName,
                username : username,
                domain : domain,
                computername : computername
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/forceChangePassDomainUserPassword/`,
                type: "POST",
                data: model,
                success: function (data) {
                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        else if (id == '119') 
        {
        
            var username = $("#username").val();

            if (username == '' || username == undefined || username == null) {
                $("#usernameValidation").css("display", "block");
                return;
            }
            else $("#usernameValidation").css("display", "none");
            
            var password = $("#password").val();

            if (password == '' || password == undefined || password == null) {
                $("#passwordValidation").css("display", "block");
                return;
            }
            else $("#passwordValidation").css("display", "none");
            

            var ip = $("#ip").val();

            if ( ip == '' || ip == undefined || ip == null) {
                $("#ipValidation").css("display", "block");
                return;
            }
            else  $("#ipValidation").css("display", "none");
            
            var model = {
                agentId: agentId,
                moduleId:id,
                agent: agentName,
                username : username,
                ip:ip,
                password : password
            }
            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/gppautologin/`,
                type: "POST",
                data: model,
                success: function (data) {
                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');

                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })
        }
        setTimeout(function () { TasksData.GetFileResults(); }, 10000);
        setTimeout(function () { TasksData.GetAgentHsitory(); }, 10000);
        $("#agentHistoryTb").DataTable().destroy();
    },

    StartGeneralAtack: function(id){

        if(id == '64'){

            var arg = $("#arg").val();
            var model = {
                arg: arg,
                agent: agentName,
                agentId: agentId,
                moduleId:id
            }

            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/linuxWfuzz/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');
                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })

        }
        

        else if(id == '65'){

            var arg = $("#arg").val();
            var model = {
                arg: arg,
                agent: agentName,
                agentId: agentId,
                moduleId:id
            }

            
            $("#btnTask").attr('disabled' , '');
            $.ajax({
                url: `/nmap/`,
                type: "POST",
                data: model,
                success: function (data) {
                    

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                        $("#btnTask").removeAttr('disabled');
                    });


                },
                error: function () {
                      Swal.fire({
                        title: "Saved Failed",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'error',
                    })
                    $("#btnTask").removeAttr('disabled');
                }
            })

        }        

        setTimeout(function () { TasksData.GetFileResults(); }, 10000);
        setTimeout(function () { TasksData.GetAgentHsitory(); }, 10000);
        $("#agentHistoryTb").DataTable().destroy();
    },
}

var TasksDraw = {

    DrawAgentHistory: function(data){

        var listItems = '';
        $.each(data, function (key, value) {
            listItems += `<tr>
                            <td   id="${value.moduleId}"> <a class="link-dark" onclick="NavToSpecficTask('${value.id}')"  > ${value.module_name}</a> </td>
                            <td>    <textarea id="fileResults" cols="20" rows="20" spellcheck="false" disabled
                            style="width: 100%; height:300px;">${value.task_result}</textarea></td>
                            <td>${value.red_username}</td>
                            <td   id="${value.id}">${ value.created_date.split('T')[0] + ' ' + value.created_date.split('T')[1].split(':')[0] + ':' + value.created_date.split('T')[1].split(':')[1]}</td>
                        </tr> `;
        });
        
        $('#agentHistoryBody').html(listItems);
        $("#agentHistoryTb").DataTable({
            "responsive": true, "lengthChange": false, "autoWidth": false,
            "stateSave": true,
            "bDestroy": true
        });
    },

    DrawDataTable: function () {

        //
        var listItems = '';
        var module_typeName = '';
        $.each(TasksData.allModules, function (key, value) {
            if (value.module_type == 1)
                module_typeName = "Windows Task"
            else if (value.module_type == 2)
                module_typeName = "Linux Task"
            else if (value.module_type == 3)
                module_typeName = 'Active Directory'
            else
                module_typeName = 'General'

            listItems += `<tr>
                            <td style="width: 140px;">${value.module_name}</td>
                            <td style="width: 90px;">${module_typeName}</td>
                            <td style="width: 90px;">${value.reference}</td>
                            <td>
                            <textarea cols="20" rows="20" spellcheck="false" disabled
                                      style="width: 100%; height:200px;">${value.description}</textarea>
                            </td>

                            <td>${moment(value.created_date).format('MM/DD/YYYY hh:mm')}</td>
                          </tr> `;
        });
        $('#bodyData').append(listItems);
        $("#example1").DataTable({
            "responsive": true, "lengthChange": false, "autoWidth": false,
            "stateSave": true,
            "bDestroy": true
        });
    },

    SelectOperatingSystem: function(){
        
        var Toast = Swal.mixin({
            toast: true,
            position: 'top-end',
            showConfirmButton: false,
            timer: 3000
        });

        Toast.fire({
            icon: 'error',
            title: 'Please Select Operating System'
        })
    },

    DrawSelectTasks: function () {
        var listItems = '<option selected="selected" disabled>choose Task</option>';


        $.each(TasksData.allModules, function (key, value) {
            listItems += ` <option data-type='${value.module_type}' value='${value.id}'>${value.module_name}</option> `;
        });
        
        $("#selectModules").append(listItems);
        //Initialize Select2 Elements

        $('.select2bs4').select2({
            theme: 'bootstrap4'
        })
    },

    ReDrawSelectTasks: function (event) {
        var listItems = '<option selected="selected" disabled>choose Task</option>';
        var type = event.target.value;
        var html = '';
        if (type == '0')
            TasksData.filterdModules = TasksData.allModules;
        else if (type == '1') {
            html = ` <div class="form-group">
                           <label>Modules</label>
                            <select class="form-control select2bs4" placeholder="Modules"
                                id="selectModules" onchange="TasksDraw.DrawWindowsTask(event)" style="width: 100%;">

                            </select>
                        </div>`;

            TasksData.filterdModules = TasksData.allModules.filter(x => x.module_type == 1);

        }
        else if (type == '2') {
            html = ` <div class="form-group">
                            <label>Modules</label>
                            <select class="form-control select2bs4" placeholder="Modules"
                                id="selectModules" onchange="TasksDraw.DrawLinuxTasks(event)" style="width: 100%;">

                            </select>
                        </div>`;
            TasksData.filterdModules = TasksData.allModules.filter(x => x.module_type == 2);
        }

        else if (type == '3'){
            html = ` <div class="form-group">
                        <label>Modules</label>
                        <select class="form-control select2bs4" placeholder="Modules"
                            id="selectModules" onchange="TasksDraw.DrawActiveDirectoryList(event)" style="width: 100%;">

                        </select>
                    </div>`;
            TasksData.filterdModules = TasksData.allModules.filter(x => x.module_type == 3);
        }
        else{

            html = ` <div class="form-group">
            <label>Modules</label>
            <select class="form-control select2bs4" placeholder="Modules"
                id="selectModules" onchange="TasksDraw.DrawGeneralModules(event)" style="width: 100%;">

            </select>
        </div>`;
                TasksData.filterdModules = TasksData.allModules.filter(x => x.module_type == 4);
        }


        $.each(TasksData.filterdModules, function (key, value) {
            listItems += ` <option data-type='${value.module_type}' value='${value.id}'>${value.module_name}</option> `;
        });
        //



        $("#selectDiv").html(html);

        $("#selectModules").html(listItems);

        var Toast = Swal.mixin({
            toast: true,
            position: 'top-end',
            showConfirmButton: false,
            timer: 3000
        });

        Toast.fire({
            icon: 'success',
            title: 'Tasks Filters Successfully'
        })

        $('.select2bs4').select2({
            theme: 'bootstrap4'
        })
    },


    DrawWindowsTask: function (event) {
        debugger;
        var id = event.target.value;
        if (id == '1' || id == '4' || id == '6' || id == '7' || id == '8' ||
            id == '9' || id == '10' || id == '11' || id == '12' || id == '13' ||
            id == '14' || id == '16' || id == '17' ) {

            var html = `  <div class="col-4">
                           <button id="btnTask" class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start Task</button>
                        </div>`

            $("#ModuleTask").html(html);

        }
        // DirectoryListing
        else if (id == '2') {

            var html = `  <div class="col-8">
                            <div class="form-group">
                                <label for="Path">Path</label>
                                <input type="text" class="form-control" style="width:100%" maxlength="100" id="directoryListingPath" placeholder="path">
                                <span type="text" class="text-danger font-weight-bold" id="directoryListingPathValidation"
                                style="display: none;">Please Enter Path</span>
                            </div>
                               <div class="col-3">
                               <button id="btnTask" class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start  DirectoryListing Task</button>
                               </div>
                           </div>`

            $("#ModuleTask").html(html);
        }
             //Download
        else if (id == '3') {
            var html = `  <div class="col-8">
                           <div class="form-group">
                                <label for="URL">URL</label>
                                <input type="text" class="form-control" style="width:100%" maxlength="100" id="uRLDownloadWindows" placeholder="URL">
                                <span type="text" class="text-danger font-weight-bold" id="uRLDownloadWindowsValidation"
                                style="display: none;">Please Enter URL</span>
                            </div>
                            <div class="form-group">
                                <label for="OutPath">OutPath</label>
                                <input type="text" class="form-control" style="width:100%" maxlength="100" id="outPath" placeholder="OutPath">
                                <span type="text" class="text-danger font-weight-bold" id="outPathValidation"
                                style="display: none;">Please Enter OutPath</span>
                            </div>
                               <div class="col-3">
                               <button id="btnTask" class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start Download Task</button>
                               </div>
                           </div>`

            $("#ModuleTask").html(html);
        }
        //Phrase_finder
        else if (id == '5') {

            var html = `  <div class="col-8">
                                <div class="form-group">
                                    <label for="Phrase">Phrase</label>
                                    <input type="text" class="form-control" style="width:100%" maxlength="100" id="phraseWindows" placeholder="Phrase">
                                    <span type="text" class="text-danger font-weight-bold" id="phraseWindowsValidation"
                                    style="display: none;">Please Enter Phrase</span>
                                </div>
                                <div class="col-3">
                                <button id="btnTask" class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start Phrase Finder Task</button>
                                </div>
                            </div>`

            $("#ModuleTask").html(html);
        }
        //Upload
        else if (id == '15') {
            var html = `  <div class="col-8">
                           <div class="form-group">
                                <label for="FilePath">FilePath</label>
                                <input type="text" class="form-control" style="width:100%" maxlength="100" id="filePath" placeholder="FilePath">
                                <span type="text" class="text-danger font-weight-bold" id="filePathValidation"
                                style="display: none;">Please Enter FilePath</span>
                            </div>
                            <div class="form-group">
                                <label for="Destination">Destination</label>
                                <input type="text" class="form-control" style="width:100%" maxlength="100" id="fileDestination" placeholder="Destination">
                                <span type="text" class="text-danger font-weight-bold" id="fileDestinationValidation"
                                style="display: none;">Please Enter Destination</span>
                            </div>
                               <div class="col-3">
                               <button id="btnTask" class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start Download Task</button>
                               </div>
                           </div>`

            $("#ModuleTask").html(html);
        }
        //JuicyPotato
        else if (id == '18') {
            var html = `  <div class="col-8">
                        <div class="form-group">
                            <label for="URL">Path Of Juicy On Victim</label>
                            <input type="text" class="form-control" style="width:100%" maxlength="100" id="pathOfJuicyOnVictim" placeholder="Path">
                            <span type="text" class="text-danger font-weight-bold" id="pathOfJuicyOnVictimValidation"
                            style="display: none;">Please Enter Path</span>
                        </div>               
                            <div class="col-3">
                            <button id="btnTask" class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start Task</button>
                            </div>
                        </div>`

            $("#ModuleTask").html(html);
        }  
        //DownloadAsync
        else if (id == '69') {
            var html = `  <div class="col-8">
                                <div class="form-group">
                                    <label for="URL">URL of File</label>
                                    <input type="text" class="form-control" style="width:100%" maxlength="100" id="URLofFile" placeholder="url">
                                    <span type="text" class="text-danger font-weight-bold" id="URLofFileValidation" style="display: none;">Please Enter File URL</span>
                                </div>
                               
                                <div class="form-group">
                                    <label for="URL">Output File Path</label>
                                    <input type="text" class="form-control" style="width:100%" maxlength="100" id="OutputFilePath" placeholder="url">
                                    <span type="text" class="text-danger font-weight-bold" id="OutputFilePathValidation" style="display: none;">Please Enter File output Path</span>
                                </div>               
                               
                                <div class="col-3">
                                     <button id="btnTask" class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start Task</button>
                                </div>

                            </div>`

            $("#ModuleTask").html(html);
        }

        else if (id == '70') {
            var html = `  <div class="col-8">
                                <div class="form-group">
                                    <label for="url">url </label>
                                    <input type="text" class="form-control" style="width:100%" maxlength="100" id="url" placeholder="url">
                                    <span type="text" class="text-danger font-weight-bold" id="urlValidation" style="display: none;">Please Enter URL</span>
                                </div>
                               
                               
                                <div class="col-3">
                                     <button id="btnTask" class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start Task</button>
                                </div>

                            </div>`

            $("#ModuleTask").html(html);
        }

        else if (id == '71') {
            var html = `  <div class="col-8">
                                <div class="form-group">
                                    <label for="url">url </label>
                                    <input type="text" class="form-control" style="width:100%" maxlength="100" id="url" placeholder="url">
                                    <span type="text" class="text-danger font-weight-bold" id="urlValidation" style="display: none;">Please Enter URL</span>
                                </div>
                               
                               
                                <div class="col-3">
                                     <button id="btnTask" class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start Task</button>
                                </div>

                            </div>`

            $("#ModuleTask").html(html);
        }

        else if (id == '72') {
            var html = `  <div class="col-8">
                                <div class="form-group">
                                    <label for="outpath">outpath </label>
                                    <input type="text" class="form-control" style="width:100%" maxlength="100" id="outpath" placeholder="url">
                                    <span type="text" class="text-danger font-weight-bold" id="outpathValidation" style="display: none;">Please Enter outpath</span>
                                </div>

                                <div class="form-group">
                                <label for="filename">filename </label>
                                <input type="text" class="form-control" style="width:100%" maxlength="100" id="filename" placeholder="url">
                                <span type="text" class="text-danger font-weight-bold" id="filenameValidation" style="display: none;">Please Enter filename</span>
                            </div>
                               
                               
                                <div class="col-3">
                                     <button id="btnTask" class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start Task</button>
                                </div>

                            </div>`

            $("#ModuleTask").html(html);
        }

        else if ( id == '73') {
            var html = `  <div class="col-8">
                                <div class="form-group">
                                    <label for="filepath">filepath </label>
                                    <input type="text" class="form-control" style="width:100%" maxlength="100" id="filepath" placeholder="filepath">
                                    <span type="text" class="text-danger font-weight-bold" id="filepathValidation" style="display: none;">Please Enter filepath</span>
                                </div>

                                <div class="form-group">
                                    <label for="serverport">serverport </label>
                                    <input type="text" class="form-control" style="width:100%" maxlength="100" id="serverport" placeholder="serverport">
                                    <span type="text" class="text-danger font-weight-bold" id="serverportValidation" style="display: none;">Please Enter serverport</span>
                                </div>
                               
                               
                                <div class="col-3">
                                     <button id="btnTask" class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start Task</button>
                                </div>

                            </div>`

            $("#ModuleTask").html(html);
        }

        else if ( id == '74') {
            var html = `  <div class="col-8">
                                <div class="form-group">
                                    <label for="filepath">filepath </label>
                                    <input type="text" class="form-control" style="width:100%" maxlength="100" id="filepath" placeholder="filepath">
                                    <span type="text" class="text-danger font-weight-bold" id="filepathValidation" style="display: none;">Please Enter filepath</span>
                                </div>

                                <div class="form-group">
                                    <label for="serverport">serverport </label>
                                    <input type="text" class="form-control" style="width:100%" maxlength="100" id="serverport" placeholder="serverport">
                                    <span type="text" class="text-danger font-weight-bold" id="serverportValidation" style="display: none;">Please Enter serverport</span>
                                </div>
                               
                                <div class="form-group">
                                    <label for="directory">outfile </label>
                                    <input type="text" class="form-control" style="width:100%" maxlength="100" id="outfile" placeholder="outfile">
                                    <span type="text" class="text-danger font-weight-bold" id="outfileValidation" style="display: none;">Please Enter outfile</span>
                                </div>
                               
                                <div class="col-3">
                                     <button id="btnTask" class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start Task</button>
                                </div>

                            </div>`

            $("#ModuleTask").html(html);
        }

        else if ( id == '75' || id == '76' || id == '77' || id == '78' || id == '79') {
            var html = `  <div class="col-8">
                                <div class="form-group">
                                    <label for="timeout">timeout </label>
                                    <input type="text" class="form-control" style="width:100%" maxlength="100" id="timeout" placeholder="timeout">
                                    <span type="text" class="text-danger font-weight-bold" id="timeoutValidation" style="display: none;">Please Enter timeout</span>
                                </div>

                                <div class="form-group">
                                    <label for="serverport">serverport </label>
                                    <input type="text" class="form-control" style="width:100%" maxlength="100" id="serverport" placeholder="serverport">
                                    <span type="text" class="text-danger font-weight-bold" id="serverportValidation" style="display: none;">Please Enter serverport</span>
                                </div>
                               
                                <div class="form-group">
                                    <label for="directory">directory </label>
                                    <input type="text" class="form-control" style="width:100%" maxlength="100" id="directory" placeholder="directory">
                                    <span type="text" class="text-danger font-weight-bold" id="directoryValidation" style="display: none;">Please Enter directory</span>
                                </div>
                               
                                <div class="col-3">
                                     <button id="btnTask" class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start Task</button>
                                </div>

                            </div>`

            $("#ModuleTask").html(html);
        }

        else if (id == '80') {
            var html = `  <div class="col-4">
                                <button id="btnTask" class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start Task</button>
                            </div>`

                    $("#ModuleTask").html(html);
        }

        else if (id == '81') {
            var html = `  <div class="col-8">
                                <div class="form-group">
                                    <label for="myip">myip</label>
                                    <input type="text" class="form-control" style="width:100%" maxlength="100" id="myip" placeholder="myip">
                                    <span type="text" class="text-danger font-weight-bold" id="myipValidation"
                                    style="display: none;">Please Enter myip</span>
                                </div>

                                <div class="form-group">
                                    <label for="listenport">listenport </label>
                                    <input type="text" class="form-control" style="width:100%" maxlength="100" id="listenport" placeholder="listenport">
                                    <span type="text" class="text-danger font-weight-bold" id="listenportValidation"
                                    style="display: none;">Please Enter listenport</span>
                                </div>
                                

                                <div class="col-3">
                                    <button id="btnTask" class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start</button>
                                </div>
                            </div>`

                    $("#ModuleTask").html(html);
        }

        else if (id == '82') {
            var html = `  <div class="col-8">
                                <div class="form-group">
                                    <label for="Args">Args</label>
                                    <input type="text" class="form-control" style="width:100%" maxlength="100" id="Args" placeholder="Args">
                                    <span type="text" class="text-danger font-weight-bold" id="ArgsValidation"
                                    style="display: none;">Please Enter Args</span>
                                </div>

                                <div class="form-group">
                                    <label for="exeFile">exeFile </label>
                                    <input type="text" class="form-control" style="width:100%" maxlength="100" id="exeFile" placeholder="exeFile">
                                    <span type="text" class="text-danger font-weight-bold" id="exeFileValidation"
                                    style="display: none;">Please Enter exeFile</span>
                                </div>
                                
                                <div class="form-group">
                                    <label for="dmpFile">dmpFile </label>
                                    <input type="text" class="form-control" style="width:100%" maxlength="100" id="dmpFile" placeholder="dmpFile">
                                    <span type="text" class="text-danger font-weight-bold" id="dmpFileValidation"
                                    style="display: none;">Please Enter dmpFile</span>
                                </div>

                                <div class="col-3">
                                    <button id="btnTask" class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start</button>
                                </div>
                            </div>`

                    $("#ModuleTask").html(html);
        }

        else if (id == '83') {
            var html = `  <div class="col-4">
                           <button id="btnTask" class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start Task</button>
                        </div>`

            $("#ModuleTask").html(html);
        }

        else if (id == '84') {
            var html = `  <div class="col-8">

            <div class="form-group">
            <label for="Path">SeDebugPrivilege Exploitaion</label>
            <input type="text" class="form-control" style="width:100%" value="C:\\Windows\\System32\\cmd.exe" maxlength="100" id="path_to_execute">
            <span type="text" class="text-danger font-weight-bold" id="path_to_executeValidation"
            style="display: none;">Please Enter path_to_execute</span>
        </div>

            <div class="form-group">
               <label for="Path">Parent Process ID</label>
               <input type="text" class="form-control" style="width:100%" placeholder="PID" maxlength="100" id="pid">
               <span type="text" class="text-danger font-weight-bold" id="pidValidation"
               style="display: none;">Please Enter PID</span>
            </div>

                                <div class="col-3">
                                     <button id="btnTask" class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start</button>
                                </div>
                            </div>`

                    $("#ModuleTask").html(html);
        }
       
        else if (id == '85') {

            var html = `  <div class="col-8">
                            <div class="form-group">
                                <label for="Path">Module_Path</label>
                                <input type="text" class="form-control" style="width:100%" maxlength="100" id="Module_Path" placeholder="Module_Path">
                                <span type="text" class="text-danger font-weight-bold" id="Module_PathValidation"
                                style="display: none;">Please Enter Module_Path</span>
                            </div>
                               <div class="col-3">
                               <button id="btnTask" class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start  Module_Path Task</button>
                               </div>
                           </div>`

            $("#ModuleTask").html(html);
        }

        else if (id == '86') {

            var html = `  <div class="col-8">
                            <div class="form-group">
                                <label for="Path">Module_Path</label>
                                <input type="text" class="form-control" style="width:100%" maxlength="100" id="Module_Path" placeholder="Module_Path">
                                <span type="text" class="text-danger font-weight-bold" id="Module_PathValidation"
                                style="display: none;">Please Enter Module_Path</span>
                            </div>
                               <div class="col-3">
                               <button id="btnTask" class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start  Module_Path Task</button>
                               </div>
                           </div>`

            $("#ModuleTask").html(html);
        }
       //Chk_File_Owner
       else if (id == '87') {

        var html = `  <div class="col-8">
                        <div class="form-group">
                            <label for="Path">Chk_File_OwnerPath</label>
                            <input type="text" class="form-control" style="width:100%" maxlength="100" id="Chk_File_OwnerPath" placeholder="Chk_File_OwnerPath">
                            <span type="text" class="text-danger font-weight-bold" id="Chk_File_OwnerValidation"
                            style="display: none;">Please Enter Path</span>
                        </div>
                           <div class="col-3">
                           <button id="btnTask" class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start  Chk_File_Owner Task</button>
                           </div>
                       </div>`

        $("#ModuleTask").html(html);
       }

       else if (id == '88') {

        var html = `  <div class="col-8">
                        <div class="form-group">
                            <label for="FilePath">FilePath</label>
                            <input type="text" class="form-control" style="width:100%" maxlength="100" id="FilePath" placeholder="FilePath">
                            <span type="text" class="text-danger font-weight-bold" id="FilePathValidation"
                            style="display: none;">Please Enter FilePath</span>
                        </div>
                           <div class="col-3">
                           <button id="btnTask" class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start  FilePath Task</button>
                           </div>
                       </div>`

        $("#ModuleTask").html(html);
       }

       else if (id == '89') {

        var html = `  <div class="col-8">
                        <div class="form-group">
                            <label for="FilePath">FilePath</label>
                            <input type="text" class="form-control" style="width:100%" maxlength="100" id="FilePath" placeholder="FilePath">
                            <span type="text" class="text-danger font-weight-bold" id="UserNameValidation"
                            style="display: none;">Please Enter UserName</span>
                        </div>
                        <div class="form-group">
                            <label for="UserName">UserName</label>
                            <input type="text" class="form-control" style="width:100%" maxlength="100" id="UserName" placeholder="UserName">
                            <span type="text" class="text-danger font-weight-bold" id="UserNameValidation"
                            style="display: none;">Please Enter UserName</span>
                        </div>
                           <div class="col-3">
                           <button id="btnTask" class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start  UserName Task</button>
                           </div>
                       </div>`

        $("#ModuleTask").html(html);
       }

       else if (id == '90') {

        var html = `  <div class="col-8">
                        <div class="form-group">
                            <label for="FileToCopy">FileToCopy</label>
                            <input type="text" class="form-control" style="width:100%" maxlength="100" id="FileToCopy" placeholder="FileToCopy">
                            <span type="text" class="text-danger font-weight-bold" id="FileToCopyValidation"
                            style="display: none;">Please Enter </span>
                        </div>FileToCopy
                        <div class="form-group">
                            <label for="outPut">outPut</label>
                            <input type="text" class="form-control" style="width:100%" maxlength="100" id="outPut" placeholder="outPut">
                            <span type="text" class="text-danger font-weight-bold" id="outPutValidation"
                            style="display: none;">Please Enter outPut</span>
                        </div>
                           <div class="col-3">
                           <button id="btnTask" class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start  UserName Task</button>
                           </div>
                       </div>`

        $("#ModuleTask").html(html);
       }

    },


    DrawLinuxTasks: function (event) {
        
        var strId = event.target.value;
        var id = parseInt(strId);
        if (id >= 19 && id <= 31) {
            var html = `  <div class="col-4">
                                    <button id="btnTask" class="btn btn-info" onclick="TasksData.StartLinuxAttack('${id}')">Start Task</button>
                             </div>`

            $("#ModuleTask").html(html);
        }
        else if (id == '51') {
            var html = `  <div class="col-8">
                                <div class="form-group">
                                    <label for="Path">ChangeDirectory</label>
                                    <input type="text" class="form-control" style="width:100%" maxlength="100" id="changeDirectoryPath" placeholder="changeDirectory">
                                    <span type="text" class="text-danger font-weight-bold" id="changeDirectoryPathValidation"
                                    style="display: none;">Please Enter Path</span>
                                </div>
                                <div class="col-3">
                                <button id="btnTask" class="btn btn-info" onclick="TasksData.StartLinuxAttack('${id}')">Start Task</button>
                                </div>
                            </div>`

            $("#ModuleTask").html(html);
        }
        else if (id == '52') {
            var html = `  <div class="col-8">
                                <div class="form-group">
                                    <label for="mode">Mode</label>
                                    <input type="text" class="form-control" style="width:100%" maxlength="100" id="linuxMode" placeholder="mode">
                                    <span type="text" class="text-danger font-weight-bold" id="linuxModeValidation"
                                    style="display: none;">Please Enter Mode</span>
                                </div>
                                <div class="form-group">
                                    <label for="filePath">filePath</label>
                                    <input type="text" class="form-control" style="width:100%" maxlength="100" id="filePath" placeholder="filePath">
                                    <span type="text" class="text-danger font-weight-bold" id="filePathValidation"
                                    style="display: none;">Please Enter filePath</span>
                                </div>
                                <div class="col-3">
                                <button id="btnTask" class="btn btn-info" onclick="TasksData.StartLinuxAttack('${id}')">Start Task</button>
                                </div>
                            </div>`

            $("#ModuleTask").html(html);
        }
        else if (id == '53') {
            var html = `  <div class="col-8">
                                <div class="form-group">
                                    <label for="path1">path1</label>
                                    <input type="text" class="form-control" style="width:100%" maxlength="100" id="path1" placeholder="path1">
                                    <span type="text" class="text-danger font-weight-bold" id="path1Validation"
                                    style="display: none;">Please Enter path1</span>
                                </div>
                                <div class="form-group">
                                    <label for="path2">path2</label>
                                    <input type="text" class="form-control" style="width:100%" maxlength="100" id="path2" placeholder="path2">
                                    <span type="text" class="text-danger font-weight-bold" id="path2Validation"
                                    style="display: none;">Please Enter path2Validation</span>
                                </div>
                                <div class="col-3">
                                <button id="btnTask" class="btn btn-info" onclick="TasksData.StartLinuxAttack('${id}')">Start Task</button>
                                </div>
                            </div>`

            $("#ModuleTask").html(html);
        }
        else if (id == '54') {
            var html = `  <div class="col-8">
                            <div class="form-group">
                                <label for="cfile">cfile</label>
                                <input type="text" class="form-control" style="width:100%" maxlength="100" id="cfile" placeholder="cfile">
                                <span type="text" class="text-danger font-weight-bold" id="cfileValidation"
                                style="display: none;">Please Enter cfile</span>
                            </div>
                            <div class="form-group">
                                <label for="option">option</label>
                                <input type="text" class="form-control" style="width:100%" maxlength="100" id="option" placeholder="option">
                                <span type="text" class="text-danger font-weight-bold" id="optionValidation"
                                style="display: none;">Please Enter option</span>
                            </div>
                            <div class="form-group">
                                <label for="bfile">bfile</label>
                                <input type="text" class="form-control" style="width:100%" maxlength="100" id="bfile" placeholder="bfile">
                                <span type="text" class="text-danger font-weight-bold" id="bfileValidation"
                                style="display: none;">Please Enter bfile</span>
                            </div>                          
                            <div class="col-3">
                            <button id="btnTask" class="btn btn-info" onclick="TasksData.StartLinuxAttack('${id}')">Start Task</button>
                            </div>
                        </div>`

            $("#ModuleTask").html(html);
        }
        else if (id == '55') {
            var html = `  <div class="col-8">
                                <div class="form-group">
                                    <label for="Path">Path</label>
                                    <input type="text" class="form-control" style="width:100%" maxlength="100" id="directoryListingPath" placeholder="path">
                                    <span type="text" class="text-danger font-weight-bold" id="directoryListingPathValidation"
                                    style="display: none;">Please Enter Path</span>
                                </div>
                                <div class="col-3">
                                <button id="btnTask" class="btn btn-info" onclick="TasksData.StartLinuxAttack('${id}')">Start Task</button>
                                </div>
                            </div>`

            $("#ModuleTask").html(html);
        }
        else if (id == '56') {
            var html = `  <div class="col-8">
                                <div class="form-group">
                                    <label for="Path">Path</label>
                                    <input type="text" class="form-control" style="width:100%" maxlength="100" id="directoryListingPath" placeholder="path">
                                    <span type="text" class="text-danger font-weight-bold" id="directoryListingPathValidation"
                                    style="display: none;">Please Enter Path</span>
                                </div>
                                <div class="col-3">
                                <button id="btnTask" class="btn btn-info" onclick="TasksData.StartLinuxAttack('${id}')">Start Task</button>
                                </div>
                            </div>`

            $("#ModuleTask").html(html);
        }
        else if (id == '57') {
            var html = `  <div class="col-8">
                                <div class="form-group">
                                    <label for="MakeDirectory">MakeDirectory</label>
                                    <input type="text" class="form-control" style="width:100%" maxlength="100" id="makeDirectory" placeholder="MakeDirectory">
                                    <span type="text" class="text-danger font-weight-bold" id="makeDirectoryValidation"
                                    style="display: none;">Please Enter Directory</span>
                                </div>
                                <div class="col-3">
                                <button id="btnTask" class="btn btn-info" onclick="TasksData.StartLinuxAttack('${id}')">Start Task</button>
                                </div>
                            </div>`

            $("#ModuleTask").html(html);
        }
        else if (id == '58') {
            var html = `  <div class="col-8">
                                <div class="form-group">
                                    <label for="option">Option</label>
                                    <input type="text" class="form-control" style="width:100%" maxlength="100" id="option" placeholder="option">
                                    <span type="text" class="text-danger font-weight-bold" id="optionValidation"
                                    style="display: none;">Please Enter Option</span>
                                </div>
                                <div class="form-group">
                                    <label for="atr">Atr</label>
                                    <input type="text" class="form-control" style="width:100%" maxlength="100" id="atr" placeholder="atr">
                                    <span type="text" class="text-danger font-weight-bold" id="atrValidation"
                                    style="display: none;">Please Enter Atr</span>
                                </div>
                                <div class="col-3">
                                <button id="btnTask" class="btn btn-info" onclick="TasksData.StartLinuxAttack('${id}')">Start Task</button>
                                </div>
                            </div>`

            $("#ModuleTask").html(html);
        }
        else if (id == '59') {
            
            var html = `  <div class="col-8">
                                <div class="form-group">
                                    <label for="FileName">FileName</label>
                                    <input type="text" class="form-control" style="width:100%" maxlength="100" id="fileName" placeholder="FileName">
                                    <span type="text" class="text-danger font-weight-bold" id="fileNameValidation"
                                    style="display: none;">Please Enter FileName</span>
                                </div>
                                <div class="col-3">
                                <button id="btnTask" class="btn btn-info" onclick="TasksData.StartLinuxAttack('${id}')">Start Task</button>
                                </div>
                            </div>`

            $("#ModuleTask").html(html);
        }
        else if (id == '60') {
            var html = `  <div class="col-8">
                                <div class="form-group">
                                    <label for="Command">Command</label>
                                    <input type="text" class="form-control" style="width:100%" maxlength="100" id="command" placeholder="Command">
                                    <span type="text" class="text-danger font-weight-bold" id="commandValidation"
                                    style="display: none;">Please Enter Command</span>
                                </div>
                                <div class="col-3">
                                <button id="btnTask" class="btn btn-info" onclick="TasksData.StartLinuxAttack('${id}')">Start Task</button>
                                </div>
                            </div>`

            $("#ModuleTask").html(html);
        }
        else if (id == '61') {
            var html = `  <div class="col-8">
                                <div class="form-group">
                                    <label for="arg">Arg</label>
                                    <input type="text" class="form-control" style="width:100%" maxlength="100" id="arg" placeholder="Arg">
                                    <span type="text" class="text-danger font-weight-bold" id="argValidation"
                                    style="display: none;">Please Enter Arg</span>
                                </div>
                                <div class="col-3">
                                <button id="btnTask" class="btn btn-info" onclick="TasksData.StartLinuxAttack('${id}')">Start Task</button>
                                </div>
                            </div>`

            $("#ModuleTask").html(html);
        }
        else if(id == '62'){
            var html = `  <div class="col-8">
                        <div class="form-group">
                            <label for="UserName">UserName</label>
                            <input type="text" class="form-control" style="width:100%" maxlength="100" id="userName" placeholder="UserName">
                            <span type="text" class="text-danger font-weight-bold" id="userNameValidation"
                            style="display: none;">Please Enter userName</span>
                        </div>
                        <div class="form-group">
                            <label for="Password">Password</label>
                            <input type="text" class="form-control" style="width:100%" maxlength="100" id="password" placeholder="Password">
                            <span type="text" class="text-danger font-weight-bold" id="passwordValidation"
                            style="display: none;">Please Enter password</span>
                        </div>
                        <div class="form-group">
                            <label for="Command">Command</label>
                            <input type="text" class="form-control" style="width:100%" maxlength="100" id="command" placeholder="Command">
                            <span type="text" class="text-danger font-weight-bold" id="commandValidation"
                            style="display: none;">Please Enter Command</span>
                        </div>                          
                        <div class="col-3">
                        <button id="btnTask" class="btn btn-info" onclick="TasksData.StartLinuxAttack('${id}')">Start Task</button>
                        </div>
                    </div>`

            $("#ModuleTask").html(html);
        }
        else if(id == '63'){
            var html = `  <div class="col-8">
                        <div class="form-group">
                            <label for="URL">URL</label>
                            <input type="text" class="form-control" style="width:100%" maxlength="100" id="url" placeholder="URL">
                            <span type="text" class="text-danger font-weight-bold" id="urlValidation"
                            style="display: none;">Please Enter URL</span>
                        </div>
                        <div class="form-group">
                            <label for="output">output Path</label>
                            <input type="text" class="form-control" style="width:100%" maxlength="100" id="output" placeholder="output">
                            <span type="text" class="text-danger font-weight-bold" id="outputValidation"
                            style="display: none;">Please Enter output</span>
                        </div>                   
                        <div class="col-3">
                        <button id="btnTask" class="btn btn-info" onclick="TasksData.StartLinuxAttack('${id}')">Start Task</button>
                        </div>
                    </div>`

            $("#ModuleTask").html(html);
        } 
        
        
    },


    DrawActiveDirectoryList: function (event) {
        
        var id = event.target.value;
        if (id >= 32 && id <= 50 && id != 39) {

            var html = `  <div class="col-4">
                           <button id="btnTask" class="btn btn-info" onclick="TasksData.StartActiveDirectoryAttack('${id}')">Start Task</button>
                        </div>`

            $("#ModuleTask").html(html);

        }

        else if(id == 65 || id == 66 || id == 67){
            
            var html = `  <div class="col-8">
                            <div class="form-group">
                                <label for="agent">agent</label>
                                <input type="text" class="form-control" style="width:100%" maxlength="100" id="agent" placeholder="agent">
                                <span type="text" class="text-danger font-weight-bold" id="agentValidation"
                                style="display: none;">Please Enter agent</span>
                            </div>
                                <div class="col-3">
                                    <button id="btnTask" class="btn btn-info" onclick="TasksData.StartActiveDirectoryAttack('${id}')">Start Task</button>
                                </div>
                        </div>`

            $("#ModuleTask").html(html);

        }
        else if(id == 92){

            var html = `  <div class="col-8">
                                    <div class="form-group">
                                        <label for="comp">comp</label>
                                        <input type="text" class="form-control" style="width:100%" maxlength="100" id="comp" placeholder="comp">
                                        <span type="text" class="text-danger font-weight-bold" id="compValidation"
                                        style="display: none;">Please Enter comp</span>
                                    </div>
                                    <div class="form-group">
                                        <label for="linkedin_mail">linkedin_mail</label>
                                        <input type="text" class="form-control" style="width:100%" maxlength="100" id="linkedin_mail" placeholder="linkedin_mail">
                                        <span type="text" class="text-danger font-weight-bold" id="linkedin_mailValidation"
                                        style="display: none;">Please Enter linkedin_mail</span>
                                    </div>

                                    <div class="form-group">
                                        <label for="linkedin_password">linkedin_password</label>
                                        <input type="text" class="form-control" style="width:100%" maxlength="100" id="linkedin_password" placeholder="linkedin_password">
                                        <span type="text" class="text-danger font-weight-bold" id="linkedin_passwordValidation"
                                        style="display: none;">Please Enter linkedin_password</span>
                                    </div>

                                    <div class="form-group">
                                        <label for="agent">agent</label>
                                        <input type="text" class="form-control" style="width:100%" maxlength="100" id="agent" placeholder="agent">
                                        <span type="text" class="text-danger font-weight-bold" id="agentValidation"
                                        style="display: none;">Please Enter agent</span>
                                    </div>

                                        <div class="col-3">
                                        <button id="btnTask" class="btn btn-info" onclick="TasksData.StartActiveDirectoryAttack('${id}')">Start Download Task</button>
                                        </div>
                                    </div>`

                        $("#ModuleTask").html(html);

        }
        else if(id == 93 || id == 94 || id == 95){

            var html = `  <div class="col-8">
                                    <div class="form-group">
                                        <label for="username">username</label>
                                        <input type="text" class="form-control" style="width:100%" maxlength="100" id="username" placeholder="username">
                                        <span type="text" class="text-danger font-weight-bold" id="usernameValidation"
                                        style="display: none;">Please Enter username</span>
                                    </div>

                                    <div class="form-group">
                                        <label for="password">password</label>
                                        <input type="text" class="form-control" style="width:100%" maxlength="100" id="password" placeholder="password">
                                        <span type="text" class="text-danger font-weight-bold" id="passwordValidation"
                                        style="display: none;">Please Enter password</span>
                                    </div>

                                    <div class="form-group">
                                    <label for="agent">agent</label>
                                    <input type="text" class="form-control" style="width:100%" maxlength="100" id="agent" placeholder="agent">
                                    <span type="text" class="text-danger font-weight-bold" id="agentValidation"
                                    style="display: none;">Please Enter agent</span>
                                </div>

                                <div class="form-group">
                                <label for="ip">ip</label>
                                <input type="text" class="form-control" style="width:100%" maxlength="100" id="ip" placeholder="ip">
                                <span type="text" class="text-danger font-weight-bold" id="ipValidation"
                                style="display: none;">Please Enter ip</span>
                            </div>

                                        <div class="col-3">
                                        <button id="btnTask" class="btn btn-info" onclick="TasksData.StartActiveDirectoryAttack('${id}')">Start Download Task</button>
                                        </div>
                                    </div>`

                        $("#ModuleTask").html(html);

        }
        else if(id == 96){

            var html = `  <div class="col-8">
                                    <div class="form-group">
                                        <label for="iprange">iprange</label>
                                        <input type="text" class="form-control" style="width:100%" maxlength="100" id="iprange" placeholder="iprange">
                                        <span type="text" class="text-danger font-weight-bold" id="iprangeValidation"
                                        style="display: none;">Please Enter iprange</span>
                                    </div>

                                        <div class="col-3">
                                        <button id="btnTask" class="btn btn-info" onclick="TasksData.StartActiveDirectoryAttack('${id}')">Start Download Task</button>
                                        </div>
                                    </div>`

                        $("#ModuleTask").html(html);

        }
        else if(id == 97){

            var html = `  <div class="col-8">
                                    <div class="form-group">
                                        <label for="domain">domain</label>
                                        <input type="text" class="form-control" style="width:100%" maxlength="100" id="domain" placeholder="domain">
                                        <span type="text" class="text-danger font-weight-bold" id="domainValidation"
                                        style="display: none;">Please Enter domain</span>
                                    </div>

                                        <div class="col-3">
                                        <button id="btnTask" class="btn btn-info" onclick="TasksData.StartActiveDirectoryAttack('${id}')">Start Download Task</button>
                                        </div>
                                    </div>`

                        $("#ModuleTask").html(html);

        }
        else if(id == 111){
            debugger;
            var html = `  <div class="col-8">

                                    <div class="form-group">
                                        <label for="domain">domain</label>
                                        <input type="text" class="form-control" style="width:100%" maxlength="100" id="domain" placeholder="domain">
                                        <span type="text" class="text-danger font-weight-bold" id="domainValidation"
                                        style="display: none;">Please Enter domain</span>
                                    </div>

                                    <div class="form-group">
                                        <label for="dc_ip">dc_ip</label>
                                        <input type="text" class="form-control" style="width:100%" maxlength="100" id="dc_ip" placeholder="dc_ip">
                                        <span type="text" class="text-danger font-weight-bold" id="dc_ipValidation"
                                        style="display: none;">Please Enter dc_ip</span>
                                    </div>

                                    <div class="form-group">
                                    <label for="users_list">users_list</label>
                                    <input type="text" class="form-control" style="width:100%" maxlength="100" id="users_list" placeholder="users_list">
                                    <span type="text" class="text-danger font-weight-bold" id="users_listValidation"
                                    style="display: none;">Please Enter users_list</span>
                                </div>

                                        <div class="col-3">
                                        <button id="btnTask"  class="btn btn-info"  onclick="TasksData.StartActiveDirectoryAttack('${id}')">Start Download Task</button>
                                        </div>
                                    </div>`

                        $("#ModuleTask").html(html);

        }
        else if(id == 112){

            var html = `  <div class="col-8">

                                    <div class="form-group">
                                        <label for="DCip">DCip</label>
                                        <input type="text" class="form-control" style="width:100%" maxlength="100" id="DCip" placeholder="DCip">
                                        <span type="text" class="text-danger font-weight-bold" id="DCipValidation"
                                        style="display: none;">Please Enter DCip</span>
                                    </div>


                                    <div class="form-group">
                                        <label for="password">password</label>
                                        <input type="text" class="form-control" style="width:100%" maxlength="100" id="password" placeholder="password">
                                        <span type="text" class="text-danger font-weight-bold" id="passwordValidation"
                                        style="display: none;">Please Enter password</span>
                                    </div>

                                    <div class="form-group">
                                    <label for="users_list">users_list</label>
                                    <input type="text" class="form-control" style="width:100%" maxlength="100" id="users_list" placeholder="users_list">
                                    <span type="text" class="text-danger font-weight-bold" id="users_listValidation"
                                    style="display: none;">Please Enter users_list</span>
                                </div>

                                        <div class="col-3">
                                        <button id="btnTask" class="btn btn-info" onclick="TasksData.StartActiveDirectoryAttack('${id}')">Start Download Task</button>
                                        </div>
                                    </div>`

                        $("#ModuleTask").html(html);

        }
        else if(id == 113){

            var html = `  <div class="col-8">

                                    <div class="form-group">
                                        <label for="domain">domain</label>
                                        <input type="text" class="form-control" style="width:100%" maxlength="100" id="domain" placeholder="domain">
                                        <span type="text" class="text-danger font-weight-bold" id="domainValidation"
                                        style="display: none;">Please Enter domain</span>
                                    </div>

                                    <div class="form-group">
                                    <label for="username">username</label>
                                    <input type="text" class="form-control" style="width:100%" maxlength="100" id="username" placeholder="username">
                                    <span type="text" class="text-danger font-weight-bold" id="usernameValidation"
                                    style="display: none;">Please Enter username</span>
                                </div>


                                    <div class="form-group">
                                    <label for="ip">ip</label>
                                    <input type="text" class="form-control" style="width:100%" maxlength="100" id="ip" placeholder="ip">
                                    <span type="text" class="text-danger font-weight-bold" id="ipValidation"
                                    style="display: none;">Please Enter ip</span>
                                </div>

                                <div class="form-group">
                                <label for="password">password</label>
                                <input type="text" class="form-control" style="width:100%" maxlength="100" id="password" placeholder="password">
                                <span type="text" class="text-danger font-weight-bold" id="passwordValidation"
                                style="display: none;">Please Enter password</span>
                            </div>

                            <div class="form-group">
                            <label for="PassTheHash">PassTheHash</label>
                            <input type="text" class="form-control" style="width:100%" maxlength="100" id="PassTheHash" placeholder="PassTheHash">
                            <span type="text" class="text-danger font-weight-bold" id="PassTheHashValidation"
                            style="display: none;">Please Enter PassTheHash</span>
                        </div>

                                        <div class="col-3">
                                        <button id="btnTask" class="btn btn-info" onclick="TasksData.StartActiveDirectoryAttack('${id}')">Start Download Task</button>
                                        </div>
                                    </div>`

                        $("#ModuleTask").html(html);

        }
        else if(id == 114){

            var html = `  <div class="col-8">

                                    <div class="form-group">
                                        <label for="domain">domain</label>
                                        <input type="text" class="form-control" style="width:100%" maxlength="100" id="domain" placeholder="domain">
                                        <span type="text" class="text-danger font-weight-bold" id="domainValidation"
                                        style="display: none;">Please Enter domain</span>
                                    </div>

                                    <div class="form-group">
                                        <label for="DCip">DCip</label>
                                        <input type="text" class="form-control" style="width:100%" maxlength="100" id="DCip" placeholder="DCip">
                                        <span type="text" class="text-danger font-weight-bold" id="DCipValidation"
                                        style="display: none;">Please Enter DCip</span>
                                    </div>

                                        <div class="col-3">
                                        <button id="btnTask" class="btn btn-info" onclick="TasksData.StartActiveDirectoryAttack('${id}')">Start Download Task</button>
                                        </div>
                                    </div>`

                        $("#ModuleTask").html(html);

        }
        else if(id == 115){

            var html = `  <div class="col-8">


                            <div class="form-group">
                                <label for="username">username</label>
                                <input type="text" class="form-control" style="width:100%" maxlength="100" id="username" placeholder="username">
                                <span type="text" class="text-danger font-weight-bold" id="usernameValidation"
                                style="display: none;">Please Enter username</span>
                            </div>


                            <div class="form-group">
                                <label for="password">password</label>
                                <input type="text" class="form-control" style="width:100%" maxlength="100" id="password" placeholder="password">
                                <span type="text" class="text-danger font-weight-bold" id="passwordValidation"
                                style="display: none;">Please Enter password</span>
                            </div>

                            <div class="form-group">
                                <label for="DCip">DCip</label>
                                <input type="text" class="form-control" style="width:100%" maxlength="100" id="DCip" placeholder="DCip">
                                <span type="text" class="text-danger font-weight-bold" id="DCipValidation"
                                style="display: none;">Please Enter DCip</span>
                            </div>
                            
                                <div class="form-group">
                                <label for="DomainName">DomainName</label>
                                <input type="text" class="form-control" style="width:100%" maxlength="100" id="DomainName" placeholder="DomainName">
                                <span type="text" class="text-danger font-weight-bold" id="DomainNameValidation"
                                style="display: none;">Please Enter DomainName</span>
                            </div>

                                <div class="col-3">
                                <button id="btnTask" class="btn btn-info" onclick="TasksData.StartActiveDirectoryAttack('${id}')">Start Download Task</button>
                                </div>
                            </div>`

                $("#ModuleTask").html(html);

        }
        else if(id == 116){

            var html = `  <div class="col-8">

                             <div class="form-group">
                                <label for="user">user</label>
                                <input type="text" class="form-control" style="width:100%" maxlength="100" id="user" placeholder="user">
                                <span type="text" class="text-danger font-weight-bold" id="userValidation"
                                style="display: none;">Please Enter user</span>
                            </div>

                                <div class="col-3">
                                <button id="btnTask" class="btn btn-info" onclick="TasksData.StartActiveDirectoryAttack('${id}')">Start Download Task</button>
                                </div>
                            </div>`

                $("#ModuleTask").html(html);

        }
        else if(id == 117){

            var html = `  <div class="col-8">

                <div class="form-group">
                    <label for="contoleduser">contoleduser</label>
                    <input type="text" class="form-control" style="width:100%" maxlength="100" id="contoleduser" placeholder="contoleduser">
                    <span type="text" class="text-danger font-weight-bold" id="contoleduserValidation"
                    style="display: none;">Please Enter contoleduser</span>
                </div>
                
                
                    <div class="form-group">
                        <label for="password">password</label>
                        <input type="text" class="form-control" style="width:100%" maxlength="100" id="password" placeholder="password">
                        <span type="text" class="text-danger font-weight-bold" id="passwordValidation"
                        style="display: none;">Please Enter password</span>
                    </div>

                <div class="form-group">
                    <label for="wanteduser">wanteduser</label>
                    <input type="text" class="form-control" style="width:100%" maxlength="100" id="wanteduser" placeholder="wanteduser">
                    <span type="text" class="text-danger font-weight-bold" id="wanteduserValidation"
                    style="display: none;">Please Enter wanteduser</span>
                </div>

                <div class="form-group">
                    <label for="wantedpassword">wantedpassword</label>
                    <input type="text" class="form-control" style="width:100%" maxlength="100" id="wantedpassword" placeholder="wantedpassword">
                    <span type="text" class="text-danger font-weight-bold" id="wantedpasswordValidation"
                    style="display: none;">Please Enter wantedpassword</span>
                </div>

                
                        <div class="col-3">
                        <button id="btnTask" class="btn btn-info" onclick="TasksData.StartActiveDirectoryAttack('${id}')">Start Download Task</button>
                        </div>
                    </div>`

                $("#ModuleTask").html(html);

        }
        else if(id == 118){

            var html = `  <div class="col-8">

                    <div class="form-group">
                        <label for="username">username</label>
                        <input type="text" class="form-control" style="width:100%" maxlength="100" id="username" placeholder="username">
                        <span type="text" class="text-danger font-weight-bold" id="usernameValidation"
                        style="display: none;">Please Enter username</span>
                    </div>
                
                
                        <div class="form-group">
                        <label for="password">password</label>
                        <input type="text" class="form-control" style="width:100%" maxlength="100" id="password" placeholder="password">
                        <span type="text" class="text-danger font-weight-bold" id="passwordValidation"
                        style="display: none;">Please Enter password</span>
                    </div>

                    <div class="form-group">
                    <label for="domain">domain</label>
                    <input type="text" class="form-control" style="width:100%" maxlength="100" id="domain" placeholder="domain">
                    <span type="text" class="text-danger font-weight-bold" id="domainValidation"
                    style="display: none;">Please Enter domain</span>
                </div>

                    <div class="form-group">
                    <label for="computername">computername</label>
                    <input type="text" class="form-control" style="width:100%" maxlength="100" id="computername" placeholder="computername">
                    <span type="text" class="text-danger font-weight-bold" id="computernameValidation"
                    style="display: none;">Please Enter computername</span>
                </div>

                
                        <div class="col-3">
                        <button id="btnTask" class="btn btn-info" onclick="TasksData.StartActiveDirectoryAttack('${id}')">Start Download Task</button>
                        </div>
                    </div>`

                $("#ModuleTask").html(html);

        }
        else if(id == 119){

            var html = `  <div class="col-8">

                    <div class="form-group">
                        <label for="username">username</label>
                        <input type="text" class="form-control" style="width:100%" maxlength="100" id="username" placeholder="username">
                        <span type="text" class="text-danger font-weight-bold" id="usernameValidation"
                        style="display: none;">Please Enter username</span>
                    </div>
                
                
                        <div class="form-group">
                        <label for="password">password</label>
                        <input type="text" class="form-control" style="width:100%" maxlength="100" id="password" placeholder="password">
                        <span type="text" class="text-danger font-weight-bold" id="passwordValidation"
                        style="display: none;">Please Enter password</span>
                    </div>

                    <div class="form-group">
                    <label for="ip">ip</label>
                    <input type="text" class="form-control" style="width:100%" maxlength="100" id="ip" placeholder="ip">
                    <span type="text" class="text-danger font-weight-bold" id="ipValidation"
                    style="display: none;">Please Enter ip</span>
                </div>

                
                        <div class="col-3">
                        <button id="btnTask" class="btn btn-info" onclick="TasksData.StartActiveDirectoryAttack('${id}')">Start Download Task</button>
                        </div>
                    </div>`

                $("#ModuleTask").html(html);

        }
    },


    DrawGeneralModules: function(event){

        
        var id = event.target.value;
        if (id  == 64) {

            var html = `  <div class="col-8">
                            <div class="form-group">
                                <label for="arg">Arg</label>
                                <input type="text" class="form-control" style="width:100%" maxlength="100" id="arg" placeholder="Arg">
                                <span type="text" class="text-danger font-weight-bold" id="argValidation"
                                style="display: none;">Please Enter Arg</span>
                            </div>
                            <div class="col-3">
                            <button id="btnTask" class="btn btn-info" onclick="TasksData.StartGeneralAtack('${id}')">Start Task</button>
                            </div>
                        </div>`

            $("#ModuleTask").html(html);

        }

        else if (id  == 65) {

            var html = `  <div class="col-8">
                            <div class="form-group">
                                <label for="arg">Arg</label>
                                <input type="text" class="form-control" style="width:100%" maxlength="100" id="arg" placeholder="Arg">
                                <span type="text" class="text-danger font-weight-bold" id="argValidation"
                                style="display: none;">Please Enter Arg</span>
                            </div>
                            <div class="col-3">
                            <button id="btnTask" class="btn btn-info" onclick="TasksData.StartGeneralAtack('${id}')">Start Task</button>
                            </div>
                        </div>`

            $("#ModuleTask").html(html);

        }        


    }
}

function NavToSpecficTask(agentTaskId)
{
    location.href = `/agentTask/${agentTaskId}/`
}

$(document).ready(function () {
    
    TasksData.GetData();
    TasksData.GetAgentHsitory();
    TasksData.GetFileResults();
});


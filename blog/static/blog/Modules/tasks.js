
var TasksData = {

    allModules: [],

    filterdModules: [],

    GetData: function () {


        $.ajax({
            url: `/tasksApi/0/`,
            type: "GET",
            success: function (data) {
                TasksData.allModules = data;
                TasksDraw.DrawDataTable();
                TasksDraw.DrawSelectTasks();
            },
            error: function () {
                alert("Error");
            }
        })
    },

    StartWindowsAttack: function (id) {
        if (id == '1') {
            debugger;
            var model = {
                agent: agentName
            }

            debugger;
            $.ajax({
                url: `/applocker/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;
                    if (data) {

                        debugger;

                        Swal.fire({
                            title: "AppLocker Rules Start",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'success',
                            confirmButtonColor: '#26B99A',
                        }).then((result) => {

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
                agent: agentName
            }



            debugger;
            $.ajax({
                url: `/directorylist/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

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
                agent: agentName
            }
            debugger;
            $.ajax({
                url: `/download/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


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
        else if (id == '4') {

            var model = {
                agent: agentName
            }
            debugger;
            $.ajax({
                url: `/envvar/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


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
                phrase: phraseWindows
            }

            debugger;
            $.ajax({
                url: `/phrasefinder/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


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
        else if (id == '6') {

            var model = {
                agent: agentName
            }
            debugger;
            $.ajax({
                url: `/ipswindows/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


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
        else if (id == '7') {

            var model = {
                agent: agentName
            }
            debugger;
            $.ajax({
                url: `/loggedusers/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


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
        else if (id == '8') {

            var model = {
                agent: agentName
            }
            debugger;
            $.ajax({
                url: `/netconnections/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


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
        else if (id == '9') {

            var model = {
                agent: agentName
            }
            debugger;
            $.ajax({
                url: `/programs/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


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
        else if (id == '10') {

            var model = {
                agent: agentName
            }
            debugger;
            $.ajax({
                url: `/processeswindows/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


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
        else if (id == '11') {

            var model = {
                agent: agentName
            }
            debugger;
            $.ajax({
                url: `/screenshot/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


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
        else if (id == '12') {

            var model = {
                agent: agentName
            }
            debugger;
            $.ajax({
                url: `/userinfo/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


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
        else if (id == '13') {

            var model = {
                agent: agentName
            }
            debugger;
            $.ajax({
                url: `/systeminfo/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


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
        else if (id == '14') {

            var model = {
                agent: agentName
            }
            debugger;
            $.ajax({
                url: `/updateswindows/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


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
        else if (id == '15') {

            var file_path = $("#filePath").val();

            if (file_path == '' || file_path == undefined || file_path == null) {
                $("#filePathValidation").css("display", "block");
                return;
            }
            else {
                $("#filePathValidation").css("display", "none");
            }

            var destination = $("#fileDestination").val();

            if (destination == '' || destination == undefined || destination == null) {
                $("#fileDestinationValidation").css("display", "block");
                return;
            }
            else {
                $("#fileDestinationValidation").css("display", "none");
            }
            var model = {
                file_path: file_path,
                destination: destination,
                agent: agentName,
                ip: ip
            }
            debugger;
            $.ajax({
                url: `/uploads/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


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
        else if (id == '16') {

            var model = {
                agent: agentName
            }
            debugger;
            $.ajax({
                url: `/windefstat/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


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
        else if (id == '17') {

            var model = {
                agent: agentName
            }
            debugger;
            $.ajax({
                url: `/namedpipes/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


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
        else if (id == '18') {

            var model = {
                agent: agentName
            }
            debugger;
            $.ajax({
                url: `/juicypotato/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


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

        setTimeout(function () { GetFileResults(agentName); }, 5000);

    },


    StartLinuxAttack: function (id) {
        //Apache
        if (id == '19') {

            debugger;
            var model = {
                agent: agentName
            }

            debugger;
            $.ajax({
                url: `/apache/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;
                    if (data) {

                        debugger;

                        Swal.fire({
                            title: "Done",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'success',
                            confirmButtonColor: '#26B99A',
                        }).then((result) => {

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
        }
        // Available Shell
        else if (id == '20') {

            debugger;
            var model = {
                agent: agentName
            }

            debugger;
            $.ajax({
                url: `/availableshell/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;
                    if (data) {

                        debugger;

                        Swal.fire({
                            title: "Done",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'success',
                            confirmButtonColor: '#26B99A',
                        }).then((result) => {

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

        }
        // Cronjobs
        else if (id == '21') {

            debugger;
            var model = {
                agent: agentName
            }

            debugger;
            $.ajax({
                url: `/cronjobs/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;
                    if (data) {

                        debugger;

                        Swal.fire({
                            title: "Done",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'success',
                            confirmButtonColor: '#26B99A',
                        }).then((result) => {

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

        }
        //Hidden Files
        else if (id == '22') {

            debugger;
            var model = {
                agent: agentName
            }

            debugger;
            $.ajax({
                url: `/hiddenfiles/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;
                    if (data) {

                        debugger;

                        Swal.fire({
                            title: "Done",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'success',
                            confirmButtonColor: '#26B99A',
                        }).then((result) => {

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

        }
        //Lsof
        else if (id == '23') {

            debugger;
            var model = {
                agent: agentName
            }

            debugger;
            $.ajax({
                url: `/lsof/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;
                    if (data) {

                        debugger;

                        Swal.fire({
                            title: "Done",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'success',
                            confirmButtonColor: '#26B99A',
                        }).then((result) => {

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

        }
        //OS info
        else if (id == '24') {

            debugger;
            var model = {
                agent: agentName
            }

            debugger;
            $.ajax({
                url: `/osinfo/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;
                    if (data) {

                        debugger;

                        Swal.fire({
                            title: "Done",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'success',
                            confirmButtonColor: '#26B99A',
                        }).then((result) => {

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

        }
        //Processes
        else if (id == '25') {

            debugger;
            var model = {
                agent: agentName
            }

            debugger;
            $.ajax({
                url: `/processeslinux/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;
                    if (data) {

                        debugger;

                        Swal.fire({
                            title: "Done",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'success',
                            confirmButtonColor: '#26B99A',
                        }).then((result) => {

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

        }
        //Selinux
        else if (id == '26') {

            debugger;
            var model = {
                agent: agentName
            }

            debugger;
            $.ajax({
                url: `/selinux/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;
                    if (data) {

                        debugger;

                        Swal.fire({
                            title: "Done",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'success',
                            confirmButtonColor: '#26B99A',
                        }).then((result) => {

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

        }
        //SpecialPermissions
        else if (id == '27') {

            debugger;
            var model = {
                agent: agentName
            }

            debugger;
            $.ajax({
                url: `/specialpermissions/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;
                    if (data) {

                        debugger;

                        Swal.fire({
                            title: "Done",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'success',
                            confirmButtonColor: '#26B99A',
                        }).then((result) => {

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

        }
        //TCP_UDP
        else if (id == '28') {

            debugger;
            var model = {
                agent: agentName
            }

            debugger;
            $.ajax({
                url: `/tcpudp/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;
                    if (data) {

                        debugger;

                        Swal.fire({
                            title: "Done",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'success',
                            confirmButtonColor: '#26B99A',
                        }).then((result) => {

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

        }
        //usr_priv
        else if (id == '29') {

            debugger;
            var model = {
                agent: agentName
            }

            debugger;
            $.ajax({
                url: `/userpermissions/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;
                    if (data) {

                        debugger;

                        Swal.fire({
                            title: "Done",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'success',
                            confirmButtonColor: '#26B99A',
                        }).then((result) => {

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

        }
        //Usrs info
        else if (id == '30') {

            debugger;
            var model = {
                agent: agentName
            }

            debugger;
            $.ajax({
                url: `/userinfo/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;
                    if (data) {

                        debugger;

                        Swal.fire({
                            title: "Done",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'success',
                            confirmButtonColor: '#26B99A',
                        }).then((result) => {

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

        }
        //Whoami
        else if (id == '31') {

            debugger;
            var model = {
                agent: agentName
            }

            debugger;
            $.ajax({
                url: `/whoami/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;
                    if (data) {

                        debugger;

                        Swal.fire({
                            title: "Done",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'success',
                            confirmButtonColor: '#26B99A',
                        }).then((result) => {

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
                agent: agentName
            }

            debugger;
            $.ajax({
                url: `/linuxChangeDirectory/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

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
                agent: agentName
            }

            debugger;
            $.ajax({
                url: `/linuxChmod/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

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
                agent: agentName
            }

            debugger;
            $.ajax({
                url: `/linuxcp/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                    });


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
                option:option,
                bfile:bfile
            }

            debugger;
            $.ajax({
                url: `/linuxgcc/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                    });


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
                agent: agentName
            }

            debugger;
            $.ajax({
                url: `/linuxDirectoryListingDetails/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                    });


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
                agent: agentName
            }

            debugger;
            $.ajax({
                url: `/linuxDirectoryListing/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                    });


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
                agent: agentName
            }

            debugger;
            $.ajax({
                url: `/linuxMakeDirectory/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                    });


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
                atr:atr
            }

            debugger;
            $.ajax({
                url: `/linuxNetdiscover/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                    });


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
        else if (id == '59'){
            var fileName = $("#fileName").val();
        debugger;
            if (fileName == '' || fileName == undefined || fileName == null) {
                $("#fileNameValidation").css("display", "block");
                return;
            }
            else {
                $("#fileNameValidation").css("display", "none");
            }
            var model = {
                fileName: fileName,
                agent: agentName
            }

            debugger;
            $.ajax({
                url: `/linuxTouch/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                    });


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
                path: path,
                agent: agentName
            }

            debugger;
            $.ajax({
                url: `/linuxBash/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                    });


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
        else if (id == '61'){
            var arg = $("#arg").val();

            if (path == '' || path == undefined || path == null) {
                $("#argValidation").css("display", "block");
                return;
            }
            else {
                $("#argValidation").css("display", "none");
            }
            var model = {
                path: path,
                agent: agentName
            }

            debugger;
            $.ajax({
                url: `/linuxWfuzz/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                    });


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
                agent: agentName
            }

            debugger;
            $.ajax({
                url: `/executeCommandWithSpecUser/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {
                    });


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
        


        setTimeout(function () { GetFileResults(agentName); }, 5000);
    },

    StartActiveDirectoryAttack: function (id) {

        if (id == '32') {
            debugger;
            var model = {
                agent: agentName
            }

            debugger;
            $.ajax({
                url: `/accsforkerb/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;
                    if (data) {

                        debugger;

                        Swal.fire({
                            title: "AppLocker Rules Start",
                            text: '',
                            confirmButtonText: "Ok",
                            icon: 'success',
                            confirmButtonColor: '#26B99A',
                        }).then((result) => {

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

        }
        else if (id == '33') {

            var model = {
                agent: agentName
            }
            debugger;
            $.ajax({
                url: `/acclisting/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


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
        else if (id == '34') {

            var model = {
                agent: agentName
            }
            debugger;
            $.ajax({
                url: `/adapter/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


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
        else if (id == '35') {

            var model = {
                agent: agentName
            }
            debugger;
            $.ajax({
                url: `/arptable/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


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
        else if (id == '36') {

            var model = {
                agent: agentName
            }
            debugger;
            $.ajax({
                url: `/defensecheck/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


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
        else if (id == '37') {

            var model = {
                agent: agentName
            }
            debugger;
            $.ajax({
                url: `/domaininfo/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


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
        else if (id == '38') {

            var model = {
                agent: agentName
            }
            debugger;
            $.ajax({
                url: `/domainusers/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


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
        else if (id == '39') {

            var model = {
                agent: agentName
            }
            debugger;
            $.ajax({
                url: `/downloadwindows/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


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
        else if (id == '40') {

            var model = {
                agent: agentName
            }
            debugger;
            $.ajax({
                url: `/envactivedirectoryvalue/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


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
        else if (id == '41') {

            var model = {
                agent: agentName
            }
            debugger;
            $.ajax({
                url: `/groupslisting/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


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
        else if (id == '42') {

            var model = {
                agent: agentName
            }
            debugger;
            $.ajax({
                url: `/groups/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


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
        else if (id == '43') {

            var model = {
                agent: agentName
            }
            debugger;
            $.ajax({
                url: `/hotfixes/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


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
        else if (id == '44') {

            var model = {
                agent: agentName
            }
            debugger;
            $.ajax({
                url: `/ip4route/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


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
        else if (id == '45') {

            var model = {
                agent: agentName
            }
            debugger;
            $.ajax({
                url: `/listexecpolicies/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


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
        else if (id == '46') {

            var model = {
                agent: agentName
            }
            debugger;
            $.ajax({
                url: `/listingmodules/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


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
        else if (id == '47') {

            var model = {
                agent: agentName
            }
            debugger;
            $.ajax({
                url: `/defensecheck/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


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
        else if (id == '48') {

            var model = {
                agent: agentName
            }
            debugger;
            $.ajax({
                url: `/sysacclisting/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


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
        else if (id == '49') {

            var model = {
                agent: agentName
            }
            debugger;
            $.ajax({
                url: `/trustmap/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


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
        else if (id == '50') {

            var model = {
                agent: agentName
            }
            debugger;
            $.ajax({
                url: `/trustrelation/`,
                type: "POST",
                data: model,
                success: function (data) {
                    debugger;

                    Swal.fire({
                        title: "Done",
                        text: '',
                        confirmButtonText: "Ok",
                        icon: 'success',
                        confirmButtonColor: '#26B99A',
                    }).then((result) => {

                    });


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
        setTimeout(function () { GetFileResults(agentName); }, 5000);

    },

}

var TasksDraw = {

    DrawDataTable: function () {

        //debugger;
        var listItems = '';
        var module_typeName = '';
        $.each(TasksData.allModules, function (key, value) {
            if (value.module_type == 1)
                module_typeName = "Windows Task"
            else if (value.module_type == 2)
                module_typeName = "Linux Task"
            else
                module_typeName = 'Active Directory'

            listItems += `<tr>
                            <td>${value.module_name}</td>
                            <td>${module_typeName}</td>
                            <td>${moment(value.created_date).format('MM/DD/YYYY')}</td>
                          </tr> `;
        });
        $('#bodyData').append(listItems);
        $("#example1").DataTable({
            "responsive": true, "lengthChange": false, "autoWidth": false,
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
        debugger;
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

        else {
            html = ` <div class="form-group">
                        <label>Modules</label>
                        <select class="form-control select2bs4" placeholder="Modules"
                            id="selectModules" onchange="TasksDraw.DrawActiveDirectoryList(event)" style="width: 100%;">

                        </select>
                    </div>`;
            TasksData.filterdModules = TasksData.allModules.filter(x => x.module_type == 3);
        }


        $.each(TasksData.filterdModules, function (key, value) {
            listItems += ` <option data-type='${value.module_type}' value='${value.id}'>${value.module_name}</option> `;
        });
        //debugger;



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
            id == '14' || id == '16' || id == '17') {

            var html = `  <div class="col-4">
                           <button class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start Task</button>
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
                               <button class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start  DirectoryListing Task</button>
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
                               <button class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start Download Task</button>
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
                                <button class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start Phrase Finder Task</button>
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
                               <button class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start Download Task</button>
                               </div>
                           </div>`

            $("#ModuleTask").html(html);
        }
        else if (id == '18') {
            var html = `  <div class="col-8">
                        <div class="form-group">
                            <label for="URL">Path Of Juicy On Victim</label>
                            <input type="text" class="form-control" style="width:100%" maxlength="100" id="pathOfJuicyOnVictim" placeholder="Path">
                            <span type="text" class="text-danger font-weight-bold" id="pathOfJuicyOnVictimValidation"
                            style="display: none;">Please Enter Path</span>
                        </div>               
                            <div class="col-3">
                            <button class="btn btn-info" onclick="TasksData.StartWindowsAttack('${id}')">Start Task</button>
                            </div>
                        </div>`

            $("#ModuleTask").html(html);
        }
    },

    DrawLinuxTasks: function (event) {
        debugger;
        var strId = event.target.value;
        var id = parseInt(strId);
        if (id >= 19 && id <= 31) {
            var html = `  <div class="col-4">
                                    <button class="btn btn-info" onclick="TasksData.StartLinuxAttack('${id}')">Start Task</button>
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
                                <button class="btn btn-info" onclick="TasksData.StartLinuxAttack('${id}')">Start Task</button>
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
                                <button class="btn btn-info" onclick="TasksData.StartLinuxAttack('${id}')">Start Task</button>
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
                                <button class="btn btn-info" onclick="TasksData.StartLinuxAttack('${id}')">Start Task</button>
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
                            <button class="btn btn-info" onclick="TasksData.StartLinuxAttack('${id}')">Start Task</button>
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
                                <button class="btn btn-info" onclick="TasksData.StartLinuxAttack('${id}')">Start Task</button>
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
                                <button class="btn btn-info" onclick="TasksData.StartLinuxAttack('${id}')">Start Task</button>
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
                                <button class="btn btn-info" onclick="TasksData.StartLinuxAttack('${id}')">Start Task</button>
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
                                <button class="btn btn-info" onclick="TasksData.StartLinuxAttack('${id}')">Start Task</button>
                                </div>
                            </div>`

            $("#ModuleTask").html(html);
        }
        else if (id == '59') {
            debugger;
            var html = `  <div class="col-8">
                                <div class="form-group">
                                    <label for="FileName">FileName</label>
                                    <input type="text" class="form-control" style="width:100%" maxlength="100" id="fileName" placeholder="FileName">
                                    <span type="text" class="text-danger font-weight-bold" id="fileNameValidation"
                                    style="display: none;">Please Enter FileName</span>
                                </div>
                                <div class="col-3">
                                <button class="btn btn-info" onclick="TasksData.StartLinuxAttack('${id}')">Start Task</button>
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
                                <button class="btn btn-info" onclick="TasksData.StartLinuxAttack('${id}')">Start Task</button>
                                </div>
                            </div>`

            $("#ModuleTask").html(html);
        }
        else if (id == '61') {
            var html = `  <div class="col-8">
                                <div class="form-group">
                                    <label for="Arg">Arg</label>
                                    <input type="text" class="form-control" style="width:100%" maxlength="100" id="arg" placeholder="Arg">
                                    <span type="text" class="text-danger font-weight-bold" id="argValidation"
                                    style="display: none;">Please Enter Arg</span>
                                </div>
                                <div class="col-3">
                                <button class="btn btn-info" onclick="TasksData.StartLinuxAttack('${id}')">Start Task</button>
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
                        <button class="btn btn-info" onclick="TasksData.StartLinuxAttack('${id}')">Start Task</button>
                        </div>
                    </div>`

            $("#ModuleTask").html(html);
        }
    },
    DrawActiveDirectoryList: function (event) {
        debugger;
        var id = event.target.value;
        if (id >= 32 && id <= 50 && id != 39) {

            var html = `  <div class="col-4">
                           <button class="btn btn-info" onclick="TasksData.StartActiveDirectoryAttack('${id}')">Start Task</button>
                        </div>`

            $("#ModuleTask").html(html);

        }
    },
}

function GetFileResults(agentName) {
    debugger;
    $.ajax({
        url: `/getFileResult/${agentName}`,
        type: "GET",
        success: function (data) {
            debugger;
            //var filterData = data.replace(/\n/g, '')
            $("#fileResults").html(data)
        },
        error: function () {
            alert("Error");
        }
    });

}

$(document).ready(function () {
    TasksData.GetData();
    GetFileResults(agentName);
});


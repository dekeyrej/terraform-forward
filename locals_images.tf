locals {
  images = {
    kvm = {
      ubuntu = {
        "24" = "local:import/ubuntu-24.04-cloudimg-amd64.qcow2",
        "25" = "local:import/ubuntu-25.10-cloudimg-amd64.qcow2"
      },
      debian = {
        "12" = "local:import/debian-12-generic-amd64.qcow2",
        "13" = "local:import/debian-13-generic-amd64.qcow2"
      },
      centos = {
        "9" = "local:import/centos-9-stream-latest-x86_64.qcow2",
        "10" = "local:import/centos-10-stream-latest-x86_64.qcow2"
      },
      amazon = {
        "2" = "local:import/amzn2-kvm-x86_64.xfs.gpt.qcow2",
        "2023" = "local:import/al2023-kvm-x86_64.xfs.gpt.qcow2"
      }
    },
    lxc = {
      ubuntu = {
        "24" = "local:vztmpl/ubuntu-noble-latest-custom.tar.xz",
        "25" = "local:vztmpl/ubuntu-questing-latest-custom.tar.xz"
      },
      debian = {
        "12" = "local:vztmpl/debian-bookworm-latest-custom.tar.xz",
        "13" = "local:vztmpl/debian-trixie-latest-custom.tar.xz"
      },
      centos = {
        "9" = "local:vztmpl/centos-9-stream-latest-custom.tar.xz",
        "10" = "local:vztmpl/centos-10-stream-latest-custom.tar.xz"
      }
    }
  }
}

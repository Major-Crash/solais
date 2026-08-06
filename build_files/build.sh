#!/bin/bash

set -ouex pipefail

# Copy the contents of system_files/ of the git repo to /
cp -avf "/ctx/system_files"/. /

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/43/x86_64/repoview/index.html&protocol=https&redirect=1

CUSTOM_PACKAGES=(
    niri
    dms
    plasma-oxygen
    oxygen-icon-theme
    plasma-union
    dankcalendar-git
    qt6ct-kde
    mako
    swaybg
    swayidle
)

dnf5 -y copr enable avengemedia/dms
dnf5 -y copr enable yalter/niri fedora-44-x86_64
dnf5 -y install "${CUSTOM_PACKAGES[@]}"
dnf5 -y copr disable avengemedia/dms
dnf5 -y copr disable yalter/niri

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

# Assignment 04 - USB Keyboard Hotplug

## Objective
The objective of this assignment is to configure our simple kernel module to automatically load when a USB Keyboard is plugged in, by modifying the C code to define device support and using a user-space hotplug rule (e.g., `udev`).

## Explanation
To demonstrate an understanding of the subject, here are the key concepts for this assignment:

1.  **Uevents and Udev:** When hardware is connected to a system, the kernel detects it and sends a "uevent" (user-space event) containing information about the device (subsystem, vendor, product ID, etc.). A user-space daemon like `udev` intercepts this and triggers defined actions, such as running a script or loading a driver via `modprobe`.
2.  **`MODULE_DEVICE_TABLE` Macro:** This macro is used within the kernel module code to expose supported devices to user space. By declaring a `usb_device_id` table with the specific classes for a USB Keyboard (`bInterfaceClass = USB_INTERFACE_CLASS_HID` and `bInterfaceProtocol = USB_INTERFACE_PROTOCOL_KEYBOARD`), `depmod` extracts it during module installation to build `modules.alias`.
3.  **Automatic Module Loading:** When the uevent is fired, it provides an `MODALIAS` variable. Programs like `udev` or `systemd-udevd` read this and call `modprobe` to search `modules.alias` for any module claiming to support that hardware alias, automatically loading our driver.
4.  **Udev Rules:** While `MODULE_DEVICE_TABLE` enables standard driver loading, custom udev rules in `/etc/udev/rules.d/` explicitly define behavior matching specific parameters (`SUBSYSTEM=="usb"`, `ACTION=="add"`) to trigger `modprobe` of our custom module name.

## How to Verify
To verify the completion of the assignment, the evaluator can test the following:

1.  **Setup the Rule:**
    Install the module and copy the custom `udev` rules file to the configuration directory:
    ```bash
    sudo cp <rules-file>.rules /etc/udev/rules.d/
    sudo udevadm control --reload-rules
    ```
    If using `depmod`, install the module to the active kernel modules tree and update dependencies:
    ```bash
    sudo cp main.ko /lib/modules/$(uname -r)/
    sudo depmod -a
    ```

2.  **Trigger the Event:**
    Physically unplug and plug back in a USB keyboard. Alternatively, simulate the kernel event for USB additions:
    ```bash
    sudo udevadm trigger --action=add --subsystem-match=usb
    ```

3.  **Check Verification:**
    Verify if the module was loaded automatically by `udev`/`kmod`:
    ```bash
    lsmod | grep main
    dmesg | tail -n 1
    ```
    *Expected output:* `lsmod` shows the module, and `dmesg` confirms the "Hello world!" initialization message has been triggered by the hotplug event.
